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

	%	global variables for id3 counter, id3 hit, prior counter, prior hit
	gid3 = 0;
	gid3hit = 0;
	gpri = 0;
	gprihit = 0;

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
		disp('Decision Tree:');
		printtree(root, '|', data{1});


		%	calc all
		temptrainingset = [transpose(data{1}),'ID3','Prior'];
		temptestingset = [transpose(data{1}),'ID3','Prior'];
		prior = sum(trainingset(:,length(data{1}))) > length(trainingset) /2;
		if prior
			priorscore = 'true';
		else
			priorscore = 'false';
		end
		for i = 1:length(tempdata)
			if tempdata(i) == 1
				if classify(root, matrix(i,:))
					id3score = 'true';
				else
					id3score = 'false';
				end
				temptrainingset = [temptrainingset;transpose(data{i+1}), id3score, priorscore];
			else
				if classify(root, matrix(i,:))
					id3score = 'true';
				else
					id3score = 'false';
				end
				temptestingset = [temptestingset;transpose(data{i+1}), id3score, priorscore];
			end
		end
		
		%	verbose debug
		if verbose == '1'
			disp(sprintf('\nTraining Set:'));
			disp(temptrainingset);
			disp('Testing Set:');
			disp(temptestingset);
		end

		%	calc correctness
		total = length(testingset(:,1));
		numofcurrect = 0;
		numofcurrectprior = 0;
		for i = 1:total
			numofcurrect = numofcurrect + (classify(root, testingset(i,:)) == testingset(i,length(testingset(1,:))));
			numofcurrectprior = numofcurrectprior + (prior == testingset(i,length(testingset(1,:))));
		end
		disp(sprintf('ID3   Correctnes: %d/%d', numofcurrect, total));
		disp(sprintf('Prior Correctnes: %d/%d', numofcurrectprior, total));
		gid3 = gid3 + total;
		gpri = gpri + total;
		gid3hit = gid3hit + numofcurrect;
		gprihit = gprihit + numofcurrectprior;

	end
	disp(sprintf('\n=========== Performance =========='));
	disp(sprintf('Mean perf for ID3  : %.2f', gid3hit/gid3));
	disp(sprintf('Mean perf for Prior: %.2f', gprihit/gpri));
end