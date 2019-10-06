function [x_k_1, iterations] = NewtonMethod(f, x_0, epsilon)

iterations = 0;
x_k = x_0;
format long;
syms t;

while abs(f(x_k)) >= epsilon
    % Derivative
    df_x_k = limit(diff(f(t)), x_k);
    
    % Find x(k+1)
    x_k_1 = x_k - f(x_k) / df_x_k;
    x_k = x_k_1;
    
    %disp(['f(x_k) = ', num2str(double(f(x_k)))]);
    %disp(['df_x_k = ', num2str(double(df_x_k))]);
    disp(['x_k = ', num2str(double(x_k))]);
    
    iterations = iterations + 1;
    
    if iterations > 100
        disp('The method is -> infinity');
        break;
    end
end

end