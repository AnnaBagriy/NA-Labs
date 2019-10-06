n = 3;
a = 0;
b = 1;
%%%%%%%%
%%%%%%%%%%%
h = ( b - a )/ n;
x =[];
for ii = 0:n
x= [ x, a+ii*h ];
end
syms t;
func = 5*cos( 7*t )* sin( t );
derivative = diff( func, t );
a1 = double( limit( derivative, t, 0) )
b1 = double( limit( derivative, t, 1) )
y = f(x);

% for ii = 1:n+1
%     y( ii ) = f( x( ii ) );
% end


%initialize matrix A
A=zeros( n+3, n+3 );
for ii = 2 : n+3
    for jj = 1 : n+3
         if ii - jj == 0
            A( ii, jj ) = 2/3;
         elseif abs( ii - jj ) == 1
            A( ii, jj ) = 1/6;
         end
    end
end
A(1,1)=1;
A(1,2)=2;
A(n+3,n+2)=2;
A(n+3,n+3)=1;
%%%%%
%derivative


y = [ 3*y(1)-h*a1 y 3*y( n )+ h*b1 ];
y = reshape( y, n+3, 1 );
alpha = progonka(A,y);% progonka left/right
x = [ a-h x b+h ];

%plot
m = 100;
xx = linspace( a, b, m );

yy = f(xx);

plot(xx,yy,'r');
hold on

s = zeros( 1, m );

for k = 1 : m
    for ii = 1 : n + 3
        s( k ) = s( k )+ alpha( ii )* beta3( xx( k ),x( ii ),h );
    end
end

plot(xx,s,'b');
%