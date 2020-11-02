function fill_between(ax, x,upper,lower,fillcolor, transparency, edgecolor)
%USAGEfill_between(ax, x,upper,lower,fillcolor, transparency, edgecolor)
%This function will fill a region with a color between the two vectors provided
%using the Matlab fill command.
%
%ax    = the axis 
%x     = The horizontal (x) data points. Note length(Upper)
%         must equal Length(lower)and must equal length(x)!
%upper = the upper curve values (e.g. mean +sem)
%lower = the lower curve values (e.g. mean -sem)
%fillcolor = the color of the filled area 
%transparency = alpha value (0-1)
%edgecolor = the edge color

if nargin<7;edgecolor='none';end  
if nargin<6;transparency=.5;end %default is to have a transparency of .5
if nargin<5;fillcolor='b';end %default color is blue
if size(x,2) == size(upper,1)
    upper = upper';
    lower = lower';
end

if length(upper)==length(lower) && length(lower)==length(x)
    take = ne(upper,lower);
    upper(~take) = upper(~take)+(1/10^100);
    lower(~take) = lower(~take)-(1/10^100);
    finite_up = isfinite(upper);
    finite_low= isfinite(lower);
    filled=[upper(finite_up),fliplr(lower(finite_low))];
    xpoints=[x(finite_up&finite_low),fliplr(x(finite_up&finite_low))];
    fill(ax, xpoints,filled,fillcolor,'EdgeColor',edgecolor,'FaceAlpha',transparency,'EdgeAlpha',transparency); hold on%plot the data
    

else
    disp('Error: Must use the same number of points in each vector');
end
