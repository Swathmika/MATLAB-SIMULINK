close all;
clear all;
clc;
%Loading measurements set
load('Measurements_Kalman.mat')
% Standard deviation of sensor noise
Sensor_noise = zeros(2);
Sensor_noise(1) = pi*2*pi*1 * 0.03;
Sensor_noise(2) = pi*2 * 0.1;

fe = 50; % Sampling frequency
temps = 10; % Total measurement time (in s)
t=(0:1/fe:temps-1/fe);

% Kalman initialization
C = [1 0 1; 0 1 0];
R = [Sensor_noise(1)^2 0; 0 Sensor_noise(2)^2];
A = [0 0 0 ; 1 0 0 ; 0 0 0];
In=eye(3);%Identity matrix of rank 3
Q = eye(3);%Q : state noise matrix
Q(1, 1) = 10;
Q(2, 2) = 0;
Q(3, 3) = 2;

X = zeros(3, 1);
X_svg = zeros(temps*fe, 3);
P = zeros(3, 3);
P_svg = zeros(temps*fe, 3);
Xp=X;
F=1/fe*A+In; 
Pp=P;
% Calculs
for run = 2 : temps*fe
    % Computation of optimal Kalman gain K (recursive solution of Ricatti
    % equation)
    M=R+C*Pp*C';
    b=P*C';
    K =fe*b/M;%recursive optimal Kalman gain
    P = Pp - K/fe*C*Pp;%Recursive variance of error on estimate
    %Estimation
    X = F*X + K/fe*(mesure(run, :)'-C*X);
    
    X_svg(run, 1) = X(1);%Saving estimation before next sample
    X_svg(run, 2) = X(2);%Saving estimation before next sample
    X_svg(run, 3) = X(3);%Saving estimation before next sample
    % Update
    Pp = F*P*F'+Q%Recursive solution of Ricatti equation for a simple system
end

% Affichage
figure_handle=figure(1);clf;

subplot(1, 3, 1);hold on;
plot(t,mesure(:,1),'r+');
%plot(t,vecteur_etat(:,1),'k');
plot(t,X_svg(:,1),'g');
legend('Gyrometer measurements (rad/s)','Estimation');
axis square;
xlabel('Time');ylabel('Angular speed');
set(figure_handle,'name',' Measurements');

subplot(1, 3, 2);hold on;
plot(t,mesure(:,2),'r+');
%plot(t,vecteur_etat(:,2),'k');
plot(t,X_svg(:,2),'g');
legend('Accelerometer measurements (m/s^2)','Estimation');
axis square;
xlabel('Time (s)');ylabel('Angle');
set(figure_handle,'name',' Measurements');

subplot(1, 3, 3);hold on;
%plot(t,vecteur_etat(:,3),'k');
plot(t,X_svg(:,3),'g');
legend('Rotation estimation');
axis square;
xlabel('Time (s)');ylabel('Gyrometer bias');
set(figure_handle,'name','Measurements');