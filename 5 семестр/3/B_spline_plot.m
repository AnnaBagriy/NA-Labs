n = 100;
a = -3;
b = 3;

plot_n = 500;

h = (b - a) / n;
x_k = double.empty(n + 1, 0);

for k = 1:n + 1
   x_k(k) = a + (k - 1) * h;
end

for k = 1:n + 1
    x = linspace(a, b, plot_n);
    y = double.empty(plot_n, 0);
    
    for ii = 1:plot_n
        y(ii) = Lin_B_spline(a, b, x(ii), x_k(k), n);
    end
    
    plot(x, y);
    hold on;
end