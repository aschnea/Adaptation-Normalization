function [resp] = rvc_fit_NI(p,c)

% num=(p(2)*c(1,:)).^p(3)+(p(4)*c(2,:)).^p(3);
num=(p(2)*c(1,:)+p(4)*c(2,:)).^p(3);
den=1+(p(5)*c(1,:)).^p(3)+(p(6)*c(2,:)).^p(3);

resp=p(1)+(num./den);

% r = (B + (A1*c1)^n + (A2*c2)^n)/(1+(d1*c1)^n+(d2*c2)^n)
