% a şıkkı
a([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
%%
% b şıkkı
b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
%%
% c şıkkı
c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
%%
% d şıkkı
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
d(pol_LIP, pol_NBFIP, 0:0.0001:6);
%%
% e şıkkı
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
[x_cnt, y_LIP, y_NBFIP] = d(pol_LIP, pol_NBFIP, 0:0.0001:6);
e(x_cnt, y_LIP, y_NBFIP);
%%
% f şıkkı
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
[x_cnt, y_LIP, y_NBFIP] = d(pol_LIP, pol_NBFIP, 0:0.0001:6);
y_exact = e(x_cnt, y_LIP, y_NBFIP);
f(x_cnt, y_LIP, y_exact);
%%
% h şıkkı - bisection [0, 2]
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
bisection_iteration(pol_LIP, 0, 2, 0.0001);
%%
% h şıkkı - bisection [0, 2]
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
bisection_iteration(pol_NBFIP, 0, 2, 0.0001);
%%
% h şıkkı - bisection [0, 2]
bisection_iteration("yexact", 0, 2, 0.0001);
%%
% h şıkkı - bisection [2, 4]
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
bisection_iteration(pol_LIP, 2, 4, 0.0001);
%%
% h şıkkı - bisection [2, 4]
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
bisection_iteration(pol_NBFIP, 2, 4, 0.0001);
%%
% h şıkkı - bisection [2, 4]
bisection_iteration("yexact", 2, 4, 0.0001);
%%
% h şıkkı - bisection [4, 6]
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
bisection_iteration(pol_LIP, 4, 6, 0.0001);
%%
% h şıkkı - bisection [4, 6]
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
bisection_iteration(pol_NBFIP, 4, 6, 0.0001);
%%
% h şıkkı - bisection [4, 6]
bisection_iteration("yexact", 4, 6, 0.0001);
%%
% h şıkkı - fixed_point 0
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
fxd_pnt_iteration(pol_LIP, 0, 0.0001);
%%
% h şıkkı - fixed_point 0
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
fxd_pnt_iteration(pol_NBFIP, 0, 0.0001);
%%
% h şıkkı - fixed_point 0
fxd_pnt_iteration("yexact", 0, 0.0001);
%%
% h şıkkı - fixed_point 3
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
fxd_pnt_iteration(pol_LIP, 3, 0.0001);
%%
% h şıkkı - fixed_point 3
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
fxd_pnt_iteration(pol_NBFIP, 3, 0.0001);
%%
% h şıkkı - fixed_point 3
fxd_pnt_iteration("yexact", 3, 0.0001);
%%
% h şıkkı - newton_raphson 0
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
newton_raphson_iteration(pol_LIP, 0, 0.0001);
%%
% h şıkkı - newton_raphson 0
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
newton_raphson_iteration(pol_NBFIP, 0, 0.0001);
%%
% h şıkkı - newton_raphson 2
newton_raphson_iteration("yexact", 2, 0.0001);
%%
% h şıkkı - newton_raphson 3
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
newton_raphson_iteration(pol_LIP, 0, 0.0001);
%%
% h şıkkı - newton_raphson 3
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
newton_raphson_iteration(pol_NBFIP, 0, 0.0001);
%%
% h şıkkı - newton_raphson 5
newton_raphson_iteration("yexact", 2, 0.0001);
%%
% h şıkkı - secant 0,1
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
secant_iteration(pol_LIP, 0, 1, 0.0001);
%%
% h şıkkı - secant 0,1
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
secant_iteration(pol_NBFIP, 0, 1, 0.0001);
%%
% h şıkkı - secant 0,2
secant_iteration("yexact", 0, 2, 0.0001);
%%
% h şıkkı - secant 4,5
pol_LIP = b([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
secant_iteration(pol_LIP, 4, 5, 0.0001);
%%
% h şıkkı - secant 4,5
pol_NBFIP = c([0, 1.2, 2.4, 3.6, 4.8, 6], [10.0000, 6.7113, 0.0251, -3.9177, -2.4043, 1.5065]);
secant_iteration(pol_NBFIP, 4, 5, 0.0001);
%%
% h şıkkı - secant 4,5
secant_iteration("yexact", 4, 5, 0.0001);