function [ret] = decisiontree (inputFileName, trainingSetSize, numberOfTrials, verbose)
	disp(sprintf('Input File Name : %s\n', inputFileName));
	disp(sprintf('Traning Set Size: %d\n', trainingSetSize));
	disp(sprintf('Number Of Trials: %d\n', numberOfTrials));
	disp(sprintf('Verbose Mode    : %s\n', verbose));


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
	for i = 2:length(data)-1
		for j = 1:length(data{1})
			matrix(i,j) = strcmp(data{i}{j},'true');
		end
	end

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

	ret = 0;
end