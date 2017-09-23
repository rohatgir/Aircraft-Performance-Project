%% Steady Level Flight Envelope MATLAB Code
% By: Rahul Rohatgi
% Student Number: 500498833
%% Intital Parameters
W = 2450; % Maximum Takeoff Weight
S = 175.5; % Wing Area
v_max = 212.664; %Max Velocity at Sea Level
Cl_max = 2.14; %Max Lift Coefficient
density_sl = 0.002378; % Density at Sea Level
Cl_min = (2*W)/(density_sl*v_max^2*S); % Calculation for Min Lift Coefficient
alt = 0; % Altitude
ceiling = 13500; % Service Ceiling

%% Stall Speed Curve Calculation
i=1;
while alt <= ceiling
    density(alt); %Function that Calculates Density According to Altitude
    v_stall=sqrt(W/(0.5*ans*S*Cl_max)); %Calculating Speed
    stall_line(1,i)= v_stall;
    stall_line(2,i) = alt;
    alt=alt+500;
    i=i+1;
end

%% Max Speed Curve Calculation
i=1;
alt=0;
while alt <= ceiling
    density(alt); %Function that Calculates Density According to Altitude
    v_max=sqrt(W/(0.5*ans*S*Cl_min)); %Calculating Speed
    max_line(1,i)= v_max;
    max_line(2,i) = alt;
    alt=alt+500;
    i=i+1;
end

%% Ceiling Calculation
ceiling_line = [v_stall v_max;ceiling ceiling];

%% Envelope
figure(1)
plot(stall_line(1,:),stall_line(2,:),ceiling_line(1,:),ceiling_line(2,:),max_line(1,:),max_line(2,:))
title('Steady Level Flight Envelope')
ylabel('Altitude (ft)')
xlabel('Velocity (ft/s)')
legend('Stall Speed','Max Altitude','Max Speed','Location','southeast')