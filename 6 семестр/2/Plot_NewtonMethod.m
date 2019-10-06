syms t;

format long;

f_1 = @(x) x.^3 - 2 .* sin(x) - 1;
f_2 = @(x) x.^3 + 10 * x - 9;

f = f_2;

a = -10;
b = 10;

epsilon = 0.0000000000000000001;

% Set initial approximation
x_0 = (a + b) / 2;
if f(a) * limit(diff(f(t), 2), a) > 0
    x_0 = a; 
elseif f(b) * limit(diff(f(t), 2), b) > 0
    x_0 = b;  
end

% Find the root & number of iterations
[alpha, i] = NewtonMethod(f, x_0, epsilon);

disp([newline, 'Alpha = ', num2str(double(alpha))]);
disp(['f(alpha) = ', num2str(double(limit(f, alpha)))]);
disp(['Iterations = ', num2str(i)]);

% Plot
x = linspace(a, b);
plot(x, f(x));