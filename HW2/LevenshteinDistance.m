function dist = LevenshteinDistance(s, t, deletionCost, insertionCost, substitutionCost)
	
	%	init the return value
	dist = 0;

	%	get the s,t info
	s_size = length(s);
	t_size = length(t);

	%	build the dist matrix
	d = zeros(s_size + 1, t_size + 1);
	d(1:s_size + 1, 1) = [0:s_size] * deletionCost;
	d(1, 1:t_size + 1) = [0:t_size] * insertionCost;
 


end