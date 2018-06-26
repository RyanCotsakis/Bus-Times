% If one has a scale with a certain resolution,
% this script 

measurements = [18, 18, 18, 17];
resolution = 1;
x = linspace(16,19,500);

g = x*0;
for m = measurements
  a = m-resolution/2 <= x & x < m+resolution/2;
  a = a/resolution;
  g = g + a;
end
[f, mu, s2] = entropy_fit(x, g);

figure(1);
clf;
plot(x, f, 'r-');
hold on;
plot(x, g, 'b-');
shg;