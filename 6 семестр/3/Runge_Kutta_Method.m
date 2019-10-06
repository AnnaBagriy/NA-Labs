a = 0;
b = 1;
N = 1000;
format long
h = (b - a) / N;
x = a:h:b;
u_1 = zeros(N + 1, 1); 
u_2 = zeros(N + 1, 1); 

u_1(1) = 3;
u_2(1) = 1;

f_1 = @(x, u_1, u_2) u_1 * (1 - u_2);
f_2 = @(x, u_1, u_2) u_2 * (2 * u_1 - 1);

for i = 1:N
    k_1 = f_1(x(i), u_1(i), u_2(i));
    l_1 = f_2(x(i), u_1(i), u_2(i));
    
    k_2 = f_1(x(i) + h / 2, u_1(i) + h * k_1 / 2, u_2(i) + h * l_1 / 2);
    l_2 = f_2(x(i) + h / 2, u_1(i) + h * k_1 / 2, u_2(i) + h * l_1 / 2);
    
    k_3 = f_1(x(i) + h / 2, u_1(i) + h * k_2 / 2, u_2(i) + h * l_2 / 2);
    l_3 = f_2(x(i) + h / 2, u_1(i) + h * k_2 / 2, u_2(i) + h * l_2 / 2);
    
    k_4 = f_1(x(i) + h, u_1(i) + h * k_3, u_2(i) + h * l_3);
    l_4 = f_2(x(i) + h, u_1(i) + h * k_3, u_2(i) + h * l_3);
    
    u_1(i + 1) = u_1(i) + h * (k_1 + 2 * k_2 + 2 * k_3 + k_4) / 6;
    u_2(i + 1) = u_2(i) + h * (l_1 + 2 * l_2 + 2 * l_3 + l_4) / 6;
end

disp('Ruge-Kutta method');
disp(['u_1 = ' num2str(u_1(N + 1))])
disp(['u_2 = ' num2str(u_2(N + 1))])