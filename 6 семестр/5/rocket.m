function y = rocket(dy0)
% return altitude at t=te (y(te)) as a function of initial velocity (y'(0)=dy0)
global h te
[tv,yv] = euler2(h,0,te,0,dy0);

y = yv(te/h+1);	    % returns y at t=te

return;

    function [tv,yv] = euler2(h,t0,tmax,y0,dy0)
    % use Euler's method to solve 2nd order ODE y''=-g+a*y^2
    % return tvec and yvec sampled at t=(t0:h:tmax) as col. vectors
    % y(t0)=y0, y'(t0)=dy0

    % Paul Heckbert	    30 Oct 2000

    global a;	    % coeff of nonlinear acceleration
    g = 9.8;	    % accel. of gravity, [m/sec^2]
    y = y0;	    % position
    dy = dy0;	    % velocity
    tv = [t0];
    yv = [y0];
    for t = t0:h:tmax
    y = y+dy*h; % this and following line are Euler's method
    dy = dy+(-g+a*y^2)*h;
    tv = [tv; t+h];
    yv = [yv; y];
    end
    return;