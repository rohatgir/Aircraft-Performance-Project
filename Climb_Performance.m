%% Climb Performance MATLAB Code
% By: Rahul Rohatgi
% Student Number: 500498833
%% Initial Parameters
e = 0.77;
h = 8;
b = 36;
S = 175.5;
W = 2450;
rpm = 2700;
CD_o = 0.032;
dprop = 6.25;
v_max = 212.66;
v_min = 74.07;
g = 32.2;
AR = b^2/S;
K = 1/(pi*AR*e);
n = rpm/60;
%% Max Rate of Climb Calculations
Cl_mrc = sqrt(((3*CD_o)/K)); %Calculating Max Lift Coefficient for RC
J = v_max/(n*dprop);
[rho,To] = density_Thrust(0);
T = To*(1-0.3*J);
RCmax = sqrt((2*W)/(rho*S))*((T/W)*(1/sqrt(Cl_mrc))-(CD_o/(Cl_mrc)^1.5)-K*sqrt(Cl_mrc));

%% Climb Performance Graph
% Climb Rate @Sea Level
i = 1;
v = ceil(v_min);
RC = 100;
while RC >= 0
    [rho,To,sigma] = density_Thrust2(0);
    T = To*(1-0.3*J);
    a = (To-T)/v^2;
    RC = -(((2*K*W)/(rho*S))*(1/v))+(((sigma*To)/W)*v)-(((sigma*a)/W)*v^2)-(((CD_o*rho*S)/(2*W))*v^3);
    climb(1,i) = v;
    climb(2,i) = RC*60;
    v = v+1;
    i = i+1;
end

% Climb Rate @2500ft
i = 1;
v = ceil(v_min);
RC = 100;
while RC >= 0
    [rho,To,sigma] = density_Thrust2(2500);
    T = To*(1-0.3*J);
    a = (To-T)/v^2;
    RC = -(((2*K*W)/(rho*S))*(1/v))+(((sigma*To)/W)*v)-(((sigma*a)/W)*v^2)-(((CD_o*rho*S)/(2*W))*v^3);
    climb2500(1,i) = v;
    climb2500(2,i) = RC*60;
    v = v+1;
    i = i+1;
end

% Climb Rate @500ft
i = 1;
v = ceil(v_min);
RC = 100;
while RC >= 0
    [rho,To,sigma] = density_Thrust2(5000);
    T = To*(1-0.3*J);
    a = (To-T)/v^2;
    RC = -(((2*K*W)/(rho*S))*(1/v))+(((sigma*To)/W)*v)-(((sigma*a)/W)*v^2)-(((CD_o*rho*S)/(2*W))*v^3);
    climb5000(1,i) = v;
    climb5000(2,i) = RC*60;
    v = v+1;
    i = i+1;
end
%% Ploting Climb Rate Profile

figure(1)
plot(climb(1,:),climb(2,:),climb2500(1,:),climb2500(2,:),climb5000(1,:),climb5000(2,:))
xlabel('Air Speed (ft/s)')
ylabel('Rate of Climb (ft/min)')
title('Climb Rate Profile')
legend('Sea Level','2500ft Altitude','5000ft Altitude','Location','south')