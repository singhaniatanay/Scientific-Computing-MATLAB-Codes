function [solution] = newtonrMethod(n,xn) 
    syms F(x) 
    F = x*log10(x)-1.2;
    while(n>0)
        val = eval(subs(F,x,xn));
        if(val==0)
            break;
        end
        diffval = eval(subs(diff(F),x,xn));
        if(diffval==0)
            fprintf('Solution not found');
            break;
        end
        xn = xn-(val/diffval);
        n = n-1;
    end
    solution = xn;
end
    
    