function x = gauss_seidal(coeff_mat, b, ini)

lS = tril(coeff_mat);
u = triu(coeff_mat);
lSInv = inv(lS);
t = -lSInv*u;
c = lSInv*b;
sz = size(coeff_mat);
x = ini;
xtemp = zeros(sz(1), 1);
while(1 == 1)
    xtemp = t*x+c;
    if(abs(x-xtemp) < 0.00001)
        break;
    end
    x = xtemp;
end

end