function res = Quadrature(f, a, b, n_0, eps)

flag = 1;

n = n_0;

while flag == 1
    % k step
    h = (b - a) / n;
    x = double.empty(n + 1, 0);

    sum = 0;

    for ii = 1:n + 1
        x(ii) = a + h * (ii - 1);
    end

    for ii = 1:n
      sum = sum + f((x(ii + 1) + x(ii)) / 2);
    end

    sum = sum * h;

    % k + 1 step
    n_next = 2 * n;
    h_next = (b - a) / n_next;
    x_next = double.empty(n_next + 1, 0);

    sum_next = 0;

    for ii = 1:n_next + 1
        x_next(ii) = a + h_next * (ii - 1);
    end

    for ii = 1:n_next
       sum_next = sum_next + f((x_next(ii + 1) + x_next(ii)) / 2);
    end

    sum_next = sum_next * h_next;
    
    if abs(sum_next - sum) <= eps
        res = sum_next;
        flag = 0;
        disp(abs(sum_next - sum));
        disp(abs(integral(f,a,b)-sum_next));
        disp(n_next);
        break;
    else
        n = n_next;
    end
        
end

end

