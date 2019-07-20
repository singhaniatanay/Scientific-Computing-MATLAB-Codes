function yi = Langrange(x, y, xi)
f = 0;
n=length(y);
for i=1:n
    nr = 1;
    dr = 1;
    for j=1:n
        if (j~=i)
            nr = nr*(xi-x(j));
            dr = dr*(x(i)-x(j));
        end
    end
    f = f + (nr/dr)*y(i);
end
disp(f);
yi = f;
end