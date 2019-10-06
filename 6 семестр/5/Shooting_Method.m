function res = Shooting_Method(f, n, a, b, conditions, conType)

h = (b - a) / n;

shoot_1 = conditions(1);
shoot_2 = conditions(2);

if (conType(1)=='f')
        a1 = [conditions(1) shoot_1];
        a2 = [conditions(1) shoot_2];
else
    a1 = [shoot_1 conditions(1)];
    a2 = [shoot_2 conditions(1)];
end  

f
[~, F1] = Runge_Kutte(a,b,n,a1,f); 
[~, F2] = Runge_Kutte(a,b,n,a2,f);         

if (conType(2)=='f')
    F1 = F1(1,end) - conditions(2);
    F2 = F2(1,end) - conditions(2);
    r = 1;
else
    F1 = F1(2,end) - conditions(2); 
    F2 = F2(2,end) - conditions(2);
    r = 2;
end  

F3 = F1;

while (abs(F3) > zero) 
        
    shoot_3 = (shoot_1 + shoot_2)/2; 

    if (conType(1)=='f')
       a3 = [con(1) shoot_3];            
    else
       a3 = [shoot_3 con(1)];            
    end           

    [x, F3] = Runge_Kutte(a,b,n,a3,f); 
    y = F3; 
    F3 = F3(r,end) - con(2); 
    
    if (F1*F3 < 0)
        shoot_2 = shoot_3; 
        F2 = F3;            
    elseif (F1*F2 < 0)
        shoot_1 = shoot_3; 
        F1 = F3;
    else
        error('Selhani metody puleni intervalu, zmente init');           
    end
end       

res = y;