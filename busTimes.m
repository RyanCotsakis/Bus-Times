clear; clc; close all;
bus_times = [2 3]; %exact measurements
left_at = [5]; %times when you stop waiting

x = linspace(0,12,1501);
g = x*0;

for i = bus_times
    g = g + gaussian(x,i,0);
end
f = entropy_fit(x,g);

for i = 1:10
    h = x*0;
    
    for j = left_at
        f_temp = f;
        ind = floor((j-x(1))/(x(2)-x(1)));
        f_temp(1:ind) = 0;
        h = h + f_temp/trapz(x,f_temp);
    end
    
    
    [f, mu, s2] = entropy_fit(x,g+h);
    [mu, s2] %print the result of this iteration
end

plot(x,g+h);
hold on
plot(x,f);