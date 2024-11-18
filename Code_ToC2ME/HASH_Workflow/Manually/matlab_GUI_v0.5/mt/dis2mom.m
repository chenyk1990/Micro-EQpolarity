function [m]=dis2mom(strike,dip,rake)
% Jan. 9, 2023, Yunfeng Chen, Global Seismology Group, Zhejiang University,
% compute the moment tensor given the displacement vector of the fault
% plane
% Input: 
% strike: strike of the fault plane measured as the angle clockwise from 
%         the north
% dip: dipping angle of the fault plane measured as the angle from the
%      horizontal plane
% rake: slip angle of the fault plane measured as the angle from the strike
%       direction on the fault plane in anti-clockwise direction
% Output:
% Mxx=m(1),Myy=m(2),Mzz=m(3),Mxy=m(4),Mxz=m(5),Myz=m(6)
con=pi/180.;
s=strike*con;
d=dip*con;
r=rake*con;
m(1)=-sin(s)*sin(s)*sin(r)*sin(2*d)-sin(2*s)*cos(r)*sin(d);
m(2)=-cos(s)*cos(s)*sin(r)*sin(2*d)+sin(2*s)*cos(r)*sin(d);
m(3)=sin(r)*sin(2*d);
m(4)=cos(2*s)*cos(r)*sin(d)+0.5*sin(2*s)*sin(r)*sin(2*d);
m(5)=-cos(s)*cos(r)*cos(d)-sin(s)*sin(r)*cos(2*d);
m(6)=-sin(s)*cos(r)*cos(d)+cos(s)*sin(r)*cos(2*d);
return
