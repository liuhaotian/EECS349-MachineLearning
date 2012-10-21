function [w,k] = perceptronc(w_init,X,Y)
	%	initialize w k
	w = w_init;
	k = 0;

	%	transform
	X = [X(:,1), X(:,1).^2, X(:,2)];
	w = [w(:,1), w(:,1).^2, w(:,2)];

	%	Sequential Perceptron Algo
	while sum(sign(w*X')' ~= Y)
		k = mod(k, length(X)) + 1;
		if sign(w*X(k,:)') ~= Y(k)
			w = w + X(k,:) * Y(k);
            plot(X(Y==1,1),X(Y==1,2),'o',X(Y==-1,1),X(Y==-1,2),'o',X(:,1),-w(3)/w(2)-w(1)/w(2)*X(:,1),'x');
		end 
	end

end