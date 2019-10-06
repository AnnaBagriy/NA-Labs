syms x;
syms u;

format long

a = 0;
b = 1;
n = 100;

% Main function
u_derivative = @(x, u) - 2 * x * u ^ 2;
% Init boundary value
y_0 = 1;

% Compute and display the result
result = AdamsBashforth_FourStep_Method(a, b, n, y_0, u_derivative)';
disp([newline '•u'' = ' sprintf('%s', u_derivative(x, u))]);
disp(['•u(0) = ' num2str(y_0)]);
disp([newline 'u ≈ ' num2str(result(n + 1)) '  (n = ' num2str(n) ')'])