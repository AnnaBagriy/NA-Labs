function B_x = CubicSpline(a, b, x, x_k, n)
h = (b - a) / n;

if abs((x - x_k) / h) <= 1
    B_x = (2 - abs((x - x_k) / h))^3 - 4 * (1 - abs((x - x_k) / h))^3;
elseif abs((x - x_k) / h) <= 2 && abs((x - x_k) / h) >= 1
    B_x = (2 - abs((x - x_k) / h))^3;
else
    B_x = 0;
end

B_x = B_x / 6;

end

