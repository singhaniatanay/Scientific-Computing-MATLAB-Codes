clc;
clear all;

x = input('Enter x: ');
y = input('Enter y: ');

req = input('Enter required x: ');

rows = length(y);
cols = rows+1;
h = x(2) - x(1);

table = zeros(rows, cols);

% add data to the table
for i = 1:rows
    table(i, 1) = x(i);
    table(i, 2) = y(i);
end

% find the deltas
n = 1;
for j = 3:cols
    for i = 1:rows-n
        table(i, j) = table(i+1, j-1) - table(i, j-1);
    end
    n = n +1;
end

% find the y0
p = 0;
for i = 1:rows
   temp = (req-x(i))/h;
   if(( temp > 0 && temp < 1))
        p = temp;
        pi = i;
   end
end

%final answer
answer = table(pi, 2);
r = 1;
for i = 2:rows
    r = r * (p-i+2);
    answer = answer + (r * (table(pi, i+1)/factorial(i-1)));
end

disp(table);

fprintf('Final answer is: %f\n', answer);