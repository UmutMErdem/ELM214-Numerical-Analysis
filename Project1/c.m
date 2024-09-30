function val = c(x_values, y_values)
x = x_values;
y = y_values;
n = length(x);
D = zeros(n, n);
val = zeros(n,n);
D(:, 1) = y;
for j=2: n
    for i=j: n
        D(i,j) = (D(i,j-1) - D(i-1, j-1))/(x(i)-x(i-j+1));  
    end
end
val(1,n) = D(1,1);
for i=2:n
    v=1;
    for j=1:i-1
        v = conv(v, poly(x(j)));
    end
    val(i,(n-length(v)+1):n) = v.*D(i,i);
end
P = sum(val);
val = poly2sym(sym(P));
end