syms y(t) a g
ode = diff(y,t) == a*y(t) - (2*(10^4))*(y(t)^2);
cond = y(0) == 10;
ySol(t) = dsolve(ode,cond)
