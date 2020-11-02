function [r] = adapt_decayfx(p,c)
% single exponential decay fit to adaptation; change in responsivity
% p1 = offset
% p2 = amplitude
% p3 = time constant

r = p(1) + p(2)*exp(-c/p(3));
% r = p(1)*exp(p(2)*c);