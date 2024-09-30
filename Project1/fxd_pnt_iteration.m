function [] = fxd_pnt_iteration(pol, p0, err_tol)
if pol == "yexact"
    syms x;
    pol = 10*besselj(0,x);
end
F = matlabFunction(pol); p=[]; a = [p0];
for i=1: 20
    p = [p, F(a(i))]; a = [a, p(i)];
    if (abs(p(i)) <= err_tol)
        a = a(1:length(a)-1);
        T = table(a', p', 'VariableNames', {'p(n)', 'F(p(n))'});
        uitable('Data', T{:,:}, 'ColumnName', T.Properties.VariableNames, 'RowName', 'numbered', 'Units','normalized','Position', [0, 0, 1, 1], 'ColumnFormat', {'long', 'long'});
        return;
    end
end
disp("No root found in the entered range.");
end

