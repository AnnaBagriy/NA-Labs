function B_x = B_spine(a, b, x, x_k, n)
%B_2
h = (b - a) / n;

if abs((x - x_k) / h) <= 0.5
    B_x = 2 - (abs((x - x_k) / h) - 0.5)^2 - (abs((x - x_k) / h) + 0.5)^2;
elseif (0.5 <= abs((x - x_k) / h)) && (abs((x - x_k) / h) <= 1.5)
    B_x = (abs((x - x_k) / h) - 1.5)^2;
else
    B_x = 0;
end

B_x = B_x / 2;

