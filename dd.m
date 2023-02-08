function [X,L] = dd(A,B,W,P,X,L)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

for i=1:100
[x,v]=cstjpc(A,B,W,P);
if abs(x(1,1))<0.00001&&abs(x(2,1))<0.00001&&abs(x(3,1))<0.00001
    break

else 
    L=L+v;
    X=X+x;
    
end
delta_A=zeros(4,8);
delta_B=zeros(4,3);
for j=1:+1:4
delta_A(j,2*j-1)=2*(v(2*j-1,1)-x(1,1));
delta_A(j,2*j)=2*(v(2*j,1)-x(2,1));
delta_B(j,1)=-2*(v(2*j-1,1)-x(1,1));
delta_B(j,2)=-2*(v(2*j,1)-x(2,1));
delta_B(j,3)=-2*x(3,1);
W(j,1)=(L(2*j-1,1)-X(1,1))^2+(L(2*j,1)-X(2,1))^2-X(3,1)^2;
end

A=A+delta_A;
B=B+delta_B;
end

