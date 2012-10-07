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

	for j = 1:numberOfTrials

		%	trials info
		disp(sprintf('=========== %dth trial ==========', j));

		%	random matrix
		tempdata = zeros(1, length(data) - 1);
		while sum(tempdata) ~= trainingSetSize
			tempdata(random('unid',length(data) - 1)) = 1;
		end

		%	training set & testing set
		trainingset = [];
		testingset  = [];
		for i = 1:length(tempdata)
			if tempdata(i) == 1
				trainingset = [trainingset; matrix(i,:)];
			else
				testingset = [testingset; matrix(i,:)];
			end
		end

		%	get decision tree
		root = id3(trainingset, 1:length(data{1})-1, length(data{1}));

		%	print tree
		printtree(root, '|', data{1});


		%	calc all
		temptrainingset = {{data{1}{:},'ID3','Prior'};{data{1}{:},'ID3','Prior'}}
		temptestingset = {{data{1}{:},'ID3','Prior'};{data{1}{:},'ID3','Prior'}}
		for i = 1:length(tempdata)
			if tempdata(i) == 1
				if classify(root, matrix(i,:))
					id3score = 'true';
				else
					id3score = 'false';
				end
				priorscore = 'true';
				temptrainingset{i+1} = {data{i+1}{:}, id3score, priorscore};
			else
				if classify(root, matrix(i,:))
					id3score = 'true';
				else
					id3score = 'false';
				end
				priorscore = 'true';
				temptestingset{i+1} = {data{i+1}{:}, id3score, priorscore};
			end
		end
		
		%	verbose debug
		if verbose == '1'
			disp('Training Set:');
			disp(temptrainingset);
			disp('Testing Set:');
			disp(temptestingset);
		end

	end
end