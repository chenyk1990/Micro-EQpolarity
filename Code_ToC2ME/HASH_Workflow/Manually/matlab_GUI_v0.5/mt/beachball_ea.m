function beachball_ea(str,dip,rake,siz,n,clr,lat,lon,iptb,insew,fillcode)
if n<5
    n=5;
elseif n>50
    n=50;
end
d2r=pi/180;
pi2=pi*2;
str=str*d2r;
dip=dip*d2r;
rake=rake*d2r;
if(iptb)
    [Ptrpl,Ttrpl,Btrpl,str2,dip2,rake2]=dsrin(rad2deg(str),rad2deg(dip),rad2deg(rake));
else
    A=[cos(rake)*cos(str)+sin(rake)*cos(dip)*sin(str),...
        cos(rake)*sin(str)-sin(rake)*cos(dip)*cos(str),...
        -sin(rake)*sin(dip)];
    N=[-sin(str)*sin(dip),cos(str)*sin(dip),-cos(dip)];
    [str2,dip2,rake2]=an2dsr_wan(N,A);
end
% the first fault plane
rak=0:-pi/n:-pi;
cosih=-sin(dip)*sin(rak);
ih=acos(cosih);
cosdet=sqrt(1-cosih.^2);
fai=real(acos(cos(rak)./cosdet));
str1=str+fai;
xs1=siz*sqrt(2)*sin(ih/2).*sin(str1);
ys1=siz*sqrt(2)*sin(ih/2).*cos(str1);

% the second fault plane
str2=deg2rad(str2);
dip2=deg2rad(dip2);
cosih=-sin(dip2)*sin(rak);
ih=acos(cosih);
cosdet=sqrt(1-cosih.^2);
fai=real(acos(cos(rak)./cosdet));
str21=str2+fai;
xs2=siz*sqrt(2)*sin(ih/2).*sin(str21);
ys2=siz*sqrt(2)*sin(ih/2).*cos(str21);
str1=str+pi;
if str1>pi2
    str1=str1-pi2;
end
d=str2;
d1=d+pi;
if str1-d>pi
    d=d-pi2;
elseif str1-d>=pi
    str1=str1-pi2;
end
if d1-str>pi
    d1=d1-pi2;
elseif d1-str1>=pi
    str=str-pi2;
end
st1=str1:(d-str1)/n:d;
st2=d1:(str-d1)/n:str;
p=[xs1,sin(st1)*siz,xs2,sin(st2)*siz]+lon;
q=[ys1,cos(st1)*siz,ys2,cos(st2)*siz]+lat;

n=n+n;
x=-siz:2*siz/n:siz;
y=sqrt(siz*siz-x.^2);
if(fillcode)
    if(rake>0)
        fill([x,x(n+1:-1:1)]+lon,[y,-y(n+1:-1:1)]+lat,'w',p,q,clr);
    else
        fill([x,x(n+1:-1:1)]+lon,[y,-y(n+1:-1:1)]+lat,clr,p,q,'w');
    end
else
    plot(siz*cos(0:2*pi/n:2*pi),siz*sin(0:2*pi/n:2*pi),'k');
    hold on;
    plot(xs1,ys1,'Color',clr)
    plot(xs2,ys2,'Color',clr)
end
if (insew)
    hold on;
    line([0,0],[siz,siz*1.1]); % plot north direction
    text(0,siz*1.1,'N');
    line([-siz,-siz*1.1],[0,0]); % plot west direction
    text(-siz*1.1,0,'W');
    line([siz,siz*1.1],[0,0]); % plot east direction
    text(siz*1.1,0,'E');
    line([0,0],[-siz,-siz*1.1]); % plot south direction
    text(0,-siz*1.1,'S');    
end
if(iptb)
    hold on;
    % plot P axis
    rp=siz*sqrt(2)*sind((90-Ptrpl(2))/2);
    xp=lon+rp*sind(Ptrpl(1));
    yp=lat+rp*cosd(Ptrpl(1));
    plot(xp,yp,'.');
    text(xp+0.1,yp,'P');
    % plot T axis
    rp=siz*sqrt(2)*sind((90-Ttrpl(2))/2);
    xp=lon+rp*sind(Ttrpl(1));
    yp=lat+rp*cosd(Ttrpl(1));
    plot(xp,yp,'o');
    text(xp+0.1,yp,'T');
    % plot B axis
    rp=siz*sqrt(2)*sind((90-Btrpl(2))/2);
    xp=lon+rp*sind(Btrpl(1));
    yp=lat+rp*cosd(Btrpl(1));
    plot(xp,yp,'+');
    text(xp+0.1,yp,'B');
end
return
