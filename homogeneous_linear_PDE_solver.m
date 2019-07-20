%% homogeneous_linear_PDE_solver: Solves a homogeneous linear partial 
%% differetial equation, when f(x, y) is exponential
%%without repeating factors 
function [solution] = homogeneous_linear_PDE_solver() 
    syms F(D, Dp) f(x, y) v 
    F = D^3 - 6 * D^2 * Dp + 11 * D * Dp ^ 2 - 6 * Dp ^ 3;
    f = exp(5 * x + 6 * y); 
    c1 = log(subs(subs(f, y, 0), x, 1));
    c2 = log(subs(subs(f, x, 0), y, 1)); 
    solution = f / subs(subs(F, D, c1), Dp, c2);