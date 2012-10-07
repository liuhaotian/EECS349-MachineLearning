function decisiontree (inputFileName, trainingSetSize, numberOfTrials, verbose)
	disp(sprintf('Input File Name : %s\n', inputFileName));
	disp(sprintf('Traning Set Size: %d\n', trainingSetSize));
	disp(sprintf('Number Of Trials: %s\n', numberOfTrials));
	disp(sprintf('Verbose Mode    : %s\n', verbose));



	fd_in	= fopen(inputFileName);
	while tempdata=fgetl(fd_in)
		data = [data, textscan(tempdata,'%s')]
	end
	fclose(fd_in)

end




exit