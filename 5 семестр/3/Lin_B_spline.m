function B_x = Lin_B_spline(a, b, x, x_k, n)

h = (b - a) / n;

if abs((x - x_k) / h) <= 1
    B_x = 1 - abs((x - x_k) / h);
else
    B_x = 0;
end