clf
a=-1;
b=1;
n=50;
f=inline('log(x+2)');

% interpolation points
x=linspace(a,b,n+1);
y=f(x);

xx=ChebyshevPoints(a,b,n+1);
yy=double.empty(length(xx),0);

plot_x=linspace(a,b,500);
plot_y=double.empty(length(plot_x),0);

for ii=1:length(plot_x)
    plot_y(ii)=LagrangianInterpolation(x,y,plot_x(ii));
end

for ii=1:length(plot_x)
    yy(ii)=LagrangianInterpolation(xx,f(xx),plot_x(ii));
end

plot(plot_x,f(plot_x),'r');
hold on;
plot(plot_x,plot_y,'b');
hold on
plot(plot_x,yy,'g');