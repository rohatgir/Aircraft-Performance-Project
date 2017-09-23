%% Landing Performance MATLAB Code
% By: Rahul Rohatgi
% Student Number: 500498833
%% Initial Parameters
alt = 0; % Altitude

%% Calculated Landing Distance
i = 1;
while alt <= 10000
    [x] = density(alt); %Function that Calculates Density According to Altitude
    landing(1,i) = alt;
    landing(2,i) = stalled_on_landing(x,0);
    landing_flown(2,i) = flown_on_landing(x,0);
    alt = alt+500;
    i = i+1;
end

%% Actual Landing Distance
actual_landing = [1250 1280 1310 1345 1380 1415 1455 1495 1535;0 1000 2000 3000 4000 5000 6000 7000 8000];

%% Calculated Vs Actual Landing Distance Graph
figure(1)
plot(landing(1,:),landing(2,:),actual_landing(2,:),actual_landing(1,:),landing(1,:),landing_flown(2,:))
title('Landing Distance Vs Altitude')
ylabel('Landing Distance (ft)')
xlabel('Altitude (ft)')
legend('Calculated Stalled On Landing Distance','Actual Takeoff Distance','Calculated Flown On Landing Distance','Location','northwest')

%% Calculated landing Distance with Head Wind
i = 1;
alt = 0;
vw = 0;
while alt <= 10000
    [x] = density(0); %Function that Calculates Density According to Altitude
    landing(1,i) = vw;
    landing(2,i) = stalled_on_landing(x,vw);
    landing_flown(2,i) = flown_on_landing(x,vw);
    alt = alt+500;
    vw = vw+1; %Changes Wind Speed for Each Iteration
    i = i+1;
end

%% Landing Distance Vs Head Wind Graph
figure (2)
plot(landing(1,:),landing(2,:),landing(1,:),landing_flown(2,:))
title('Landing Distance Vs Head Wind Speed at Sea Level')
ylabel('Landing Distance (ft)')
xlabel('Wind Speed (ft/s)')
legend('Calculated Stalled On Landing Distance','Calculated Flown On Landing Distance','Location','northwest')

%% Calculated Landing Distance with Tail Wind
i = 1;
alt = 0;
vw = 0;
while alt <= 10000
    [x,y] = density_Thrust(0); %Function that Calculates Density and Static Thrust According to Altitude
    landing(1,i) = -vw;
    landing(2,i) = stalled_on_landing(x,vw);
    landing_flown(2,i) = flown_on_landing(x,vw);
    alt = alt+500;
    vw = vw-1; %Changes Wind Speed for Each Iteration
    i = i+1;
end

%% Landing Distance Vs Tail Wind Graph
figure (3)
plot(landing(1,:),landing(2,:),landing(1,:),landing_flown(2,:))
title('Landing Distance Vs Tail Wind Speed at Sea Level')
ylabel('Landing Distance (ft)')
xlabel('Wind Speed (ft/s)')
legend('Calculated Stalled On Landing Distance','Calculated Flown On Landing Distance','Location','northwest')