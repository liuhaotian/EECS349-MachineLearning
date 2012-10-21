function threefoldpolyreg()
	%	load the input
	load linearreg.mat

	%	build the fold
	foldarray = zeros(length(X),1);
		%	set 10 instance w/ flag 1
	while sum(foldarray == 1) ~= length(X)/3
		foldarray(random('unid',length(X))) = 1;
	end
		%	set 10 instance w/ flag 2
	while sum(foldarray == 2) ~= sum(foldarray ~= 1)/2
		therand = random('unid',length(X));
		foldarray(therand) = 2 - foldarray(therand);
	end
		%	set 10 instance w/ flag 3
	for i = 1:length(X)
		if ~ foldarray(i)
			foldarray(i) = 3;
		end
	end

	mse = zeros(10,3);
	for k = 1:10
		for i = 1:3
			mse(k,i) = std(polyval(polyfit(X(foldarray ~= i), Y(foldarray ~= i), k-1), X(foldarray == i)) - Y(foldarray == i));
		end
	end
	plot(0:9, mean(mse,2));

end