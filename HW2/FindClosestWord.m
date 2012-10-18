function word_out = FindClosestWord(word_in, dict_array)
	%	init the word_out
	word_out = dict_array{1};

	%	get the length of dict, word
	dict_size = length(dict_array);
	word_size = length(word_in);

	%	set the cost
	deletionCost = 2;
	insertionCost = 2;
	substitutionCost = 2;


	mini = word_size * deletionCost;
	for i = 1:dict_size
		if length(dict_array{i}) < mini / insertionCost + word_size || length(dict_array{i}) > word_size - mini / deletionCost
			mini = min(LevenshteinDistance(word_in, dict_array{i}, deletionCost, insertionCost, substitutionCost),mini);
			word_out = dict_array{i};
		end
	end


end