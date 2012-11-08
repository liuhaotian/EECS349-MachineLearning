function [mu, sigmasq, wt, L] = gmmest(X, mu_init, sigmasq_init, wt_init, its)
    mu     	= mu_init;
    sigmasq = sigmasq_init;
    wt      = wt_init;
    for i = 1:its
    	%	calc the normpdf
        p = exp(-(ones(size(mu))' * X - mu' * ones(size(X))).^2 ./ 2 ./ (sigmasq' * ones(size(X)))) ./ sqrt(2 .* pi .* (sigmasq' * ones(size(X)))) .* (wt' * ones(size(X)));
        p = p ./ (ones(size(mu))' * sum(p, 1));
        %	at this point, we get the p(j,i), K-by-N, the normalized p.
        
        %	for some p, 0/0 = NaN, but actually it is 0
        p(~((p > 0) + (p == 0))) = 0;

        %	calc the weight
        wt = sum(p, 2) / size(X, 2);

        %	calc the mu
        mu = sum(p .*  (ones(size(mu))' * X), 2) ./ sum(p, 2);

        %	calc the sigmasq
        sigmasq = sum(p .* (ones(size(mu))' * X - mu' * ones(size(X))).^2, 2) ./ sum(p, 2);
	end
	L = 0;

end