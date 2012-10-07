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



end