function [Xk,Dxk] = EKF_projectile(Xt0,Dxt0,Det,D_obs,t,kx,ky,g,r,alpha)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
syms delta_t;
transition_matrix=[1,delta_t,0,0;0,1-2*kx*Xt0(2,1)*delta_t,0,0;0,0,1,delta_t;0,0,0,1+2*ky*Xt0(4,1)*delta_t];%定义状态转移矩阵
omega=[delta_t,delta_t^2/2,0,0;0,delta_t-kx*Xt0(2,1)*delta_t^2,0,0;0,0,delta_t,delta_t^2/2;0,0,0,delta_t+ky*Xt0(4,1)*delta_t^2]*[0;kx*Xt0(2,1)^2;0;-ky*Xt0(4,1)^2-g];%定义OMEGA矩阵
C=[0,0;1,0;0,0;0,1];
Dwk_1=int(transition_matrix*C*Det*C'*transition_matrix.','delta_t');%定义并计算Dw（k-1）;


transition_matrix=subs(transition_matrix,delta_t,t);
omega=subs(omega,delta_t,t);
Dwk_1=subs(Dwk_1,delta_t,t);%将符号变量delta_t赋值


transition_matrix=double(transition_matrix);
omega=double(omega);
Dwk_1=double(Dwk_1);%将三个矩阵转为double类型

Xk_forecast=transition_matrix*Xt0+omega;
Dk_forecast=transition_matrix*Dxt0*transition_matrix'+Dwk_1;%求时间预测及其方差
V1=r-sqrt(Xk_forecast(1,1)^2+Xk_forecast(3,1)^2);%新息V1
h1=[Xk_forecast(1,1)/sqrt(Xk_forecast(1,1)^2+Xk_forecast(3,1)^2),0,Xk_forecast(3,1)/sqrt(Xk_forecast(1,1)^2+Xk_forecast(3,1)^2),0];
Kk1=Dk_forecast*h1'/(h1*Dk_forecast*h1'+D_obs(1,1));
Xk1=Xk_forecast+Kk1*V1;
Dk1=(eye(4,4)-Kk1*h1)*Dk_forecast;%时间预测的更新Xk1,及其方差Dx1
V2=alpha-atan(Xk1(1,1)/Xk1(3,1));%新息V2
h2=[(1/Xk1(3,1))/(1+(Xk1(1,1)/Xk1(3,1))^2),0,(-Xk1(1,1)/Xk1(3,1)^2)/(1+(Xk1(1,1)/Xk1(3,1))^2),0];
Kk2=Dk1*h2'/(h2*Dk1*h2'+D_obs(2,2));
Xk=Xk1+Kk2*V2;
Dxk=(eye(4,4)-Kk2*h2)*Dk1;%k时刻的滤波结果
end

