% %XYZ地心地固坐标
% figure;
% subplot(3,1,1);
% plot(t,X,'r');
% title('2022年11月24日0时-8时测站X坐标');
% xlabel('GPST(s)');
% ylabel('X(m)');
% 
% subplot(3,1,2);
% plot(t,Y,'b');
% title('2022年11月24日0时-8时测站Y坐标');
% xlabel('GPST(s)');
% ylabel('Y(m)');
% 
% subplot(3,1,3);
% plot(t,Z,'g');
% title('2022年11月24日0时-8时测站Z坐标');
% xlabel('GPST(s)');
% ylabel('Z(m)');
% %高程变化图
% figure;
% scatter(t,H,'v','MarkerFaceColor','c');
% title('2022年11月24日0时-8时测站高H');
% xlabel('GPST(s)');
% ylabel('H(m)');
% 
% %XYZ速度
% figure;
% subplot(3,1,1);
% plot(t,Vx,'r');
% title('2022年11月24日0时-8时测站X速度');
% xlabel('GPST(s)');
% ylabel('Vx(m/s)');
% 
% subplot(3,1,2);
% plot(t,Vy,'b');
% title('2022年11月24日0时-8时测站Y速度');
% xlabel('GPST(s)');
% ylabel('Vy(m/s)');
% 
% subplot(3,1,3);
% plot(t,Vz,'g');
% title('2022年11月24日0时-8时测站Z速度');
% xlabel('GPST(s)');
% ylabel('Vz(m/s)');
% %GPS,BDS钟差
% figure;
% plot(t,GPSClk,'g');
% hold on;
% plot(t,BDSClk,'b');
% title('2022年11月24日0时-8时接收机钟差');
% xlabel('GPST(s)');
% ylabel('ct_R(m)');
% ylim([-1 inf]);
% %PDOP
% figure;
% scatter(t,PDOP,'d','MarkerEdgeColor','r','MarkerFaceColor','y');
% title('2022年11月24日0时-8时PDOP');
% xlabel('GPST(s)');
% %SatNum
% figure;
% plot(t,SatNum,'*g','LineWidth',5);
% title('2022年11月24日0时-8时卫星个数');
% xlabel('GPST(s)');
% ylabel('Satellite Number');
% %sigma
% figure;
% subplot(2,1,1);
% plot(t,Psigma,'c');
% title('Pos sigma0');
% xlabel('GPST(s)');
% ylabel('sigma0');
% 
% subplot(2,1,2);
% plot(t,Vsigma,'ytitle('Pos sigma0');
% title('Vel sigma0');
% xlabel('GPST(s)');
% ylabel('sigma0');
dX=X-(-2267804.5263);
dY=Y-5009342.3723;
dZ=Z-3220991.8632;
EarthStationPosXYZ=[-2267804.5263;5009342.3723;3220991.8632];
B=30.528441627999996;
L=114.35697689000000;
H= 41.2160;
StationXYZ=zeros(3,28893);
for i=1:1:28893
    EarthXYZ=[X(i);Y(i);Z(i)];
    StationXYZ(1:3,i)=EarthXYZ_to_StationXYZ(B,L,EarthStationPosXYZ,EarthXYZ);
end
figure;
plot(t,StationXYZ);
title('ENU坐标系定位结果');
xlabel('GPST(s)');
ylabel('m');
    
figure;
subplot(3,1,1);
scatter(t,StationXYZ(2,1:28893),'>','MarkerFaceColor','g');
title('E方向坐标定位序列');
xlabel('GPST(s)');
ylabel('E(m)');
subplot(3,1,2);
scatter(t,StationXYZ(1,1:28893),'o','MarkerFaceColor','c');
title('N方向坐标定位序列');
xlabel('GPST(s)');
ylabel('N(m)');
subplot(3,1,3);
scatter(t,StationXYZ(3,1:28893),'^','MarkerFaceColor','y','MarkerEdgeColor','r');
title('U方向坐标定位序列');
xlabel('GPST(s)');
ylabel('U(m)');
