function A = InitMatrix(n)

alpha = double.empty(n + 3, 0);
A = zeros(n + 3, n + 3);

A(1, 1) = 1;
A(1, 2) = 2;
A(n + 3, n + 3) = 1;
A(n + 3, n + 2) = 2;

for ii = 2:n + 2
    A(ii, ii - 1) = 1/6;
    A(ii, ii) = 2/3;
    A(ii, ii + 1) = 1/6;
end

end

