function word_out = FindClosestWord(word_in, dict_array, deletionCost, insertionCost, substitutionCost)
	%	init the word_out
	word_out = dict_array{1};

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

	%	get the length of dict, word
	dict_size = length(dict_array);
	word_size = length(word_in);

	%	handle error
	if word_size == 0
		word_out = '';
	end

	%	set the cost
	deletionCost = 2;
	insertionCost = 2;
	substitutionCost = 2;


	mini = word_size * deletionCost;
	for i = 1:dict_size
		if length(dict_array{i}) < mini / insertionCost + word_size && length(dict_array{i}) > word_size - mini / deletionCost
			[mini, index] = min([LevenshteinDistance(word_in, dict_array{i}, deletionCost, insertionCost, substitutionCost),mini]);
			if index == 1
				word_out = dict_array{i};
			end
		end
	end


end