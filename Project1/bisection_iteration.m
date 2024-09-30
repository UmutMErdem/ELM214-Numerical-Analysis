function [] = bisection_iteration(pol, low, high, err_tol)
low_l = []; high_l = []; m_l = []; y3_l = [];
if pol == "yexact"
    y1 = 10*besselj(0,low); y2 = 10*besselj(0,high); 
else
    F = matlabFunction(pol);
    y1 = F(low); y2 = F(high);
end
if (y1 * y2) > 0
   disp('No root found in the entered range.');
   return
end 
while (abs(high - low) > err_tol)
    m = (high + low)/2; m_l = [m_l; m];
    if pol == "yexact"
        y3 = 10*besselj(0, m);
    else
        y3 = F(m);
    end
    y3_l = [y3_l;y3]; low_l = [low_l; low]; high_l = [high_l; high]; 
    if y1 * y3 > 0
        low = m;
        y1 = y3;
    else
        high = m;
    end
end
T = table(low_l, high_l, m_l, y3_l, 'VariableNames', {'a(n)','b(n)','p(n)','F(p(n))'});
uitable('Data', T{:,:}, 'ColumnName', T.Properties.VariableNames, 'RowName', 'numbered', 'Units','normalized','Position', [0, 0, 1, 1], 'ColumnFormat', {'long', 'long', 'long', 'long'});
end