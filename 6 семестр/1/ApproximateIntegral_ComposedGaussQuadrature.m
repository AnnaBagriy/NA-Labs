function Q_n_m = ApproximateIntegral_ComposedGaussQuadrature (a, b, f, n, m)

% Predefined weight function values and nodes
if n == 3
    a_k = [8/9, 5/9, 5/9];
    x_k = [0, sqrt(3/5), -sqrt(3/5)];
end
if n == 4
    a_k = [0.65214, 0.65214, 0.34785, 0.34785];
    x_k = [0.33998, -0.33998, 0.86113, -0.86113];
end
if n == 5
    a_k = [0.56888, 0.47862, 0.47862, 0.23692, 0.23692];
    x_k = [0, 0.53846, -0.53846, 0.90617, -0.90617 ];
end

% Step
H = (b - a) / m;

% Find Q_n_m
mainSum = 0;

for j = 0:m - 1
    tempSum = 0;
    
    for k = 1:n
        tempSum = tempSum + a_k(k) * f(a + j * H + (H / 2) * (1 + x_k(k))); 
    end
    
    mainSum = mainSum + tempSum;
end
    
Q_n_m = mainSum * H / 2;

end