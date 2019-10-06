function x = LineSeparation( a, b, n )

x = double.empty( n, 0 );

h = ( b - a ) / n;

for i = 1:n
    x(i) = a + i * h;
end

end

