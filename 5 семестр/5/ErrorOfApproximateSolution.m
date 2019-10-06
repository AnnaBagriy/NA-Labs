function err = ErrorOfApproximateSolution(A, x, b)

err = norm(A * x - b');

end

