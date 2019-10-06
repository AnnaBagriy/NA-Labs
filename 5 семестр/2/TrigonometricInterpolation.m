function result = TrigonometricInterpolation(f, n, t)
i = 2 * n;
coef = 1 / n;

t_i = double.empty(i, 0);
y_i = double.empty(i, 0);
a_k = double.empty(n + 1, 0);
b_k = double.empty(n - 1, 0);

for ii = 1:i
   t_i(ii) = (pi * (ii - 1)) / n;
   y_i(ii) = f(t_i(ii));
end

for k = 1:n + 1
    a_k_temp = 0;
    b_k_temp = 0;
    
    for jj = 1:2 * n
        a_k_temp = a_k_temp + y_i(jj) * cos(pi * (k - 1) * (jj - 1) / n);
        
        if n > 1
            b_k_temp = b_k_temp + y_i(jj) * sin(pi * k * (jj - 1) / n);
        end
    end
    
    a_k(k) = a_k_temp * coef;
    
    if k < n
        b_k(k) = b_k_temp * coef;
    end
end

result = a_k(1) / 2 + a_k(n + 1) * cos(n * t) / 2;

for k = 2:n
   result = result + a_k(k) * cos((k - 1) * t) + b_k(k - 1) * sin((k - 1) * t); 
end