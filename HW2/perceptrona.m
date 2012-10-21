function [w,k] = perceptrona(w_init,X,Y)
	%	initialize w k
	w = w_init;
	k = 0;

	%	Sequential Perceptron Algo
	while sum(xor(((X > w) - (X < w) + 2) / 2, (Y + 2) / 2))
		k = mod(k, length(X)) + 1;
		if polyval(w, X(k)) ~= Y(k)
			w = w + X(k) .* Y(k);
		end 
	end

end