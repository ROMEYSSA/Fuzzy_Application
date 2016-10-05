function [y,val]=trapezoidal(x,a,b,c,d,indata)
for i=1:length(x)
    if (x(i)<=a)    y(i)=0;
    elseif (x(i)>a && x(i)<=b)   y(i)=(x(i)-a)/(b-a); 
    elseif (x(i)>b && x(i)<=c)   y(i)=1;
    elseif (x(i)>c && x(i)<=d)   y(i)=(d-x(i))/(d-c); 
    elseif (x(i)>d)   y(i)=0;
    end
    if(x(i)==indata)
        val=y(i);
    end
end
end