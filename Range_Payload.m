%% Range Payload Diagram MATLAB Code
% By: Rahul Rohatgi
% Student Number: 500498833
%% Initial Parameters
v_cruise = 194.098;
rpm = 2700;
n = rpm/60;
dprop = 6.25;
J = v_cruise/(n*dprop);
n_pr = 0.83; %Propeller Efficiency
fuel_con = 57.1228;
bhp = 160;
CD_o = 0.032; 
b = 36;
S = 175.5;
e = 0.77;
AR = b^2/S;
K = 1/(pi*AR*e);
[rho] = density(8000);
W_max = 2450;
W_payload = 607;
W_empty = 1679;
W_totalfuel = 347.704;
W_reservefuel = fuel_con/2;
W_tofuel = fuel_con/3;
W_landingfuel = 0.5*W_tofuel;
W_fuel = W_totalfuel-W_reservefuel-W_tofuel-W_landingfuel;
%% Calculating Range Points
BSFC = fuel_con/(0.8*bhp);

%Max Payload
W_ini = W_max-W_tofuel;
W_fo = W_max-W_empty-W_payload;
W_fin = W_ini-(W_fo-W_landingfuel-W_reservefuel);
W_avg = sqrt((W_ini*W_fin));
CL_avg = (2*W_avg)/(rho*(v_cruise^2)*S);
CD_avg = CD_o+K*(CL_avg)^2;
R1 = ((326*n_pr*(CL_avg/CD_avg))/(BSFC))*log((W_ini/W_fin));

%Max Fuel
W_ini = W_max-W_tofuel;
W_pload = W_max-W_empty-W_fuel
W_fin = W_empty+W_pload+W_landingfuel+W_reservefuel;
W_avg = sqrt((W_ini*W_fin));
CL_avg = (2*W_avg)/(rho*(v_cruise^2)*S);
CD_avg = CD_o+K*(CL_avg)^2;
R2 = ((326*n_pr*(CL_avg/CD_avg))/(BSFC))*log((W_ini/W_fin));

%Max Fuel & Zero Payload
W_ini = W_empty+W_totalfuel-W_tofuel;
W_fin = W_empty+W_landingfuel+W_reservefuel;
W_avg = sqrt((W_ini*W_fin));
CL_avg = (2*W_avg)/(rho*(v_cruise^2)*S);
CD_avg = CD_o+K*(CL_avg)^2;
R3 = ((326*n_pr*(CL_avg/CD_avg))/(BSFC))*log((W_ini/W_fin));

%% Range - Payload Diagram
figure (1)
%Line 1
x1 = [0,R1];
y1 = [W_payload,W_payload];
%Line 2
x2 = [R1,R2];
y2 = [W_payload,W_pload];
%Line 3
x3 = [R2,R3];
y3 = [W_pload,0];
plot(x1,y1,'b',x2,y2,'b',x3,y3,'b')
xlabel('Range (nm)')
ylabel('Payload (lbf)')
title('Range Payload Diagram')