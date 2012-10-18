function dist = LevenshteinDistance(s, t, deletionCost, insertionCost, substitutionCost)
	
	%	init the return value
	dist = 0;

	%	get the s,t info
	s_size = length(s);
	t_size = length(t);

	%	check input
	if s_size == 0
		return
	elseif t_size == 0
		return
	elseif deletionCost < 0
		return
	elseif insertionCost < 0
		return
	elseif substitutionCost < 0
		return
	end

	%	build the dist matrix
	d = zeros(s_size + 1, t_size + 1);
	d(1:s_size + 1, 1) = (0:s_size) * deletionCost;
	d(1, 1:t_size + 1) = (0:t_size) * insertionCost;
 
	%	calc the dist
	for j = 2:t_size+1
		for i = 2:s_size+1
			if s(i-1) == t(j-1)
				d(i,j) = d(i-1,j-1);
			else
				d(i,j) = min([
							d(i-1,j) + deletionCost,
							d(i,j-1) + insertionCost,
							d(i-1,j-1) + substitutionCost
							]);
			end
		end
	end

	dist = d(s_size+1, t_size+1);
end