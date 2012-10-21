function threefoldpolyreg(k)
	%	load the input
	load linearreg.mat

	%	build the fold

	foldarray = zeros(length(X),1);
	while sum(foldarray == 1) ~= length(X)/3
		foldarray(random('unid',length(X))) = 1;
	end
	while sum(foldarray == 2) ~= sum(foldarray ~= 1)/2
		therand = random('unid',length(X));
		foldarray(therand) = 2 - foldarray(therand);
	end
	for i = 1:length(X)
		if ~ foldarray(i)
			foldarray(i) = 3;
		end
	end

end