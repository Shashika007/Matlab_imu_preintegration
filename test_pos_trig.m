close all;
clear all;

fe = 1000;
N = 10*1;
t = (0:1/fe:N-1/fe);

x = sin(t);
y = sin(2*t);
z = sin(2*t);

figure('Name','3D position plot','NumberTitle','off');
plot3(x,y,z);
xlabel('x posititon');
ylabel('y posititon');
zlabel('z posititon');

deg_to_rad = 3.14159265359/180.0;
ax = -sin(t);
ay = -4*sin(2*t);
az = -4*sin(2*t);
wx(1,1:(N*fe)) = 0*deg_to_rad; 
wy(1,1:(N*fe)) = 0*deg_to_rad;
wz(1,1:(N*fe)) = 0*deg_to_rad;
u = [ax; ay; az; wx; wy; wz];

%% needed parameters

dt = 0.001;
di = [0; 0; 0; 1; 0; 0; 0; 1; 2; 2];
di0 = [0; 0; 0; 1; 0; 0; 0; 0; 0; 0];
%u = [10; 5; 2; 110; 30; 50];

b0 = [0; 0; 0; 0; 0; 0]; %bias vector

n_ax = 0.04*randn(1,(N*fe));
n_ay = 0.04*randn(1,(N*fe));
n_az = 0.04*randn(1,(N*fe));
n_wx = 0.002*randn(1,(N*fe));
n_wy = 0.002*randn(1,(N*fe));
n_wz = 0.002*randn(1,(N*fe));
n0 = [0; 0; 0; 0; 0; 0]; %noise vector
n = [n_ax; n_ay; n_az; n_wx; n_wy; n_wz]; %noise vector

di_t = di;
di_t0 = di0;

%FORMULATION IS PQV
%UNIT QUATERNION IS [1 0 0 0]

for i=1:N*fe-1
    d = data2delta(b0, u(:,i), n0, dt);
%% test imu_integrator

    di_out0 = imu_integrator(di, d, dt);
    di=di_out0;
    di_t = [di_t, di];
end

%% Plolt Integrated position
figure('Name','acceleration','NumberTitle','off');
subplot(3,1,1);
plot(t, ax(1,:));
hold on;
subplot(3,1,2);
plot(t, ay(1,:));
subplot(3,1,3);
plot(t, az(1,:));

figure('Name','position through time','NumberTitle','off');
subplot(3,1,1);
plot(t, x(1,:));
hold on;
subplot(3,1,2);
plot(t, y(1,:));
subplot(3,1,3);
plot(t, z(1,:));

figure('Name','velocity through time','NumberTitle','off');
subplot(3,1,1);
plot(t, di_t(8,:));
hold on;
subplot(3,1,2);
plot(t, di_t(9,:));
subplot(3,1,3);
plot(t, di_t(10,:));

%% 3D plot
figure('Name','3D position plot','NumberTitle','off');
plot3(di_t(1,:),di_t(2,:),di_t(3,:));
xlabel('x posititon');
ylabel('y posititon');
zlabel('z posititon');

% fileID = fopen('data_test_trig.txt','wt');
% data = [t',u'];
% for ii = 1:size(data,1)
%     fprintf(fileID,'%g\t',data(ii,:));
%     fprintf(fileID,'\n');
% end
% fclose(fileID);

figure('Name','2D position plot','NumberTitle','off');
subplot(3,2,1)
plot(x,y);
xlabel('x posititon');
ylabel('y posititon');
subplot(3,2,2)
plot(di_t(1,:),di_t(2,:));
xlabel('x posititon recons');
ylabel('y posititon recons');
subplot(3,2,3)
plot(x,z);
xlabel('x posititon');
ylabel('z posititon');
subplot(3,2,4)
plot(di_t(1,:),di_t(3,:));
xlabel('x posititon recons');
ylabel('z posititon recons');
subplot(3,2,5)
plot(y,z);
xlabel('y posititon');
ylabel('z posititon');
subplot(3,2,6)
plot(di_t(2,:),di_t(3,:));
xlabel('y posititon recons');
ylabel('z posititon recons');

figure('Name','error','NumberTitle','off')
subplot(3,1,1);
plot(t,x(1,:) - di_t(1,:));
xlabel('x error over time');
hold on;
subplot(3,1,2);
plot(t,y(1,:) - di_t(2,:));
xlabel('y error over time');
subplot(3,1,3);
plot(t,z(1,:) - di_t(3,:));
xlabel('z error over time');

%% all 3D plots in same figure :
figure('Name','compare trajectories','NumberTitle','off');
plot3(x(1,:),y(1,:),z(1,:), 'r');
hold on;
plot3(di_t(1,:),di_t(2,:),di_t(3,:), 'g');
xlabel('x posititon');
ylabel('y posititon');
zlabel('z posititon');
