function correlation = corrReg(A,B)
    syms x y
    cV = cov(A,B);
    covar = cV(1,2);
    stdA = cV(1,1)^0.5;
    stdB = cV(2,2)^0.5;
    correlation = covar/(stdA*stdB)
    y1 = sum(B);
    y2 = sum(A.*B);
    x1 = sum(A);
    x2 = sum(A.*A);
    [len,a] = size(A);
    mat = [len x1; x1 x2]
    ans = inv(mat)*([y1; y2])
    ezplot(y== ans(1) + ans(2)*x)
    hold on
    scatter(A,B)
    
    