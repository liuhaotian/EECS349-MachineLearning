function errorRate = MeasureError(typo, trueword, dictionary)
	%	init the return value
	errorRate = 0;
	errorCount = 0;

	%	check input
	typo_size = length(typo);
	true_size = length(trueword);
	if typo_size ~= true_size
		disp('MeasureError.m: input size not match!');
		return
	end

	for i = 1:typo_size
		if ~strcmp(trueword{i},FindClosestWord(typo{i}, dictionary))
			errorCount = errorCount + 1;
		end
	end

	errorRate = errorCount / typo_size;
end