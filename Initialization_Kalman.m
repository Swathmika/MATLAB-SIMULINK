Te=1e-2;%Sampling time
%%
%Matrices of state-space representation
C = [1 0 1; 0 1 0] ;%To complete
A = [0 0 0 ; 1 0 0 ; 0 0 0];%To complete
B=zeros(3,2);
D=[0 0;0 0];
%%

Sensor_noise = zeros(2);
Sensor_noise(1) = pi*2*pi*1 * 0.03;
Sensor_noise(2) = pi*2 * 0.1;
R = [Sensor_noise(1)^2 0; 0 Sensor_noise(2)^2];

In=eye(3);%Identity matrix of rank 3

Q = eye(3);%Q : state noise matrix
Q(1, 1) = 1e-2;
Q(2, 2) = 0;
Q(3, 3) = 5;

Fe=1/Te;%Sampling frequency
F=Te*A+In;
alphapoint0=20;%Initial angular speed
alpha0=0;%Initial angle
b=100;%Real gyrometer bias (constant)
X0=[alphapoint0 alpha0 b];


%%
% figure(1);
% hold on
% plot(ScopeData3.time,ScopeData3.signals(1).values);
% plot(ScopeData3.time,ScopeData3.signals(2).values);
% xlabel('Time (seconds)');
% ylabel('Bias (rad/sec)');
% title('Gyrometer Bias');
% legend('Real bias','Estimated bias');
% hold off
% 
% %% 
% figure(2)
% hold on
% grid on
% xlim([0 3])
% plot(ScopeData2.time,ScopeData2.signals(1).values);
% plot(ScopeData2.time,ScopeData2.signals(2).values);
% plot(ScopeData2.time,ScopeData2.signals(3).values);
% xlabel('Time (seconds)');
% ylabel('Angle (degree)');
% title('Angle estimated');
% legend('Inertial measurement','Real angle','Estimated angle');
% hold off
% 
% %%
% figure(3)
% hold on
% grid on
% plot(ScopeData2.time,ScopeData2.signals(2).values);
% plot(ScopeData2.time,ScopeData2.signals(3).values);
% xlabel('Time (seconds)');
% ylabel('Angle (degree)');
% title('Angle estimated');
% legend('Real angle','Estimated angle');
% hold off
