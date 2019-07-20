function solve = sys_of_lin(A,B)

rankA = rank(A)
rankAB = rank([A B])
if(rankA==rankAB)
    solve = pinv(A)*B;
elseif(rankA<rankAB)
    solve = rankA
else
    disp('No Solution');
end

