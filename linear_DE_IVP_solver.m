%%linear_DE_IVP_solver: Solve a system of linear homogenous DE IVP

function[sols, vals]=linear_DE_IVP_solver(A, B, C)
syms t lambda
n = length(A);
[V, D] = eig(A);
eigenvalues = diag(D);
consts = reshape(sym('c%d',1:n), n, 1);
unique_eigenvalues = unique(eigenvalues);
mults = histc(eigenvalues, unique_eigenvalues);
sols = sym('x%d',[1 n]);
if length(unique_eigenvalues) ~= length(eigenvalues)
    i=1;
    ch_mat = A-lambda*eye(n);
    V = vpa(V);
    while i<=n
        [pos] = find(unique_eigenvalues == eigenvalues(i));
        if mults(pos) > 1
            e_vector = V(:, i);
            a_mat = subs(ch_mat, eigenvalues(i));
            for j =1:mults(pos)
                V(:, i) = V(:, i) .* (t ^ (j-1));
                P = inv(a_mat ^ (j-1)) * e_vector;
                V(:, i) = V(:, i) + P;
                i = i+1;
            end;
        else;
            i=i+1
        end;
    end;
end;
for i=1:n
    sols(i) = (V(i, :) .* exp(eigenvalues' * t)) * consts;
end;
vals = solve(subs(sols, t, B) == C);
constsnames = fieldnames(vals);

for i=1:n
    sols = subs(sols,consts(i), vals.(constsnames{i}));
end;
