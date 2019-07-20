%% charpit_solver: Solve a non-linear PDE using Charpit's method 
function [solution] = charpit_solver() 
    syms f(x, y, z, p, q) fx fy fz fp fq a b 
    f = z - p * x - q * y - p * p - q * q;
    %f = z * p * q - p - q;
    fx = diff(f, x) 
    fy = diff(f, y) 
    fz = diff(f, z) 
    fp = diff(f, p) 
    fq = diff(f, q)
    if fx + p * fz == fy + q * fz && fy + q * fz == 0 
        solution = simplify(subs(subs(f, p, a), q, b) == 0);
    elseif fx + p * fz / (fy + q * fz) == p / q 
        solution = solve(subs(f, p, a * q) == 0, subs(f, q, p / a) == 0); 
        % Seperation of variables after substituting solution struct 
    end