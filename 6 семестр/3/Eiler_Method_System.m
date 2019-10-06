a = 0;
b = 1;
N = 1000000;
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
    u_1(i + 1) = u_1(i) + h * f_1(x(i), u_1(i), u_2(i));
    u_2(i + 1) = u_2(i) + h * f_2(x(i), u_1(i), u_2(i)); 
end

disp('Eiler method');
disp(['u_1 = ' num2str(u_1(N + 1))])
disp(['u_2 = ' num2str(u_2(N + 1))])