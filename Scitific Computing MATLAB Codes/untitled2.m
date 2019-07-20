syms x
%F = x ^ 5 + 3 * (x^4) - 3*x + 7;
F = log(x^2 + x + 1);
ezplot(F,[-1,1])
Fx = diff(F,x)
Sx = vpasolve(Fx==0,x,[-1 1])
[len,a] = size(Sx);
xi=1;
max_val = vpa(subs(F,x,Sx(1)));
max_var = 1;
while(xi < len+1)
        temp = vpa(subs(F,x,Sx(xi)));
        if (temp>max_val)
            max_val = temp;
            max_var = xi;
        end
        xi = xi+1;       
end
if(max_val<vpa(subs(F,x,-1)))
    max_val = vpa(subs(F,x,-1));
    max_var = -1;
end
if(max_val<vpa(subs(F,x,1)))
    max_val = vpa(subs(F,x,1));
    max_var = 1;
end

xi=1;
min_val = vpa(subs(F,x,Sx(1)));
min_var = 1;
while(xi < len+1)
        temp = vpa(subs(F,x,Sx(xi)));
        if (temp<min_val)
            min_val = temp;
            min_var = xi;
        end
        xi = xi+1;
        
end
if(min_val>vpa(subs(F,x,-1)))
    min_val = vpa(subs(F,x,-1));
    min_var = -1;
end
if(min_val>vpa(subs(F,x,1)))
    min_val = vpa(subs(F,x,1));
    min_var = 1;
end


max_val
min_val


