function y_exact = e(x_values, y_values_1, y_values_2)
y_exact = 10*besselj(0,x_values);
plot(x_values, y_values_1, 'LineWidth', 2, 'LineStyle','--');
hold on;
plot(x_values, y_values_2, 'LineWidth', 2, 'LineStyle','-.');
hold on;
plot(x_values, y_exact, 'LineWidth', 2);
legend("y LIP", "y NBFIP", "y exact", "Location","northeastoutside");
grid on;
hold off;
end