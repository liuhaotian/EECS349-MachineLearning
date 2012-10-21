function [w,k] = perceptrona(w_init,X,Y)
	%	initialize w k
	w = w_init;
	k = 0;

	%	Sequential Perceptron Algo
	while sum(sign(polyval(w, X(:,1))) ~= Y)
		k = k + 1;
		if sign(polyval(w, X(mod(k, length(X)) + 1,1))) ~= Y(mod(k, length(X)) + 1)
			w = w + X(mod(k, length(X)) + 1,:) * Y(mod(k, length(X)) + 1);
		end 
	end

end