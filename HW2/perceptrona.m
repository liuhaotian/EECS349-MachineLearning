function [w,k] = perceptrona(w_init,X,Y)
	%	initialize w k
	w = w_init;
	k = 0;

	%	Sequential Perceptron Algo
	while sum(sign(polyval(w, X(:,1))) ~= Y)
		k = mod(k, length(X)) + 1;
		if sign(polyval(w, X(k,1))) ~= Y(k)
			w = w + X(k,:) * Y(k);
		end 
	end

end