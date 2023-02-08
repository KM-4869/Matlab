opts=delimitedTextImportOptions;
opts.VariableTypes={'string'};
firstline=258;
B1=1.5611e+09;
B3=1.2685e+09;
L1=1.5754e+09;
L2=1.2276e+09;
c=299792458;
lambda_B1=c/B1;
lambda_B3=c/B3;
lambda_L1=c/L1;
lambda_L2=c/L2;
for t=1:1:2880
t
for line=firstline:1:127070
opts.DataLines=[line,line];
oneline=readmatrix('D:\卫星导航原理\JFNG00CHN_R_20200010000_01D_30S_MO.20o',opts);
if oneline{1,1}(1,1)=='>'
endline=line;
break;
end
end
opts.DataLines=[firstline,endline-1];
T=readmatrix('D:\卫星导航原理\JFNG00CHN_R_20200010000_01D_30S_MO.20o',opts);
firstline=endline+1;
b1=0;b2=0;b3=0;b4=0;b5=0;b6=0;b7=0;b8=0;b9=0;b10=0;b11=0;
for i=1:1:size(T,1)
if T{i,1}(1:3)=='C01'
C01(t,1)=str2double(T{i,1}(4:17));
C01(t,2)=str2double(T{i,1}(20:33));
C01(t,3)=str2double(T{i,1}(100:113));
C01(t,4)=str2double(T{i,1}(116:129));
b1=1;
elseif T{i,1}(1:3)=='C03'
C03(t,1)=str2double(T{i,1}(4:17));
C03(t,2)=str2double(T{i,1}(20:33));
C03(t,3)=str2double(T{i,1}(100:113));
C03(t,4)=str2double(T{i,1}(116:129));
b2=1;
elseif T{i,1}(1:3)=='C06'
C06(t,1)=str2double(T{i,1}(4:17));
C06(t,2)=str2double(T{i,1}(20:33));
C06(t,3)=str2double(T{i,1}(100:113));
C06(t,4)=str2double(T{i,1}(116:129));
b3=1;
elseif T{i,1}(1:3)=='C08'
C08(t,1)=str2double(T{i,1}(4:17));
C08(t,2)=str2double(T{i,1}(20:33));
C08(t,3)=str2double(T{i,1}(100:113));
C08(t,4)=str2double(T{i,1}(116:129));
b4=1;
elseif T{i,1}(1:3)=='C11'
C11(t,1)=str2double(T{i,1}(4:17));
C11(t,2)=str2double(T{i,1}(20:33));
C11(t,3)=str2double(T{i,1}(100:113));
C11(t,4)=str2double(T{i,1}(116:129));
b5=1;
elseif T{i,1}(1:3)=='C12'
C12(t,1)=str2double(T{i,1}(4:17));
C12(t,2)=str2double(T{i,1}(20:33));
C12(t,3)=str2double(T{i,1}(100:113));
C12(t,4)=str2double(T{i,1}(116:129));
b6=1;
elseif T{i,1}(1:3)=='G01'
G01(t,1)=str2double(T{i,1}(4:17));
G01(t,2)=str2double(T{i,1}(20:33));
G01(t,3)=str2double(T{i,1}(132:145));
G01(t,4)=str2double(T{i,1}(148:161));
b7=1;
elseif T{i,1}(1:3)=='G02'
G02(t,1)=str2double(T{i,1}(4:17));
G02(t,2)=str2double(T{i,1}(20:33));
G02(t,3)=str2double(T{i,1}(132:145));
G02(t,4)=str2double(T{i,1}(148:161));
b8=1;
elseif T{i,1}(1:3)=='G03'
G03(t,1)=str2double(T{i,1}(4:17));
G03(t,2)=str2double(T{i,1}(20:33));
G03(t,3)=str2double(T{i,1}(132:145));
G03(t,4)=str2double(T{i,1}(148:161));
b9=1;
elseif T{i,1}(1:3)=='G04'
G04(t,1)=str2double(T{i,1}(4:17));
G04(t,2)=str2double(T{i,1}(20:33));
G04(t,3)=str2double(T{i,1}(132:145));
G04(t,4)=str2double(T{i,1}(148:161));
b10=1;
elseif T{i,1}(1:3)=='G05'
G05(t,1)=str2double(T{i,1}(4:17));
G05(t,2)=str2double(T{i,1}(20:33));
G05(t,3)=str2double(T{i,1}(132:145));
G05(t,4)=str2double(T{i,1}(148:161));
b11=1;
end
end
if b1==0
C01(t,1:4)=0;
end
if b2==0
C03(t,1:4)=0;
end
if b3==0
C06(t,1:4)=0;
end
if b4==0
C08(t,1:4)=0;
end
if b5==0
C11(t,1:4)=0;
end
if b6==0
C12(t,1:4)=0;
end
if b7==0
G01(t,1:4)=0;
end
if b8==0
G02(t,1:4)=0;
end
if b9==0
G03(t,1:4)=0;
end
if b10==0
G04(t,1:4)=0;
end
if b11==0
G05(t,1:4)=0;
end
end

C01_GF(1:2879,1)=C01(1:2879,1)-C01(1:2879,2);
C03_GF(1:2879,1)=C03(1:2879,1)-C03(1:2879,2);
C06_GF(1:2879,1)=C06(1:2879,1)-C06(1:2879,2);
C08_GF(1:2879,1)=C08(1:2879,1)-C08(1:2879,2);
C11_GF(1:2879,1)=C11(1:2879,1)-C11(1:2879,2);
C12_GF(1:2879,1)=C12(1:2879,1)-C12(1:2879,2);
C01_GF(1:2879,2)=lambda_B1*C01(1:2879,3)-lambda_B3*C01(1:2879,4);
C03_GF(1:2879,2)=lambda_B1*C03(1:2879,3)-lambda_B3*C03(1:2879,4);
C06_GF(1:2879,2)=lambda_B1*C06(1:2879,3)-lambda_B3*C06(1:2879,4);
C08_GF(1:2879,2)=lambda_B1*C08(1:2879,3)-lambda_B3*C08(1:2879,4);
C11_GF(1:2879,2)=lambda_B1*C11(1:2879,3)-lambda_B3*C11(1:2879,4);
C12_GF(1:2879,2)=lambda_B1*C12(1:2879,3)-lambda_B3*C12(1:2879,4);


G01_GF(1:2879,1)=G01(1:2879,1)-G01(1:2879,2);
G02_GF(1:2879,1)=G02(1:2879,1)-G02(1:2879,2);
G03_GF(1:2879,1)=G03(1:2879,1)-G03(1:2879,2);
G04_GF(1:2879,1)=G04(1:2879,1)-G04(1:2879,2);
G05_GF(1:2879,1)=G05(1:2879,1)-G05(1:2879,2);
G01_GF(1:2879,2)=lambda_L1*G01(1:2879,3)-lambda_L2*G01(1:2879,4);
G02_GF(1:2879,2)=lambda_L1*G02(1:2879,3)-lambda_L2*G02(1:2879,4);
G03_GF(1:2879,2)=lambda_L1*G03(1:2879,3)-lambda_L2*G03(1:2879,4);
G04_GF(1:2879,2)=lambda_L1*G04(1:2879,3)-lambda_L2*G04(1:2879,4);
G05_GF(1:2879,2)=lambda_L1*G05(1:2879,3)-lambda_L2*G05(1:2879,4);


 C01_MW(1:2879,1)=C01(1:2879,3)-C01(1:2879,4)-((B1-B3)/(B1+B3))*(C01(1:2879,1)/lambda_B1+C01(1:2879,2)/lambda_B3);
 C03_MW(1:2879,1)=C03(1:2879,3)-C03(1:2879,4)-((B1-B3)/(B1+B3))*(C03(1:2879,1)/lambda_B1+C03(1:2879,2)/lambda_B3);
 C06_MW(1:2879,1)=C06(1:2879,3)-C06(1:2879,4)-((B1-B3)/(B1+B3))*(C06(1:2879,1)/lambda_B1+C06(1:2879,2)/lambda_B3);
 C08_MW(1:2879,1)=C08(1:2879,3)-C08(1:2879,4)-((B1-B3)/(B1+B3))*(C08(1:2879,1)/lambda_B1+C08(1:2879,2)/lambda_B3);
 C11_MW(1:2879,1)=C11(1:2879,3)-C11(1:2879,4)-((B1-B3)/(B1+B3))*(C11(1:2879,1)/lambda_B1+C11(1:2879,2)/lambda_B3);
 C12_MW(1:2879,1)=C12(1:2879,3)-C12(1:2879,4)-((B1-B3)/(B1+B3))*(C12(1:2879,1)/lambda_B1+C12(1:2879,2)/lambda_B3);

G01_MW(1:2879,1)=G01(1:2879,3)-G01(1:2879,4)-((L1-L2)/(L1+L2))*(G01(1:2879,1)/lambda_L1+G01(1:2879,1)/lambda_L2);
G02_MW(1:2879,1)=G02(1:2879,3)-G02(1:2879,4)-((L1-L2)/(L1+L2))*(G02(1:2879,1)/lambda_L1+G02(1:2879,1)/lambda_L2);
G03_MW(1:2879,1)=G03(1:2879,3)-G03(1:2879,4)-((L1-L2)/(L1+L2))*(G03(1:2879,1)/lambda_L1+G03(1:2879,1)/lambda_L2);
G04_MW(1:2879,1)=G04(1:2879,3)-G04(1:2879,4)-((L1-L2)/(L1+L2))*(G04(1:2879,1)/lambda_L1+G04(1:2879,1)/lambda_L2);
G05_MW(1:2879,1)=G05(1:2879,3)-G05(1:2879,4)-((L1-L2)/(L1+L2))*(G05(1:2879,1)/lambda_L1+G05(1:2879,1)/lambda_L2);

for i=1:1:2878
C01_DGF(i,1:2)=C01_GF(i+1,1:2)-C01_GF(1,1:2);
C03_DGF(i,1:2)=C03_GF(i+1,1:2)-C03_GF(1,1:2);
C06_DGF(i,1:2)=C06_GF(i+1,1:2)-C06_GF(1,1:2);
C08_DGF(i,1:2)=C08_GF(i+1,1:2)-C08_GF(1,1:2);
C11_DGF(i,1:2)=C11_GF(i+1,1:2)-C11_GF(1,1:2);
C12_DGF(i,1:2)=C12_GF(i+1,1:2)-C12_GF(1,1:2);
G01_DGF(i,1:2)=G01_GF(i+1,1:2)-G01_GF(1,1:2);
G02_DGF(i,1:2)=G02_GF(i+1,1:2)-G02_GF(1,1:2);
G03_DGF(i,1:2)=G03_GF(i+1,1:2)-G03_GF(1,1:2);
G04_DGF(i,1:2)=G04_GF(i+1,1:2)-G04_GF(1,1:2);
G05_DGF(i,1:2)=G05_GF(i+1,1:2)-G05_GF(1,1:2);
end

for i=1:1:2878
C01_DMW(i,1)=C01_MW(i+1,1)-C01_MW(1,1);
C03_DMW(i,1)=C03_MW(i+1,1)-C03_MW(1,1);
C06_DMW(i,1)=C06_MW(i+1,1)-C06_MW(1,1);
C08_DMW(i,1)=C08_MW(i+1,1)-C08_MW(1,1);
C11_DMW(i,1)=C11_MW(i+1,1)-C11_MW(1,1);
C12_DMW(i,1)=C12_MW(i+1,1)-C12_MW(1,1);
G01_DMW(i,1)=G01_MW(i+1,1)-G01_MW(1,1);
G02_DMW(i,1)=G02_MW(i+1,1)-G02_MW(1,1);
G03_DMW(i,1)=G03_MW(i+1,1)-G03_MW(1,1);
G04_DMW(i,1)=G04_MW(i+1,1)-G04_MW(1,1);
G05_DMW(i,1)=G05_MW(i+1,1)-G05_MW(1,1);
end