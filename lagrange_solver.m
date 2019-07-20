function[u,v] = lagrange_solver()
syms x y z p q dx dy c1 c2

lhs = (y ^ 2 * z / x) * p + z * x * q;
rhs = y ^ 2;
C = coeffs(lhs, [q p]);
P = C(1);
Q = C(2);
R = rhs;

P = P * x/z;
Q =  Q * x/z;

u = int(P,y)==int(Q,x) + c1;

P = C(1);
P = y ^ 2 * z/P;
R = y ^ 2 * z/R;

v = int(P,x)==int(R,z)+c2;

end