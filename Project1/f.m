function [] = f(x_cnt, y_LIP, y_exact)
abs_error = abs((y_exact-y_LIP)./y_exact);
plot(x_cnt, abs_error, "LineWidth", 2);
legend("abs errors","Location","northeastoutside");
grid on;
end