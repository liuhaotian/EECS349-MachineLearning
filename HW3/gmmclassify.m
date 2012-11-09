function Y = gmmclassify(X, mu1, sigmasq1, wt1, mu2, sigmasq2, wt2, p1)
    %   combine the two models with p1 weighted
    mu      = [mu1, mu2];
    sigmasq = [sigmasq1, sigmasq2];
    wt      = [wt1 * p1, wt2 * (1 - p1)];
    %   calc the p using normpdf
    p = exp(-(ones(size(mu))' * X - mu' * ones(size(X))).^2 ./ 2 ./ (sigmasq' * ones(size(X)))) ./ sqrt(2 .* pi .* (sigmasq' * ones(size(X)))) .* (wt' * ones(size(X)));
    p = p ./ (ones(size(mu))' * sum(p, 1));
    %   at this point, we get the p(j,i), K-by-N, the normalized p.
        
    %   for some p, 0/0 = NaN, but actually it is 0
    p(~((p > 0) + (p == 0))) = 0;

    %   get the index of dist. when each x gets its own maximum p
    [maxp, indexp] = max(p);

    %   if less then the size(mu, 2), it belongs to class1(from mu1), else belongs to class2(from mu2)
    Y = indexp <= size(mu1, 2);
end