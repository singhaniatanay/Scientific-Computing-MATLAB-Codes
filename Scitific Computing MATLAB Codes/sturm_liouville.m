%% sturm_liouville: Calculate the eigenvalues and eigenvectors 
%% For a Sturm Lioville problem with boundaries 
%% [0, L] and eigenvalue lambda st. X'(L) = X'(0) = 0 
function [e_value, e_function, non_zero] = sturm_liouville(L) 
    syms y(x) 
    syms lambda n 
    sprintf('Solving for various conditions...') 
    sprintf('When lambda > 0') 
    assume(lambda > 0); 
    solution = dsolve(diff(y, 2) + lambda * y == 0); 
    e_function = solution; 
    diff_sol = diff(solution, x);
    vals = solve(subs(diff_sol, 0) == 0, subs(diff_sol, L) == 0); 
    non_zero = vals; 
    sprintf('Non-zero values in the solution') 
    %% Eigenvalues for this solution 
    e_value = [(n * pi) / L] .^ 2; 
    sprintf('When lambda = 0') 
    try 
        solution = dsolve(subs(diff(y, 2) + lambda * y == 0), lambda, 0);
    catch
        sprintf('No non-trivial solution') 
    end
    sprintf('When lambda < 0') 
    assume(lambda < 0); solution = dsolve(diff(y, 2) + lambda * y == 0);
    diff_sol = diff(solution, x); 
    %% No explicit non-trivial solutions possible 
    vals = solve(subs(diff_sol, 0) == 0, subs(diff_sol, L) == 0);