function y = RightMatrixAlgorithm(D, f)
n = length(f) - 1;

A = double.empty(n - 1, 0);
C = double.empty(n - 1, 0);
B = double.empty(n - 1, 0);

for ii = 1:n - 1
   A(ii) = D(ii + 1, ii);
   C(ii) = -D(ii + 1, ii + 1);
   B(ii) = D(ii + 1, ii + 2);
end

alpha = double.empty(n, 0);
beta = double.empty(n, 0);

alpha(1) = -D(1, 2);
beta(1) = f(1);

for ii = 1:n - 1
   alpha(ii + 1) = B(ii) / (C(ii) - A(ii) * alpha(ii));
   beta(ii + 1) = (-f(ii + 1) + A(ii) * beta(ii)) / (C(ii) - A(ii) * alpha(ii));
end

y = double.empty(n + 1, 0);

y(n + 1) = (f(n + 1) - D(n + 1, n) * beta(n)) / (1 + D(n + 1, n) * alpha(n));

for ii = n:-1:1
   y(ii) = alpha(ii) * y(ii + 1) + beta(ii); 
end

end

