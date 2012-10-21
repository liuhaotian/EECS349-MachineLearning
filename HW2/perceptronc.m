function [w,k] = perceptronc(w_init,X,Y)
	%	initialize w k
	w = w_init;
	k = 0;

	%	transform, (x,x^2) 
	X = [X(:,1), X(:,1).^2, X(:,2)];
	w = [w(:,1), w(:,1).^2, w(:,2)];

	%	Sequential Perceptron Algo
	while sum(sign(w*X')' ~= Y)
		k = k + 1;
		if sign(w*X(mod(k, length(X)) + 1,:)') ~= Y(mod(k, length(X)) + 1)
			w = w + X(mod(k, length(X)) + 1,:) * Y(mod(k, length(X)) + 1);
            plot(X(Y==1,1),X(Y==1,2),'o',X(Y==-1,1),X(Y==-1,2),'o',X(:,1),-w(3)/w(2)-w(1)/w(2)*X(:,1),'x');
		end 
	end

end