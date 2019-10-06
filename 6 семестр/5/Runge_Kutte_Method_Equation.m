a = 0;
b = 1;
N = 1000;
format long
h = (b - a) / N;
x = a:h:b;
y = zeros(N + 1, 1);

f = @(x, u) -x * sin(pi * u); %-2 * u^2;
y(1) = 3 / 4;

for i = 1:N
   k_1 = f(x(i), y(i));
   k_2 = f(x(i) + h / 2, y(i) + h * k_1 / 2);
   k_3 = f(x(i) + h / 2, y(i) + h * k_2 / 2);
   k_4 = f(x(i) + h, y(i) + h * k_3);
   
   y(i + 1) = y(i) + h * (k_1 + 2 * k_2 + 2 * k_3 + k_4) / 6;
end

y(N + 1)