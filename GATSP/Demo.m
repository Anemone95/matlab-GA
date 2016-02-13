% Author:         Anemone
% Filename:       Demo.m
% Last modified:  2016-02-12 23:00
% E-mail:         x565178035@126.com

X=[
16.47,96.10
16.47,94.44
20.09,92.54
22.39,93.37
25.23,97.24
22.00,96.05
20.47,97.02
17.29,96.29
16.30,97.38
14.05,98.12
16.53,97.38
21.52,95.59
20.09,92.55];

D=Distance(X);
figure('Name','Point-Line');
hold on;

% plot line
for n = 1:length(X)-1
    for m = (n+1):length(X)
        plot(X([n,m],1),X([n,m],2),'b-');
    end
end

% plot point
plot(X(:,1),X(:,2),'r*'); 
save D
N=size(D,1);
[obj,x]=GATSP(N,D);
