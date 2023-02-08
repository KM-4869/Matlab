%构建数据库。得到每一参考点的信号强度平均值。
ReferencePoint=zeros(97,30);
j=1;
k=0;
OnePoint=zeros(1,30);
for i=1:1:1989
    if database(i,1)==j
        OnePoint=OnePoint+database(i,2:31);
        k=k+1;
    end
    if database(i,1)~=j
        ReferencePoint(j,1:30)=OnePoint/k;
        j=j+1;
        i=i-1;
        k=0;
        OnePoint=zeros(1,30);
    end
end
ReferencePoint(97,1:30)=OnePoint/k;
%将测试点的信号特征依次与参考点的信号特征进行比较
Norm1=zeros(97,1);
testpointpos=zeros(50,2);
for i=1:1:50
    for j=1:1:97
        Norm1(j,1)=norm(testpointdata(i,1:30)-ReferencePoint(j,1:30),1);
    end
    %按升序排列并且返回一组排序后的元素在原向量中的索引值
    [sortNorm1,index]=sort(Norm1);
    %取可能性最大的三个点（信号特征向量1范数距离最近的三个点）的权重
    P1=(1/sortNorm1(1,1))/(1/sortNorm1(1,1)+1/sortNorm1(2,1)+1/sortNorm1(3,1));
    P2=(1/sortNorm1(2,1))/(1/sortNorm1(1,1)+1/sortNorm1(2,1)+1/sortNorm1(3,1));
    P3=(1/sortNorm1(3,1))/(1/sortNorm1(1,1)+1/sortNorm1(2,1)+1/sortNorm1(3,1));
    %插值求取测试点的坐标
    testpointpos(i,1)=P1*ReferencePointPos(index(1),1)+P2*ReferencePointPos(index(2),1)+P3*ReferencePointPos(index(3),1);
    testpointpos(i,2)=P1*ReferencePointPos(index(1),2)+P2*ReferencePointPos(index(2),2)+P3*ReferencePointPos(index(3),2);
end
figure;
    plot(testpointpos(1:50,1),testpointpos(1:50,2),'s-r',testpointposReal(1:50,1),testpointposReal(1:50,2),'o-g');
    xlim([-10,15]);
    title('Position solution and reference');
    xlabel('East(m)');
    ylabel('North(m)');

    
    
    
    
    
    
    











    