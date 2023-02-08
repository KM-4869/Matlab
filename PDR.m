%画出传感器数据
figure;
subplot(3,1,1);
plot(t,x_gyro,'r',t,y_gyro,'g',t,z_gyro,'b');
title('Gyro data');
xlabel('Time(s)');
ylabel('(deg/s)');
subplot(3,1,2);
plot(t,x_acc,'r',t,y_acc,'g',t,z_acc,'b');
title('Accelerometer data');
xlabel('Time(s)');
ylabel('(m/s/s)');
subplot(3,1,3);
plot(t,0.001*x_mag,'r',t,0.001*y_mag,'g',t,0.001*z_mag,'b');
title('Magnetometer data');
xlabel('Time(s)');
ylabel('(Gauss)');
%计算水平姿态角
figure;
roll=rad2deg(atan2(-y_acc,-z_acc));
pitch=rad2deg(atan2(x_acc,sqrt(y_acc.^2+z_acc.^2)));
plot(t,pitch,'g',t,roll,'c');
title('Horizontal angles without smoothing');
xlabel('Time(s)');
ylabel('(deg)');
%平滑
roll2=zeros(6809,1);
pitch2=zeros(6809,1);
for i=1:1:6809
    roll2(i)=mean(roll(i:i+20));
    pitch2(i)=mean(pitch(i:i+20));
end
figure;
plot(t(10:6818),pitch2,'g',t(10:6818),roll2,'c');
title('Horizontal angles with smoothing');
xlabel('Time(s)');
ylabel('(deg)');
%磁强计计算航向角
yaw_m=14.11+rad2deg(-atan2(y_mag,x_mag));

%陀螺仪计算航向角
yaw_g=zeros(6829,1);
yaw_g(1)=-90;
for i=1:1:6828
    yaw_g(i+1)=yaw_g(i)+0.05*z_gyro(i);
    if yaw_g(i+1)>180
        yaw_g(i+1)=yaw_g(i+1)-360;
    end
    if yaw_g(i+1)<-180
        yaw_g(i+1)=yaw_g(i+1)+360;
    end   
end
figure;
plot(t,yaw_m,'b',t,yaw_g,'r');
title('yaw from magnetometers and gyros');
xlabel('Time(s)');
ylabel('(deg)');
%脚步探测
acc=[x_acc,y_acc,z_acc];
Accel=zeros(6829,1);
j=1;
for i=1:1:6829
Accel(i)=norm(acc(i,1:3));
end
[maxv,maxl]=findpeaks(-Accel,'minpeakheight',-9.2);%maxv峰值值，maxl峰值位置
figure;
plot(t,Accel,'b',maxl*0.05,-maxv,'r*');
title('Steps');
xlabel('Time(s)');
ylabel('Acceleration(m/s/s)');
%PDR推算
figure;
pos_g=zeros(834,2);
pos_m=zeros(834,2);
for i=1:1:833
    pos_g(i+1,1:2)=pos_g(i,1:2)+[0.7*sin(deg2rad(yaw_g(maxl(i)))),0.7*cos(deg2rad(yaw_g(maxl(i))))];
    pos_m(i+1,1:2)=pos_m(i,1:2)+[0.7*sin(deg2rad(yaw_m(maxl(i)))),0.7*cos(deg2rad(yaw_m(maxl(i))))];
end
   plot(pos_g(1:834,1),pos_g(1:834,2),'g-.',pos_m(1:834,1),pos_m(1:834,2),'b-'); 
   %xlim([-200,200]);
   %ylim([-150,60]);
   title('PDR using yaw from magnetometers and gyros');
xlabel('East(m)');
ylabel('North(m)');
    
 %z轴陀螺零偏补偿
 z_gyro_compensate=z_gyro+0.2;
 yaw_g_compensate=zeros(6829,1);
yaw_g_compensate(1)=-90;
for i=1:1:6828
    yaw_g_compensate(i+1)=yaw_g_compensate(i)+0.05*z_gyro_compensate(i);
    if yaw_g_compensate(i+1)>180
        yaw_g_compensate(i+1)=yaw_g_compensate(i+1)-360;
    end
    if yaw_g_compensate(i+1)<-180
        yaw_g_compensate(i+1)=yaw_g_compensate(i+1)+360;
    end   
end
figure;
plot(t,yaw_m,'b',t,yaw_g_compensate,'r');
title('yaw from magnetometers and compensated gyros ');
xlabel('Time(s)');
ylabel('(deg)');

figure;
pos_g_compensate=zeros(834,2);
for i=1:1:833
    pos_g_compensate(i+1,1:2)=pos_g_compensate(i,1:2)+[0.7*sin(deg2rad(yaw_g_compensate(maxl(i)))),0.7*cos(deg2rad(yaw_g_compensate(maxl(i))))];
end
   plot(pos_g_compensate(1:834,1),pos_g_compensate(1:834,2),'g-.',pos_m(1:834,1),pos_m(1:834,2),'b-'); 
title('PDR using yaw from magnetometers and compensated gyros');
xlabel('East(m)');
ylabel('North(m)');