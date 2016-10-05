%in1 is experience and in2 is projects
function []=myfuzzy(in1,in2)
%experience
figure(1);
%in1=2;in2=5;
xe=0:.001:20;
ae1=0;be1=0;ce1=3;de1=5;
[ye1, valel]=trapezoidal(xe,ae1,be1,ce1,de1,in1);

ae2=4;be2=5;ce2=8;de2=10;
[ye2, valem]=trapezoidal(xe,ae2,be2,ce2,de2,in1);

ae3=9;be3=10;ce3=20;de3=20;
[ye3, valeh]=trapezoidal(xe,ae3,be3,ce3,de3,in1);

subplot(3,1,1);
plot(xe,ye1,xe,ye2,xe,ye3);
title('Experience MF');
grid on;
xlabel('Years');
ylabel('MF');
legend('Low','Medium','High');

%projects
xp=0:.001:20;
ap1=0;bp1=0;cp1=3;dp1=4;
[yp1, valpl]=trapezoidal(xp,ap1,bp1,cp1,dp1,in2);

ap2=3;bp2=4;cp2=6;dp2=9;
[yp2, valpm]=trapezoidal(xp,ap2,bp2,cp2,dp2,in2);

ap3=8;bp3=12;cp3=20;dp3=20;
[yp3, valph]=trapezoidal(xp,ap3,bp3,cp3,dp3,in2);

subplot(3,1,2);
plot(xp,yp1,xp,yp2,xp,yp3);
title('Projects MF');
grid on;
xlabel('Number of Projects');
ylabel('MF');
legend('Low','Medium','High');

%rules
r1=min(valeh,valph);
r2=min(valel,valpl);
r3=min(valem,valpm);

%output
x=0:.001:20;
as1=0;bs1=0;cs1=2;ds1=3;    
[ysl, valsl]=trapezoidal(x,as1,bs1,cs1,ds1,0);
for i=1:length(x)
if(ysl(i)>r2)
    l(i)=r2;
else
    l(i)=ysl(i);
end
end

as2=2;bs2=4;cs2=9;ds2=12;
[ysm, valsm]=trapezoidal(x,as2,bs2,cs2,ds2,0);
for i=1:length(x)
if(ysm(i)>r3)
    m(i)=r3;
else
    m(i)=ysm(i);
end
end


as3=9;bs3=12;cs3=20;ds3=20;
[ysh, valsh]=trapezoidal(x,as3,bs3,cs3,ds3,0);
for i=1:length(x)
if(ysh(i)>r1)
    n(i)=r1;
else
    n(i)=ysh(i);
end
end


subplot(3,1,3);
plot(x,ysl,x,ysm,x,ysh);
title('Salary MF');
grid on;
xlabel('Salary');
ylabel('MF');
legend('Low','Medium','High');


figure(2);
%union of the 3 rules
for i=1:length(x)
    if (l(i)>m(i))
        if(l(i)>n(i))
        y(i)=l(i);
        else
        y(i)=n(i);
        end
    else
        if(m(i)>n(i))
        y(i)=m(i);
        else
        y(i)=n(i);
        end
    end
end

plot(x,y);
title('Output corresponding to User Input');
axis([0 20 0 1])
grid on;
xlabel('Salary (L)');
ylabel('MF');


answer=sum(x.*y)/sum(y);
fprintf(1,'Salary=%f L\n ',answer);
end
