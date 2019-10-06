n = 3;
epsilon = 0.0001;
a = 0;
b = 1;

syms t;
syms t_der;

f_u = @(u, u_der) 1 - 4 * u * u_der;
alpha = 0;
beta = 0;

Shooting_Method(f_u, n, a, b, [alpha beta], 'double')

% s = zeros(n, 1);
% s(1) = 1;

% syms v;
% syms v_der;
% syms w;
% syms w_der;
% 
% f_v = @(v, v_der) f_u(v, v_der);
% f_w = matlabFunction(diff(f_v(t, t_der), t));
%     
% for ii = 2:n
%     f_v = @(v, v_der) f_u(v, v_der);
%     v_0 = alpha;
%     v_der_0 = s(ii - 1);
%     
%     v = Runge_Kutte(a, b, n, v_0, f_v)
%     v_der = Runge_Kutte(a, b, n, v_der_0, f_v)
%     
% %     f_w1 = matlabFunction(diff(f_v(t, t_der), t) * w - diff(f_v(t, t_der), t_der) * w_der)
% %     f_w = @(w, w_der) f_w1(w, w_der)
% %     w_0 = 0;
% %     w_der_0 = 1;
%     
%     w = Runge_Kutte(a, b, n, w_0, f_w)
%     %w_der = Runge_Kutte(a, b, n, w_der_0, f_w)
%     
%     s(ii) = s(ii - 1) - (v(b) - beta) / w(b);
% end