function p = LeastSquares(f, a, b, n)
syms t;

p = 0;

F_F = zeros(n + 1, n + 1);
F_f = double.empty(n + 1, 0);

for ii = 1:n + 1
   for jj = 1:n + 1
      F_F(ii, jj) = (b^(ii + jj - 1) - a^(ii + jj - 1)) / (ii + jj - 1);
   end
   
   F_f(ii) = integral(@(t) f(t) .* (t.^(ii - 1)), a, b);
end

A = F_f / F_F;

for ii = 1:n + 1
   p = p + A(ii) * t^(ii - 1); 
end

end

