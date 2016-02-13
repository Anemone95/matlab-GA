% Author:         Anemone
% Filename:       demo2.m
% Last modified:  2016-02-12 22:52
% E-mail:         x565178035@126.com

[best,x]=EzGA([-1e5 1e5;-1e5 1e5],@optFun,1e2,[0.7 0.8])
