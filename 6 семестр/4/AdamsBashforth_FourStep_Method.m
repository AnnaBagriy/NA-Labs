function y = AdamsBashforth_FourStep_Method(a, b, n, y_0, f)

format long

if n < 3
   disp([newline 'n should be greater than 3.']);
   y = 0;
   return; 
end

% Step
h = (b - a) / n;

x = zeros(n + 1, 0);
% Result vector
y = zeros(n + 1, 0);

for ii = 1:n + 1
   y(ii) = y_0; 
   x(ii) = a + (ii - 1) * h;
end

% For the first three starter values
m = 3;

% Using Runge-Kutta method for iniatilizing starter values
for i = 1:m
   k_1 = f(x(i), y(i));
   k_2 = f(x(i) + h / 2, y(i) + h * k_1 / 2);
   k_3 = f(x(i) + h / 2, y(i) + h * k_2 / 2);
   k_4 = f(x(i) + h, y(i) + h * k_3);
   
   y(i + 1) = y(i) + h * (k_1 + 2 * k_2 + 2 * k_3 + k_4) / 6;
end

for ii = m + 1:n
   % Predictor
   y(ii + 1) = y(ii) + (55 * f(x(ii), y(ii)) - 59 * f(x(ii - 1), y(ii - 1))...
       + 37 * f(x(ii - 2), y(ii - 2)) - 9 * f(x(ii - 3), y(ii - 3))) * h / 24;
   
   % Corrector
   %y(ii + 1) = y(ii) + (9 * f(x(ii + 1), y(ii + 1)) + 19 * f(x(ii), y(ii)) - 5 * f(x(ii - 1), y(ii - 1)) + f(x(ii - 2), y(ii - 2))) * h / 24; 
end

end

