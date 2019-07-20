function [  ] = bvp2( a,b,f,in1,in2 )
% To find solution of a non-homogeneous Sturm-Liouville system using
% Green's Function with homogeneous boundary conditions.
%
% The general form of the SL equation in this function is :
%               y''+y=-f(x)
%               y(a)=0
%               y(b)=0
%
% We first have to find the Green's Function for the problem. For this we
% always assume that the assocaited homogeneous problem has a trivial
% solution ONLY
%
% Consider first :
%           y''+y=0
%           y(a)=0
%
% We call this solution to be v(x)
%
% Next we consider :
%           y''+y=0
%           y(b)=0
%
% and call this solution w(x)
% 
% Calculate the Wronskian by :
%
% W=v(x)w'(x)-v'(x)w(x)
%
% If W=0 the Green's Function does not exist
%
% Otherwise the Green's Function is defined by :
%
%               -v(x)w(s)/W,  a <= x < s
%    G(x,s)=
%               -v(s)w(x)/W,   s< x <= b
%
% The solution for the non-homogeneous problem can then be obtained by
%
% y(x)=int(G(x,s)f(s),s,a,b)
%
% The function bvp2 tries to encapsulate this phenomenon
%
% It accepts the parameters :
%
% a,b -> boundary points
% f    -> non homogeneous component
% in1,in2 -> homogeneous boundary conditions
%
% It then computes the two linearly independent solution for the associated
% homogeneous problem and stores in v and w respectively.
%
%
% Finally it computes and simplifies the output and plots the solution
%
% Author : Hirak Doshi
% I M.Sc. (Mathematics)
% Sri Sathya Sai Institute of Higher Learning
% Prasanthi Nilayam Campus
% Date : 5.03.2015

syms y x s 

exp = diff(diff(y))+ y == 0;
v=simple(dsolve(exp,in1,x));
w=simple(dsolve(exp,in2,x));

all_vars=symvar(v);
vars_to_keep=x;
set_to_one=setdiff(all_vars,vars_to_keep);
for ix=1:numel(set_to_one)
    v=subs(v,set_to_one(ix),1);
end

all_vars=symvar(w);
vars_to_keep=x;
set_to_one=setdiff(all_vars,vars_to_keep);
for ix=1:numel(set_to_one)
    w=subs(w,set_to_one(ix),1);
end

disp('The Wronskian is :')

W=simple(v*diff(w,x)-diff(v,x)*w);

if W~=0
    
    % Components of Green's Function
    
G1=simple(-v*subs(w,x,s)/W); % a<= x < s
G2=simple(-w*subs(v,x,s)/W); % s< x <= b
else
    disp('The solution does not exist !')
end

if W~=0
    disp('The solution is :')
    y=simple(simple(int(G2*subs(f,x,s),s,a,x)+int(G1*subs(f,x,s),s,x,b)));
    p=linspace(a,b);
    plot(p,subs(y,x,p),'r');
    title('Graph of the solution y(x) :')
    xlabel('a \leq x \leq b');
    ylabel('The solution y(x)');
end
end