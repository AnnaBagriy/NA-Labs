a = -5;
b = 5;
epsilon = 0.000001;

f = @(x) cos(30*x);

format long;

% Input numbers
n = input('n = ');
m = input('m = ');

% Initialize parameter p
p = 1;
if rem(n, 2) == 0
    p = 2;
end

% Utility index
i = 1;

Q_n_m = ApproximateIntegral_ComposedGaussQuadrature(a, b, f, n, m);
Q_n_2m = ApproximateIntegral_ComposedGaussQuadrature(a, b, f, n, 2 * m);

while abs(Q_n_m - Q_n_2m) / (2^(n + p) - 1)  >= epsilon
        Q_n_m = Q_n_2m;
        Q_n_2m = ApproximateIntegral_ComposedGaussQuadrature(a, b, f, n, 2 * m);
        
        i = i + 1;
end

disp(Q_n_m);
disp(Q_n_2m);
disp(i);