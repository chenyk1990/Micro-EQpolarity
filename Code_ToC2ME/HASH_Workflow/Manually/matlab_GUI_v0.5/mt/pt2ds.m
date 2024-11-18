function [str1,dip1,rake1,str2,dip2,rake2,Btrpl,PTangle]=pt2ds(Ptrpl,Ttrpl)
SR2=sqrt(2);
Ptrpl=deg2rad(Ptrpl);
Ttrpl=deg2rad(Ttrpl);
P=[cos(Ptrpl(1))*cos(Ptrpl(2)),sin(Ptrpl(1))*cos(Ptrpl(2)),sin(Ptrpl(2))];
T=[cos(Ttrpl(1))*cos(Ttrpl(2)),sin(Ttrpl(1))*cos(Ttrpl(2)),sin(Ttrpl(2))];
PTangle=rad2deg(acos(dot(P,T)));
if(abs(PTangle-90)>10)
    warning('Two planes are not perpendicular')
end
B=cross(T,P);
A=SR2*(T+P);
N=SR2*(T-P);
Btrpl=v2trpl(B);
[str1,dip1,rake1]=an2dsr_wan(A,N);
[str2,dip2,rake2]=an2dsr_wan(N,A);
return