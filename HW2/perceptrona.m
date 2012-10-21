function [w,k] = perceptrona(w_init,X,Y)
	%	initialize w k
	w = w_init;
	k = 0;

	%	Sequential Perceptron Algo
	while sum(polyval(w, X) ~= Y)
		k = mod(k, length(X)) + 1;
		if polyval(w, X(k)) ~= Y(k)
			w = w + X(k) .* Y(k);
			plot(X,Y,'o',X,polyval(w,X),'x');
		end 
	end

end