% Define [a, b] and N
a = 0;
b = 1;
N = 1000;
format long
h = (b - a) / N;
x = a:h:b;
U = zeros(N + 1, 1);

% Define function and initial value
f = @(x, u) -x * sin(pi * u);
%f = @(x, u) u;
U(1) = 3 / 4;
%U(1) = 1;

% Main loop for finding solution
for i = 1:N
   U(i + 1) = U(i) + h * (f(x(i), U(i)) + f(x(i + 1), U(i) + h * f(x(i), U(i)))) / 2;
end

ff = @(x) exp((x^2)/2);
feval(ff, 1);
exp(1/2);
% Result
result = U(N + 1);
disp(['Result = ' num2str(result)]);
