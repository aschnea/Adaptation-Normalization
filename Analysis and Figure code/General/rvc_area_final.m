
%   takes responses and calculates areas

function [area] = rvc_area(R,c)

R=R-R(1);   %first response is really response to mask
R(R<0)=0;

area=0;
for i=2:length(c)-1             %skip the zero contrast point
    con_diff=log10(c(3))-log10(c(2));
    area=area+con_diff*(R(i)+0.5*(R(i+1)-R(i)));
end
