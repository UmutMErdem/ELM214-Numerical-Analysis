% 1.soru
format rational
A = [2 -1 2 0; 2 -1 -1 1; 2 2 1 0; 2 -1 2 2];
b = [8; 5; 4; 10];
disp("1.soru");
x = linsolve(A,b);
disp(x);
x = A\b;
disp(x);
x = inv(A)*b;
disp(x);
%% 2.soru
A = [2 3 -1; 1 -2 2; -1 4 1];
b = [4; 6; 5];
x = [];
for i = 1:length(A)
    T = A; 
    T(:,i)=b;
    x = [x; det(T)/det(A)];
end
disp("2.soru");
disp(x);
%% 3.soru
A = [2 -1 1; 3 3 9; 3 3 5];
b = [-1; 0; 4];
[L,U] = lu(A);
x = (L*U)\b;
disp("3.soru");
disp("L matrisi");
disp(L);
disp("U matrisi");
disp(U);
disp("x matrisi");
disp(x);
%% 4.soru
syms x1 x2 x3;
A = [4 2 2; 2 6 2; 2 2 5];
disp("4.soru");
if all([det(A(1,1))>0, det(A(1:2,1:2))>0, det(A(1:3,1:3))>0])
    disp("a) A pozitif tanımlı.");
else
    disp("a) A pozitif tanımlı değil.");
end
disp("b)");
R = chol(A);
disp("R matrisi");
disp(R);
disp("A = R'*R");
disp(R'*R);
disp("c)");
b = [4; 6; -1]; 
x = linsolve(A, b);
disp(x);
x = A\b;
disp(x);
x = inv(A)*b;
disp(x);
%% 5.soru
disp("5.soru");
A=[1 2; -1 2];
[V, D]=eig(A);
disp("a)");
disp("öz vektörler(V)");
disp(V);
disp("öz değerler(D)");
disp(D);
A=[-1 2 0; 0 3 4; 0 0 7];
[V, D]=eig(A);
disp("b)");
disp("öz vektörler(V)");
disp(V);
disp("öz değerler(D)");
disp(D);