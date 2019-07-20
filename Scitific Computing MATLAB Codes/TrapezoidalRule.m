function[] = TrapezoidalRule()

clc
y = inline('1/(1+x.*x)');
x0 = input('Enter x0 : ');
xn = input('Enter xn : ');
n = input('Enter number of sub intervals');
h = (xn-x0)/n;
s = y(x0)+y(xn);
for i=1:n-1
    s = s + 2.*y(x0+i*4);
end
fprintf('The number of integral is : %f\n',h/2.*s);
end