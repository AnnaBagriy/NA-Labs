function x = ChebyshevPoints( a, b, n )

x = double.empty( n, 0 );

%h = ( b + a ) / 2;

for k = 1:n
    x(k) = cos((2*(k-1)+1)*pi/(2*n)); 
    %h + (( b - a ) / 2) * cos((( 2 * ( k - 1) + 1 ) / ( 2 * ( n + 1 ) )) * pi);
end

end