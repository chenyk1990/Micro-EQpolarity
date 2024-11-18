function [trpl]=v2trpl(xyz)
% Jan. 9, 2023, Yunfeng Chen, Global Seismology Group, Zhejiang University,
% convert the a vector given (x, y, z) coordinates to trend (strike) 
% and plunge (dip) 
% Input: 
% xyz: 1x3 vector that contains the x, y and z coordinates
% Output:
% trpl: 1x2 vector that contains trend and plunge values
for j=1:3
    if abs(xyz(j))<=0.0001
        xyz(j)=0;
    end
    if abs(xyz(j)-1.0)<0.0001
        xyz(j)=xyz(j)/abs(xyz(j));
    end
end
if abs(xyz(3))==1.0     % the unit vector is on Z axis
    if xyz(3)<0.0       % vector is pointing in -Z direction, trend is 180 by defination
        trpl(1)=180;
    else
        trpl(1)=0;      % vector is pointing in Z direction, trend is 180 by defination
    end
    trpl(2)=90;         % plunge is 90 degree
    return
end
if abs(xyz(1))<0.0001   % vector is in YOZ plane
    if xyz(2)>0.0       % y>0 vector is pointing in Y direction in YOZ plane
        trpl(1)=90.0;   
    elseif xyz(2)<0.0   % y<0 vector is pointing in -Y direction in YOZ plane
        trpl(1)=270.0;
    else
        trpl(1)=0.0;    % y=0 vector is poiting in Z direction 
    end
else
    trpl(1)=rad2deg(atan2(xyz(2),xyz(1)));
end
hypotxy=hypot(xyz(1),xyz(2));
trpl(2)=rad2deg(atan2(xyz(3),hypotxy));
if trpl(2)<0.0
    trpl(2)=-trpl(2);
    trpl(1)=trpl(1)-180;
end
if trpl(1)<0.0
    trpl(1)=trpl(1)+360;
end