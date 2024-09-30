% a sikki
p = @(x)((abs(cos(3*x/4)).^8 + (abs(sin(3*x/4)).^8)).^(-1/4));
syms x z; fi = linspace(0, 2*pi, 360); y = p(fi);
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
legend("g(fi)", "p-3-uc-f", "p-3-uc-b", "p-3-ara-f", "p-3-ara-b", "Location","northeastoutside");
title("combination of graphics")
hold off;
% c sikki
s =linspace(1e-32, 2*pi, 10); f=[]; v=[]; t = []; pf = []; fon=[]; 
syms x; p_s = [1 x x^2 x^3; 0 1 2*x 3*x^2]; 
for i=1:length(s)
    v = [v;p(s(i));g(s(i))]; f = [f;subs(p_s, x, s(i))];
end
for i=1:length(s)
    t = [];
    if i >=2
        t = [t;inv(f((2*i-3:2*i),:))*v(2*i-3:2*i)].';
    elseif i==1
        t = [inv(f((1:4),:))*v(1:4)]';
    end
    fon = [fon; (t(1)+t(2)*x+t(3)*x^2+t(4)*x^3)];
    pf = [pf, subs(fon(i), x, s(i))];
end
figure;
tiledlayout('flow')
nexttile
polarplot(s,pf, LineWidth=2);
title("Hermite")
nexttile
polarplot(fi,y, LineWidth=2, LineStyle="-.");
title("p(fi)")
nexttile
polarplot(s,pf, LineWidth=2);
hold on;
polarplot(fi,y, LineWidth=2, LineStyle="-.");
legend("Hermite", "p(fi)", "Location","northeastoutside");
title("combination of grafics")
hold off;
% d sikki
c=[]; p_3_uc_f=[]; p_3_uc_b=[]; p_3_ara_f=[]; p_3_ara_b=[]; h = (2*pi-1e-32)/length(s);
for i=1:length(s)
    H = matlabFunction(fon(i));
    H_diff = matlabFunction(diff(H, x));
    c = [c, H_diff(s(i))];
    p_3_uc_f = [p_3_uc_f, ((-3*H(s(i)))+(4*H(s(i)+h))-H(s(i)+2*h))/(2*h)];
    p_3_uc_b = [p_3_uc_b, ((-3.*H(s(i)))+(4.*H(s(i)-h))-H(s(i)-2*h))/(-2*h)];
    p_3_ara_f = [p_3_ara_f, ((H(s(i)+h))-(H(s(i)-h)))/(2*h)];
    p_3_ara_b = [p_3_ara_b, ((H(s(i)-h))-(H(s(i)+h)))/(-2*h)];
end
figure;
tiledlayout('flow')
nexttile
polarplot(s, c, LineWidth=2);
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
polarplot(s, c, LineWidth=2);
hold on;
polarplot(s, p_3_uc_f, LineWidth=2, LineStyle=":");
polarplot(s, p_3_uc_b, LineWidth=2, LineStyle="--");
polarplot(s, p_3_ara_f, LineWidth=2, LineStyle=":");
polarplot(s, p_3_ara_b, LineWidth=2, LineStyle="-.");
legend("g(fi)", "p-3-uc-f", "p-3-uc-b", "p-3-ara-f", "p-3-ara-b", "Location","northeastoutside");
title("combination of graphics")
hold off;
% e sikki
h_p = matlabFunction(log((x_fi(x).^2 + y_fi(x).^2)^0.5));
h_p_diff = matlabFunction(I_x.*cos(x) + I_y.*sin(x));
figure;
polarplot(fi, h_p(fi));
figure;
polarplot(fi, h_p_diff(fi));