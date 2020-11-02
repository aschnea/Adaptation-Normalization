function [resp] = rvc_fit(p,c)

con1=[0 0.0625 0.125 0.25 0.5];
con1=[con1 con1 con1 con1 con1];
con2=[0*ones(1,5) 0.0625*ones(1,5) 0.125*ones(1,5) 0.25*ones(1,5) 0.5*ones(1,5)];
con=[con1;con2];

num=(p(2)*con(1,:)+p(4)*con(2,:)).^p(3);
den=1+(p(5)*con(1,:)).^p(3)+(p(6)*con(2,:)).^p(3);

resp=p(1)+(num./den);

% r = B + ((A1*c1)^n + (A2*c2)^n)/(1+(d1*c1)^n+(d2*c2)^n)