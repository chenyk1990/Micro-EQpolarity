function [str,dip,rake]=an2dsr_wan(A,N)
% Jan. 9, 2023, Yunfeng Chen, Global Seismology Group, Zhejiang University,
% obtain the strike, dip and rake of a fault plane given the slip vector
% and normal vector of the fault plane
% Input: 
% A: 1x3 vector that defines the slip vector of the fault plane
% N: 1x3 vector that defines the normal vector of the fault plane
% Output:
% trpl: 1x2 vector that contains trend and plunge values
if N(3)==-1.0       % the fault plane is a horizontal plane
    str=atan2(A(2),A(1));   % the strike direction is the same as slip vector
    dip=0.0;
else
    str=atan2(-N(1),N(2));
    if (N(3)==0.0)
        dip=0.5*pi;
    elseif (abs(sin(str))>=0.1)
        dip=atan2(-N(1)/sin(str),-N(3));
    else
        dip=atan2(N(2)/cos(str), -N(3));
    end
end
a1=A(1)*cos(str)+A(2)*sin(str);
if abs(a1)<0.0001
    a1=0.0;
end
if A(3)~=0.0
    if dip~=0.0
        rake=atan2(-A(3)/sin(dip),a1);
    else
        rake=atan2(-1000000.0*A(3),a1);
    end
else
    if a1>1
        a1=1.0;
    end
    if a1<-1
        a1=-1.0;
    end
    rake=acos(a1);
end
if dip<0.0
    dip=dip+pi;
    rake=pi-rake;
    if rake>pi
        rake=rake-2*pi;
    end
end
if dip>0.5*pi
    dip=pi-dip;
    str=str+pi;
    rake=-rake;
    if str>=2*pi
        str=str-2*pi;
    end
end
if str<0
    str=str+2.0*pi;
end
str=rad2deg(str);
dip=rad2deg(dip);
rake=rad2deg(rake);
return
       