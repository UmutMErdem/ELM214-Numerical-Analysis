function [] = secant_iteration(pol, p0, p1, err_tol)
syms x;
if pol == "yexact"
    pol = 10*besselj(0,x);
end
F = matlabFunction(pol);
i = 1; y1 = [F(p0(i))]; dx = 1; y2 = [];
while abs(dx) > err_tol
    y2 = F(p1(i));
    if y1(i) == y2
        disp('Division by zero.');
        break;
    end
    dx = (p1(i) - p0(i))*y2/(y2 - y1(i));
    p0 = [p0, p1(i)];
    y1 = [y1, y2];
    p1 = [p1, p1(i) - dx];
    i = i + 1;
end
T = table(p0', p1', y1', 'VariableNames', {'p(n-1)', 'p(n))', 'F(p(n))'});
uitable('Data', T{:,:}, 'ColumnName', T.Properties.VariableNames, 'RowName', 'numbered', 'Units','normalized','Position', [0, 0, 1, 1], 'ColumnFormat', {'long', 'long', 'long'});
end