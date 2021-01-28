%Machine parameters
L=1e-1;%Motor self-inductance
R=50;%Internal resistance
J=1e-2;%Inertia of motor arm 
f=1e-1;%Friction coefficient
k=0.05;%Electromechanical coupling coefficient

%%PI
% figure(1);
% plot(ScopeData_e.time,ScopeData_e.signals(2).values);
% grid on
% xlabel('Time (seconds)');
% ylabel('Error (rad/sec)');
% title('Plot : Dynamic error');
% 
figure(2);
subplot(2,1,1);
plot(ScopeData.time,ScopeData.signals(1).values)
grid on
xlim([0.98 1.12])
ylim([0 1.25])
xlabel('Time (seconds)');
ylabel('Speed (rad/sec)');
title('Plot:Reference Speed');
subplot(2,1,2);
plot(ScopeData.time,ScopeData.signals(2).values)
grid on
xlim([0.98 1.12])
ylim([0 1.25])
xlabel('Time (seconds)');
ylabel('Speed (rad/sec)');
title('Plot:Measured Speed');



%% P
% figure(3);
% plot(ScopeData_P_E.time,ScopeData_P_E.signals(2).values);
% grid on
% xlabel('Time (seconds)');
% ylabel('Error (rad/sec)');
% title('Plot : Static error');
% figure(4);
% subplot(2,1,1);
% plot(ScopeData_P.time,ScopeData_P.signals(1).values)
% grid on
% xlim([0.98 1.12])
% ylim([0 1.25])
% xlabel('Time (seconds)');
% ylabel('Speed (rad/sec)');
% title('Plot:Reference Speed');
% subplot(2,1,2);
% plot(ScopeData_P.time,ScopeData_P.signals(2).values)
% grid on
% xlim([0.98 1.12])
% ylim([0 1.25])
% xlabel('Time (seconds)');
% ylabel('Speed (rad/sec)');
% title('Plot:Measured Speed');

%%PD
%% P
% figure(1);
% plot(ScopeData_pide.time,ScopeData_pide.signals(2).values);
% grid on
% xlabel('Time (seconds)');
% ylabel('Error (rad/sec)');
% title('Plot : Static error');
% figure(2);
% subplot(2,1,1);
% plot(ScopeData_pid.time,ScopeData_pid.signals(1).values)
% grid on
% xlim([0.98 1.12])
% ylim([0 1.25])
% xlabel('Time (seconds)');
% ylabel('Speed (rad/sec)');
% title('Plot:Reference Speed');
% subplot(2,1,2);
% plot(ScopeData_D.time,ScopeData_D.signals(2).values)
% grid on
% xlim([0.98 1.12])
% ylim([0 1.25])
% xlabel('Time (seconds)');
% ylabel('Speed (rad/sec)');
% title('Plot:Measured Speed');