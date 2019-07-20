function[] = regular_falsi()
clc
itr=0;
x0= input('Enter the value of x0 :');
x1 = input('Enter the value of x1 :');
aerr = input('Enter the allowed error :');
maxitr = input('Enter the maximum number of iterations:');
[x2,itr] = regula(x0,x1,f(x0),f(x1),itr);
while(itr<maxitr)
    if (f(x0)*f(x1)<0)
        x1=x2;
    else
        x0 = x2;
    end
    [x3,itr] = regula(x0,x1,f(x0),f(x1),itr);
    if(abs(x3-x2)<aerr)
        fprintf('After %d iterations, roots %f \n',itr, x3);
        return
    end
    x2=x3;
end
fprintf('Iterations not sufficient, solution does not converge\n');
end
function[x,itr_r] = regula(x0,x1,a,b,itr)
x =  x0 - ((x1-x0)/(b-a)) * a;
itr_r=itr+1;
fprintf('iteration no. %d * %f \n',itr, x);
end
function[y] = f(x)
y = (cos(x)-x*exp(x));
end

