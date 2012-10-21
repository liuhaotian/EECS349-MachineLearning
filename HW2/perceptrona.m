function [w,k] = perceptrona(w_init,X,Y)
	%	initialize w k
	w = w_init;
	k = 0;

	%	Sequential Perceptron Algo
	while sum(((X > w) - (X < w)) ~= Y)
		k = mod(k, length(X)) + 1;
		if ((X(k) > w) - (X(k) < w)) ~= Y(k)
			w = w + (X(k) - w) .* Y(k);
		end 
	end

end