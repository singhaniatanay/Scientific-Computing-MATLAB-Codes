function [] = gauss_elimnation_method()
clc
N=3;
a = input('Enter the element of matrix');
for i=1:N-1
    for j=i+1:N
        t = a(i,i)/a(j,j);
        for k=1:N
            a(i,k) = a(i,k) - a(j,k) * t;
        end
    end
end
for i=1:N
    for l=1:N
        fprintf('%8.4f',a(i,l));
    end
    fprintf('\n');
end
for i=N:-1:1
    s=0;
    for o=i+1:N-1
        s = s + a(i,o+1).*x(i);
    end
    x(i) = (a(i,N)-s)/a(i,i);
end
end

