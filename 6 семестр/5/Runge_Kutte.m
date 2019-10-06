function [x y] = Runge_Kutte(a, b, n, y_0, fun)

format long
h = (b - a) / n;
x = a:h:b;

y = zeros(length(y_0),n);
y(:,1) = y_0;

for k = 1:(n-1) 
    k1 = fun(x(k),y(:,k));
    k2 = fun(x(k)+0.5*h,y(:,k)+0.5*h*k1');
    k3 = fun(x(k)+0.5*h,y(:,k)+0.5*h*k2');
    k4 = fun(x(k)+h,y(:,k)+h*k3');
    y(:,k+1)=y(:,k)+h*(k1'+2*k2'+2*k3'+k4')/6;
end