fx = @(x) 5 .* cos(7 .* x) .* sin(x);
syms t;

n = 20;
a = 0;
b = 1;
h = (b - a) / n;
x_k = double.empty(n + 3, 0);

n_plot = 200;
x = linspace(a, b, n_plot);

for k = 1:n + 3
   x_k(k) = a + h * (k - 2);
end

A = InitMatrix(n);
bb = double.empty(n + 3, 0);
bb(1) = 3 * fx(a) - h * double(limit(diff(fx(t), t), t, a));
bb(n + 3) = 3 * fx(b) + h * double(limit(diff(fx(t), t), t, b));
for ii = 2:n + 2
   bb(ii) = fx(x_k(ii));
end

%alpha = A \ bb';
alpha = RightMatrixAlgorithm(A, bb);

s = zeros(1, n_plot);

for jj = 1:n_plot
   for ii = 1:n + 3
       s(jj) = s(jj) + alpha(ii) * CubicSpline(a, b, x(jj), x_k(ii), n);
   end
end

clf
plot(x, fx(x));
hold on;
plot(x, s);