clf
f=inline('1./(1+25*x.^2)');
% interpolation points
x=linspace(-1,1,11);
y=f(x);
xx=linspace(-1,1,100);
yy=double.empty(length(xx),0);
xxx=ChebyshevPoints(-1,1,100);
yyy=double.empty(length(xxx),0);

for ii=1:length(xx)
    yy(ii)=LagrangianInterpolation(x,y,xx(ii));
end

for ii=1:length(xxx)
    yyy(ii)=LagrangianInterpolation(x,y,xxx(ii));
end

plot(xx,f(xx),'r');
hold on;
plot(xx,yy,'b');
hold on
plot(xxx,yyy,'g');