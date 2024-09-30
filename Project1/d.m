function [x_cnt, y_values_1, y_values_2] = d(poly_eq_1,poly_eq_2, x_cnt)
F1 = matlabFunction(poly_eq_1);
F2 = matlabFunction(poly_eq_2);
y_values_1 = F1(x_cnt);
y_values_2 = F2(x_cnt);
plot(x_cnt, y_values_1, 'LineWidth', 2, 'LineStyle','--');
hold on;
plot(x_cnt, y_values_2, 'LineWidth', 2);
legend("y LIP", "y NBFIP", "Location","northeastoutside");
grid on;
hold off;
end