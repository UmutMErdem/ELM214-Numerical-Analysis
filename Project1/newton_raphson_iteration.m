function [] = newton_raphson_iteration(pol, p, err_tol)
if pol == "yexact"
    syms x;
    pol = 10*besselj(0,x);
end
F = matlabFunction(pol); i = 1; v_diff = diff(pol); v = []; a = [p]; b = []; F_diff = matlabFunction(v_diff);
while abs(F(a(i)))> err_tol
    v = [v, F(a(i))];
    ga = F_diff(a(i));
    if ga == 0
        disp('Division by zero.');
        break;
    end
    b = [b, a(i) - F(a(i))/ga];
    a = [a, b(i)];
    i = i + 1;
end
T = table(b', v', 'VariableNames', {'p(n)', 'F(p(n))'});
uitable('Data', T{:,:}, 'ColumnName', T.Properties.VariableNames, 'RowName', 'numbered', 'Units','normalized','Position', [0, 0, 1, 1], 'ColumnFormat', {'long', 'long'});
end