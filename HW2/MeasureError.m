function errorRate = MeasureError(typo, trueword, dictionary, deletionCost, insertionCost, substitutionCost)
	%	init the return value
	errorRate = 0;
	errorCount = 0;

	%	default value
	if ~exist('deletionCost')
		deletionCost = 2;
	end
	if ~exist('insertionCost')
		insertionCost = 2;
	end
	if ~exist('substitutionCost')
		substitutionCost = 2;
	end

	%	check input
	typo_size = length(typo);
	true_size = length(trueword);
	if typo_size ~= true_size
		disp('MeasureError.m: input size not match!');
		return
	end

	for i = 1:typo_size
		if ~strcmp(trueword{i},FindClosestWord(typo{i}, dictionary, deletionCost, insertionCost, substitutionCost))
			errorCount = errorCount + 1;
		end
	end

	errorRate = errorCount / typo_size;
end