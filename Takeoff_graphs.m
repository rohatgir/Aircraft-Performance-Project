%% Takeoff Performance MATLAB Code
% By: Rahul Rohatgi
% Student Number: 500498833
%% Initial Parameters
alt = 0; % Altitude
%% Calculated Takeoff Distance
i=1;
while alt <= 10000
    [x,y]=density_Thrust(alt); %Function that Calculates Density and Static Thrust According to Altitude
    takeoff(1,i)= alt;
    takeoff(2,i) = Takeoff(x,0,y);
    alt=alt+500;
    i=i+1;
end

%% Actual Takeoff Distance
actual_takeoff=[1510 1660 1830 2020 2245 2500 2805 3170 3620;0 1000 2000 3000 4000 5000 6000 7000 8000];
%% Calculated Vs Actual Takeoff Distance Graph
figure(1)
plot(takeoff(1,:),takeoff(2,:),actual_takeoff(2,:),actual_takeoff(1,:))
title('Takeoff Distance')
ylabel('Takeoff Distance (ft)')
xlabel('Altitude (ft)')
legend('Calculated Takeoff Distance','Actual Takeoff Distance','Location','northwest')
%% Calculated Takeoff Distance with Head Wind
i=1;
alt=0;
vw=0;
while alt <= 10000
    [x,y]=density_Thrust(0); %Function that Calculates Density and Static Thrust According to Altitude
    takeoff(1,i)= vw;
    takeoff(2,i) = Takeoff(x,vw,y);
    alt=alt+500;
    vw=vw+1; %Changes Wind Speed for Each Iteration
    i=i+1;
end
%% Takeoff Distance Vs Head Wind Graph
figure (2)
plot(takeoff(1,:),takeoff(2,:))
title('Takeoff Distance Vs Head Wind Speed at Sea Level')
ylabel('Takeoff Distance (ft)')
xlabel('Wind Speed (ft/s)')
%% Calculated Takeoff Distance with Tail Wind
i=1;
alt=0;
vw=0;
while alt <= 10000
    [x,y]=density_Thrust(0); %Function that Calculates Density and Static Thrust According to Altitude
    takeoff(1,i)= -vw;
    takeoff(2,i) = Takeoff(x,vw,y);
    alt=alt+500;
    vw=vw-1; %Changes Wind Speed for Each Iteration
    i=i+1;
end
%% Takeoff Distance Vs Tail Wind Graph
figure (3)
plot(takeoff(1,:),takeoff(2,:))
title('Takeoff Distance Vs Tail Wind Speed at Sea Level')
ylabel('Takeoff Distance (ft)')
xlabel('Wind Speed (ft/s)')