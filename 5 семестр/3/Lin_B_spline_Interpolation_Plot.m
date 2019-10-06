n = 3;
a = -10;
b = 10;

plot_n = 500;

x = linspace(a, b, plot_n);
y = sin(x);

h = (b - a) / n;
x_k = double.empty(n + 1, 0);

for k = 1:n + 1
   x_k(k) = a + (k - 1) * h;
end

for k = 1:n + 1
    xx = linspace(a, b, plot_n);
    yy = double.empty(plot_n, 0);
    
    for ii = 1:plot_n
        yy(ii) = Lin_B_spline(a, b, xx(ii), x_k(k), n);
    end
    
    plot(xx, yy);
    hold on;
    
    s(ii) = Lin_B_spline_Interpolation(y, yy)
end

plot(xx, s);
