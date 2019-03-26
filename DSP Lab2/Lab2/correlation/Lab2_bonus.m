%Checking my correlation function
a = randn(30,1);
b = randn(30,1);
c = correlation(a, b);
disp(c);
xc = corr(a, b);
disp(xc);