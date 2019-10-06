func = inline('exp(sin(x)+cos(x))');
%func = inline('3*cos(15*x)');
n = 1;
%(pi * (ii - 1)) / n
x = 0:pi/500:2*pi;
%x = linspace(0, 2*pi, 1000);
y = double.empty(length(x),0);

for ii = 1:length(x)
    y(ii) = TrigonometricInterpolation(func, n, x(ii));
end

clf

plot(x, func(x));
hold on;
plot(x, y);