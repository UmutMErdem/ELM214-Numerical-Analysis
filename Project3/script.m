% a sikki
p = @(x)((abs(cos(3*x/4)).^8 + (abs(sin(3*x/4)).^8)).^(-1/4));
syms x; fi = linspace(0, 2*pi, 360); y = p(fi);
figure;
tiledlayout('flow')
nexttile
polarplot(fi, y, LineWidth=2);
title('p(fi)')
x_fi = @(x)(p(x).*cos(x)); y_fi = @(x)(p(x).*sin(x));
nexttile
plot(x_fi(fi), y_fi(fi), LineWidth=2);
title('x(fi)-y(fi)')
% b sikki
x_diff = diff(x_fi, x); y_diff = diff(y_fi, x);
L = matlabFunction((x_diff.^2 + y_diff.^2)^0.5);
I_x = matlabFunction(x_diff./L); I_y = matlabFunction(y_diff./L);
figure;
plot(I_x(fi), I_y(fi), LineWidth=2);
g = matlabFunction(diff(p, x));
p_3_uc_f = ((-3.*p(fi))+(4.*p(fi+0.1))-p(fi+0.2))./0.2;
p_3_uc_b = ((-3.*p(fi))+(4.*p(fi-0.1))-p(fi-0.2))./-0.2;
p_3_ara_f = ((p(fi+0.1))-(p(fi-0.1)))./0.2;
p_3_ara_b = ((p(fi-0.1))-(p(fi+0.1)))./-0.2;
figure;
tiledlayout('flow')
nexttile
polarplot(fi, g(fi), LineWidth=2);
title("g(fi)")
nexttile
polarplot(fi, p_3_uc_f, LineWidth=2, LineStyle=":");
title("p-3-uc-f")
nexttile
polarplot(fi, p_3_uc_b, LineWidth=2, LineStyle="--");
title("p-3-uc-b")
nexttile
polarplot(fi, p_3_ara_f, LineWidth=2, LineStyle=":");
title("p-3-ara-f")
nexttile
polarplot(fi, p_3_ara_b, LineWidth=2, LineStyle="-.");
title("p-3-ara-b")
nexttile
polarplot(fi, g(fi), LineWidth=2);
hold on;
polarplot(fi, p_3_uc_f, LineWidth=2, LineStyle=":");
polarplot(fi, p_3_uc_b, LineWidth=2, LineStyle="--");
polarplot(fi, p_3_ara_f, LineWidth=2, LineStyle=":");
polarplot(fi, p_3_ara_b, LineWidth=2, LineStyle="-.");
legend("g(fi)", "p_3_uc_f", "p_3_uc_b", "p_3_ara_f", "p_3_ara_b", "Location","northeastoutside");
title("combination of graphics")
hold off;
% c sikki
s =[linspace(1e-32, 2*pi, 200)]; f_s_c=[]; f_s_t=[]; f_s_c_diff=[]; f_s_t_diff=[]; f_s_c_diff2=[]; f_s_t_diff2=[]; 
v_s_c=[]; v_s_t=[]; v_s_c_diff=[]; v_s_t_diff=[]; pf = []; fon=[]; 
syms x z a0 a1 a2 a3 b0 b1 b2 b3; g_diff = matlabFunction(diff(g,x));
p_s_c = a0+a1*(x-z)+a2*((x-z)^2)+a3*((x-z)^3);
p_s_c_diff = a1+2*a2*(x-z)+3*a3*((x-z)^2);
p_s_c_diff2 = 2*a2+6*a3*(x-z);
p_s_t = b0+b1*(x-z)+b2*((x-z)^2)+b3*((x-z)^3);
p_s_t_diff = b1+2*b2*(x-z)+3*b3*((x-z)^2);
p_s_t_diff2 = 2*b2+6*b3*(x-z);
for i=2:length(s)
    if mod(i,2)==0
    f_s_c = [f_s_c; subs(p_s_c, [x, z], [s(i-1), s(i-1)]); subs(p_s_c, [x, z], [s(i), s(i-1)])];
    v_s_c = [v_s_c; p(s(i-1)); p(s(i))];
    f_s_c_diff = [f_s_c_diff; subs(p_s_c_diff, [x,z], [s(i-1), s(i-1)]); subs(p_s_c_diff, [x, z], [s(i), s(i-1)])];
    v_s_c_diff = [v_s_c_diff; g(s(i-1)); g(s(i))];
    f_s_c_diff2 = [f_s_c_diff2; subs(p_s_c_diff2, [x,z], [s(i-1), s(i-1)]); subs(p_s_c_diff2, [x, z], [s(i), s(i-1)])];
    else
    v_s_t = [v_s_t; p(s(i-1)); p(s(i))];
    f_s_t = [f_s_t; subs(p_s_t, [x, z], [s(i-1), s(i-1)]); subs(p_s_t, [x, z], [s(i-1), s(i-1)])];
    f_s_t_diff = [f_s_t_diff; subs(p_s_t_diff, [x,z], [s(i-1), s(i-1)]); subs(p_s_t_diff, [x, z], [s(i), s(i-1)])];
    v_s_t_diff = [v_s_t_diff; g(s(i-1)); g(s(i))];
    f_s_t_diff2 = [f_s_t_diff2; subs(p_s_t_diff2, [x,z], [s(i-1), s(i-1)]); subs(p_s_t_diff2, [x, z], [s(i), s(i-1)])];
    end
end
for i=2:length(s)-1
    t = []; d=[];
    if mod(i,2)==0
        l= solve([f_s_c(i-1)==v_s_c(i-1), f_s_c_diff(i-1)==v_s_c_diff(i-1), f_s_c(i)==f_s_t(i-1)==v_s_c(i), f_s_c_diff(i)==f_s_t_diff(i-1)==v_s_c_diff(i), f_s_c_diff2(i)==f_s_t_diff2(i-1), f_s_t_diff2(i)==f_s_c_diff2(i-1)==0], [a0,a1,a2,a3,b0,b1,b2,b3]);
        t = l.a0+l.a1*(x-s(i-1))+l.a2*(x-s(i-1))^2+l.a3*(x-s(i-1))^3;
        d = [subs(t, x, s(i-1))];
    else
        l= solve([f_s_t(i-2)==v_s_t(i-2), f_s_t_diff(i-2)==v_s_t_diff(i-2), f_s_t(i-1)==f_s_c(i)==v_s_t(i-1), f_s_t_diff(i-1)==f_s_c_diff(i)==v_s_t_diff(i-1), f_s_t_diff2(i-1)==f_s_c_diff2(i), f_s_c_diff2(i+1)==f_s_t_diff2(i-1)==0], [a0,a1,a2,a3,b0,b1,b2,b3]);
        t = l.b0+l.b1*(x-s(i-1))+l.b2*(x-s(i-1))^2+l.b3*(x-s(i-1))^3;
        d = [subs(t, x, s(i-1))];
    end
    fon = [fon; t];
    pf = [pf, double(d)];
end
if mod(length(s),2)==0
    l= solve([f_s_c(length(s))==v_s_c(length(s)), f_s_c_diff(length(s))==v_s_c_diff(length(s)), f_s_c(length(s)-1)==f_s_t(length(s)-2)==v_s_c(length(s)-1), f_s_c_diff(length(s)-1)==f_s_t_diff(length(s)-2)==v_s_c_diff(length(s)-1), f_s_c_diff2(length(s)-1)==f_s_t_diff2(length(s)-2), f_s_c_diff2(length(s))==f_s_t_diff2(length(s)-3)==0], [a0,a1,a2,a3,b0,b1,b2,b3]);
    t = [l.a0+l.a1*(x-s(i-1))+l.a2*(x-s(i-1))^2+l.a3*(x-s(i-1))^3];
    d = [subs(t, x, s(i-1)), subs(t, x, s(i))];
else
    l= solve([f_s_t(length(s)-1)==v_s_t(length(s)-1), f_s_t_diff(length(s)-1)==v_s_t_diff(length(s)-1), f_s_t(length(s)-2)==f_s_c(length(s)-1)==v_s_t(length(s)-2), f_s_t_diff(length(s)-2)==f_s_c_diff(length(s)-1)==v_s_t_diff(length(s)-2), f_s_t_diff2(length(s)-2)==f_s_c_diff2(length(s)-1), f_s_t_diff2(length(s)-1)==f_s_c_diff2(length(s)-2)==0], [a0,a1,a2,a3,b0,b1,b2,b3]);
    t = [l.b0+l.b1*(x-s(i-1))+l.b2*(x-s(i-1))^2+l.b3*(x-s(i-1))^3];
    d = [subs(t, x, s(i-1)), subs(t, x, s(i))];
end
fon = [fon; t];
pf = [pf, double(d)];
figure;
tiledlayout('flow')
nexttile
polarplot(s,pf, LineWidth=2);
title("cubic spline")
nexttile
polarplot(fi,y, LineWidth=2, LineStyle="-.");
title("p(fi)")
nexttile
polarplot(s,pf, LineWidth=2);
hold on;
polarplot(fi,y, LineWidth=2, LineStyle="-.");
legend("cubic spline", "p(fi)", "Location","northeastoutside");
title("combination of grafics")
hold off;
% d sikki
c=[]; p_3_uc_f=[]; p_3_uc_b=[]; p_3_ara_f=[]; p_3_ara_b=[]; h = (2*pi-1e-32)/length(s);
for i=1:length(s)
    if i ~= length(s)
        S = matlabFunction(fon(i));
    else
        S = matlabFunction(fon(i-1));
    end
    S_diff = diff(S(x));
    c = [c, double(S_diff)];
    p_3_uc_f = [p_3_uc_f, ((-3*S(s(i)))+(4*S(s(i)+h))-S(s(i)+2*h))/(2*h)];
    p_3_uc_b = [p_3_uc_b, ((-3.*S(s(i)))+(4.*S(s(i)-h))-S(s(i)-2*h))/(-2*h)];
    p_3_ara_f = [p_3_ara_f, ((S(s(i)+h))-(S(s(i)-h)))/(2*h)];
    p_3_ara_b = [p_3_ara_b, ((S(s(i)-h))-(S(s(i)+h)))/(-2*h)];
end
figure;
tiledlayout('flow')
nexttile
polarplot(s, c, LineWidth=1);
title("g(fi)")
nexttile
polarplot(s, p_3_uc_f, LineWidth=2, LineStyle=":");
title("p-3-uc-f")
nexttile
polarplot(s, p_3_uc_b, LineWidth=2, LineStyle="--");
title("p-3-uc-b")
nexttile
polarplot(s, p_3_ara_f, LineWidth=2, LineStyle=":");
title("p-3-ara-f")
nexttile
polarplot(s, p_3_ara_b, LineWidth=2, LineStyle="-.");
title("p-3-ara-b")
nexttile
polarplot(s, c, LineWidth=1);
hold on;
polarplot(s, p_3_uc_f, LineWidth=2, LineStyle=":");
polarplot(s, p_3_uc_b, LineWidth=2, LineStyle="--");
polarplot(s, p_3_ara_f, LineWidth=2, LineStyle=":");
polarplot(s, p_3_ara_b, LineWidth=2, LineStyle="-.");
legend("g(fi)", "p-3-uc-f", "p-3-uc-b", "p-3-ara-f", "p-3-ara-b", "Location","northeastoutside");
title("combination of graphics")
hold off;
% e sikki
value = [double(((2*pi-0)*sqrt(1/3)+(2*pi+0))/2), double(((2*pi-0)*(-sqrt(1/3))+(2*pi+0))/2), 0; double(((2*pi-0)*(-0.7746)+(2*pi+0))/2), double(((2*pi-0)+(2*pi+0))/2), double(((2*pi-0)*0.7746+(2*pi+0))/2)];
for i=1:2
    if i==1
        flag1=false; flag2=false;
        for j=1:length(s)-1
            if abs(value(1,1)-s(j))<= 1e-2 && flag1 == false
                flag1 = true; ro =matlabFunction(fon(j));
                x_fi = @(x)(ro(x).*cos(x)); y_fi = @(x)(ro(x).*sin(x));
                x_diff = diff(x_fi, x); y_diff = diff(y_fi, x);
                L_fi = matlabFunction((x_diff.^2 + y_diff.^2)^0.5);
                f_fi1 = matlabFunction(log(ro(x))*L_fi(x));
            end
            if abs(value(1,2)-s(j))<= 1e-2 && flag2 == false
                flag2 = true; ro =matlabFunction(fon(j));
                x_fi = @(x)(ro(x).*cos(x)); y_fi = @(x)(ro(x).*sin(x));
                x_diff = diff(x_fi, x); y_diff = diff(y_fi, x);
                L_fi = matlabFunction((x_diff.^2 + y_diff.^2)^0.5);
                f_fi2 = matlabFunction(log(ro(x))*L_fi(x));
            end
        end
        deger_2 = (f_fi1(value(1, 1))+ f_fi2((value(1, 2))))*((2*pi-0)/2);
    else
        flag1=false; flag2=false; flag3=false;
        for j=1:length(s)-1
            if abs(value(2,1)-s(j))<= 1e-1 && flag1 == false
                flag1 = true; ro =matlabFunction(fon(j));
                x_fi = @(x)(ro(x).*cos(x)); y_fi = @(x)(ro(x).*sin(x));
                x_diff = diff(x_fi, x); y_diff = diff(y_fi, x);
                L_fi = matlabFunction((x_diff.^2 + y_diff.^2)^0.5);
                f_fi1 = matlabFunction(log(ro(x))*L_fi(x));
            end
            if abs(value(2,2)-s(j))<= 1e-1 && flag2 == false
                flag2 = true; ro =matlabFunction(fon(j));
                x_fi = @(x)(ro(x).*cos(x)); y_fi = @(x)(ro(x).*sin(x));
                x_diff = diff(x_fi, x); y_diff = diff(y_fi, x);
                L_fi = matlabFunction((x_diff.^2 + y_diff.^2)^0.5);
                f_fi2 = matlabFunction(log(ro(x))*L_fi(x));
            end
            if abs(value(2,3)-s(j))<= 0.5 && flag3 == false
                flag3 = true; ro =matlabFunction(fon(j));
                x_fi = @(x)(ro(x).*cos(x)); y_fi = @(x)(ro(x).*sin(x));
                x_diff = diff(x_fi, x); y_diff = diff(y_fi, x);
                L_fi = matlabFunction((x_diff.^2 + y_diff.^2)^0.5);
                f_fi3 = matlabFunction(log(ro(x))*L_fi(x));
            end

        end
        deger_3 = ((5/9)*f_fi1(value(2, 1))+(8/9)*f_fi2(value(2, 2))+(5/9)*f_fi3(value(2, 3)))*((2*pi-0)/2);
    end
end
disp(deger_2);
disp(deger_3);