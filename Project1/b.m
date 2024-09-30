function val = b(x_values, y_values)
x = x_values;
y = y_values;
n = length(x);
L = zeros(n, n);
for i=1: n % for rows
    v = 1;
    for j=1: n % for making polynomial
        if i~=j
            v = conv(v, poly(x(j)))/(x(i)-x(j));
        end
    end
    L(i, :) = v*y(i);
end
P = sum(L);
val = poly2sym(sym(P));
end