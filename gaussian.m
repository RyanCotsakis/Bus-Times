function f = gaussian(x,mu,s2)
% GAUSSIAN generate a gaussian distribution integrating to 1
% f = gaussian(x,mu,s2)
% x is the domain, and f is the range of the function
% mu and s2 are the mean and variance respectively

if s2 == 0 %Return a delta function
    delta = x(2)-x(1);
    f = zeros(1,length(x));
    for i = 1:length(x)
        if x(i) > mu
            f(i) = 1/delta;
            return
        end
    end
else
    f = 1/sqrt(2*pi*s2)*exp(-(x-mu).^2/(2*s2));
end
    

