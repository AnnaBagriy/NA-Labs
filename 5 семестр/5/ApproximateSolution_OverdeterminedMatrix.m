function x = ApproximateSolution_OverdeterminedMatrix(A, b)

A1 = A' * A;
%b1 = sum(A'.* b, 2);
b1 = A' * b';

x = A1 \ b1;

end

