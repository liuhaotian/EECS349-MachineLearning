function decisiontree (inputFileName, trainingSetSize, numberOfTrials, verbose)
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
	tempdata = fclose(fd_in)

	%	form matrix
	matrix = ones(length(data) - 1, length(data{1}))
	for i = 2:length(data)
		for j = 1:length(data{1})
			if data{i}{j} == 'true'
				matrix(i,j) = 1;
			else
				matrix(i,j) = 0;
			end
		end
	end

end