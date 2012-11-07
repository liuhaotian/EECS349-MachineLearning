function [mu, sigmasq, wt, L] = gmmest(X, mu_init, sigmasq_init, wt_init, its)
    pre_mu      = mu_init;
    pre_sigmasq = sigmasq_init;
    pre_wt      = wt_init;
    %for i = 1:its
        p = exp(-(ones(size(pre_mu))' * X .- pre_mu' * ones(size(X))).^2 ./ 2 ./ (pre_sigmasq' * ones(size(X)))) ./ sqrt(2 .* pi .* (pre_sigmasq * ones(size(X))));
end