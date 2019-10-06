A = [1 3; 2 4; 5 6];
b = [4 6 11];

x = ApproximateSolution_OverdeterminedMatrix(A, b)

error = ErrorOfApproximateSolution(A, x, b)
