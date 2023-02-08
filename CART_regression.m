function [Ls,c1,c2] = CART_regression(y)
c1=zeros(1,size(y,2)-1);
c2=zeros(1,size(y,2)-1);
Ls=zeros(1,size(y,2)-1);
for i=1:1:size(y,2)-1
    y1=y(1:i);
    y2=y(i+1:size(y,2));
    c1(i)=mean(y1);
    c2(i)=mean(y2);
    Ls(i)=var(y1)*(size(y1,2)-1)+var(y2)*(size(y2,2)-1);
end

