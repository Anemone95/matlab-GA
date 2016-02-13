y=@(x)x(1)^2+x(2)^2;
[best,x]=EzGA([-1e7 1e7;-1e7 1e7],y,1e3)
