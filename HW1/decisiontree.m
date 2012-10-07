function decisiontree (inputFileName, trainingSetSize, numberOfTrials, verbose)
	disp(sprintf('Input File Name : %s', inputFileName));
	disp(sprintf('Traning Set Size: %d', trainingSetSize));
	disp(sprintf('Number Of Trials: %d', numberOfTrials));
	disp(sprintf('Verbose Mode    : %s', verbose));


	%	read file
	fd_in = fopen(inputFileName);
	tempdata = fgetl(fd_in);
	data = [];
	while tempdata ~= -1
		data = [data, textscan(tempdata,'%s')];
		tempdata = fgetl(fd_in);
	end
	tempdata = fclose(fd_in);

	%	form matrix
	matrix = ones(length(data) - 1, length(data{1}));
	for i = 1:length(data)-1
		for j = 1:length(data{1})
			matrix(i,j) = strcmp(data{i+1}{j},'true');
		end
	end

	%	random matrix
	tempdata = zeros(1, length(data) - 1);
	while sum(tempdata) ~= trainingSetSize
		tempdata(random('unid',length(data) - 1)) = 1;
	end

	%	training set & testing set
	trainingset = [];
	temptrainingset = transpose(data{1});
	testingset  = [];
	temptestingset = transpose(data{1});
	for i = 1:length(tempdata)
		if tempdata(i) == 1
			trainingset = [trainingset; matrix(i,:)];
			temptrainingset = [temptrainingset; transpose(data{i+1})];
		else
			testingset = [testingset; matrix(i,:)];
			temptestingset = [temptestingset; transpose(data{i+1})];
		end
	end
	if verbose == '1'
		disp('Training Set:');
		disp(temptrainingset);
		disp('Testing Set:');
		disp(temptestingset);
	end

	%	get decision tree
	root = id3(trainingset, 1:length(data{1})-1, length(data{1}));

	%	print tree
	printtree(root, '|', data{1});
end