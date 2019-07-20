function[] = gauss_jordan_method()
N=3;
a = input('Enter the element of matrix :-\n');
for j=1:N
    for i=1:N
        if(i ~=j)
            t =  a(i,j)/a(i,i);
            for k = 1:N
                a(i,k) = a(i,k)-a(j,k).*t;
            end
        end
    end
end
fprintf('\n THe diagonal Matrix is :-\n');
disp(a);
fprintf('\n THe solution is :-\n');
for l=1:N
    fprintf('\n X[%d]=%f\n',l,a(l,N)./a(l,l));
end
end
