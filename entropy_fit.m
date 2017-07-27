function [f, mu, s2] = entropy_fit(x,g)
% ENTROPY_FIT computes the normal curve that minimizes the abstraction
% entropy
% [f, mu, s2] = entropy_fit(x,g)
% x is the domain
% g is the distribution of the data
% f = gaussian(mu,s2)

s2 = 1; %when finding mu, the choice of s2 is arbitrary
entropies = [];
for mu = x
    f = gaussian(x,mu,s2);
    entropies = [entropies abstr_entropy(x,f,g)];
end
[~,i] = min(entropies);
mu = x(i);

entropies = [];
deviations = linspace(0,(x(end)-x(1)),length(x));
for s2 = deviations
    f = gaussian(x,mu,s2);
    entropies = [entropies abstr_entropy(x,f,g)];
end
[~,i] = min(entropies);
s2 = deviations(i);

f = gaussian(x,mu,s2);


