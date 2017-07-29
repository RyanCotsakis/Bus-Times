function s = abstr_entropy(x,f,g)
% ABSTR_ENTROPY computes the abstraction entropy of f to g
% s = abstr_entropy(x,f,g)
% x is the domain
% f is the probability distribution that is being fitted
% g is the data's distribution

integrand = zeros(1,length(x));
for i = 1:length(x)
    if g(i) ~= 0
        if f(i) == 0
            s = Inf;
            return
        end
        integrand(i) = -g(i)*log(f(i));
    end       
end
s = trapz(x,integrand);

