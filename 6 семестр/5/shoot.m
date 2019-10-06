function ret = shoot(hh)
% shooting method for fireworks problem

global a te ye h;

a = 0;	    % coeff of nonlinear acceleration
te = 5;	    % end time [sec]
ye = 40;	    % end height [m]

h = hh;
clf;
hold on;
for dy = 20:10:50
y = rocket(dy);
text(te+.2,y,sprintf('y\047(0)=%g',dy), 'FontSize',15);
end

% now use root finding to find correct initial velocity
dy = secant(20,30,1e-4);

% draw last curve
y = rocket(dy);
text(te+.2,y,sprintf('y\047(0)=%g',dy), 'Color','r', 'FontSize',15);

set(gca, 'FontSize', 16);	    % for tick marks
line([te te],[-40 140], 'Color','k');
line([te te],[ye ye], 'Color','r', 'Marker','o', 'LineWidth',3);
xlabel('t', 'FontSize',20);
ylabel('y', 'FontSize',20);
title(sprintf('Shooting Method on y\047\047=-g'), 'FontSize',20);
return;

function x = secant(x1,x2,tol)
% secant method for one-dimensional root finding

global ye;
y1 = rocket(x1)-ye;
y2 = rocket(x2)-ye;

while abs(x2-x1)>tol
    disp(sprintf('(%g,%g) (%g,%g)', x1, y1, x2, y2));
    x3 = x2-y2*(x2-x1)/(y2-y1);
    y3 = rocket(x3)-ye;
    x1 = x2;
    y1 = y2;
    x2 = x3;
    y2 = y3;
end
x = x2;
return;