function [Ptrpl,Ttrpl,Btrpl,str2,dip2,rake2]=dsrin(str,dip,rake)
SR2=sqrt(2);
str=deg2rad(str);
dip=deg2rad(dip);
rake=deg2rad(rake);
A=[cos(rake)*cos(str)+sin(rake)*cos(dip)*sin(str),...
    cos(rake)*sin(str)-sin(rake)*cos(dip)*cos(str),...
    -sin(rake)*sin(dip)];
N=[-sin(str)*sin(dip),cos(str)*sin(dip),-cos(dip)];
T=SR2*(A+N);
P=SR2*(A-N);
B=cross(P,T);
[Ptrpl]=v2trpl(P);
[Ttrpl]=v2trpl(T);
[Btrpl]=v2trpl(B);
[str2,dip2,rake2]=an2dsr_wan(N,A);
return