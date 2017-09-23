%% Takeoff Function
% By: Rahul Rohatgi
% Student Number: 500498833
%% Created Function
function[Sto]=Takeoff(rho,V_w,To)
%Input Parameters
%rho = Density
%V_w = Wind (headwind = postitive)
%To = Static Thrust at given density
% Initial Fixed Parameters
e = 0.77;
h = 8;
b = 36;
S = 175.5;
W = 2450;
Cl_max = 2.1;
rpm = 2700;
Cl_gr = 0.9;
CD_o = 0.032;
mu = 0.02;
theta_R = 0;
dprop = 6.25;
g = 32.2;
hsc = 50;
AR = b^2/S;
K = 1/(pi*AR*e);
n = rpm/60;
phi = 1-(1-1.32*(h/b))/(1.05+7.4*(h/b));
Vs_to = sqrt((2*W)/(rho*S*Cl_max));
V_Lof = 1.15*Vs_to;
V2 = 1.3*Vs_to;

if V_w == 0
    
    % Ground Roll (Method B)
    V_bar = sqrt(((V_Lof^2)+(V_w*(abs(V_w))))/2);
    CD_ge = CD_o+phi*K*Cl_gr^2;
    D_bar = 0.5*rho*(V_bar^2)*S*CD_ge;
    L_bar = 0.5*rho*(V_bar^2)*S*Cl_gr;
    J_bar = V_bar/(n*dprop);
    T_bar = (1-0.3*J_bar)*To;
    stog = (V_Lof^2/2)/((g/W)*(T_bar-D_bar-mu*(W-L_bar)-W*sin(theta_R)));
    
    % Airbone Segment I
    V_bar = sqrt(((V_Lof^2)+(V2^2))/2);
    J_bar = V_bar/(n*dprop);
    T_bar = (1-0.3*J_bar)*To;
    Cl_bar = W/(0.5*rho*V_bar^2*S);
    Cd_bar = CD_o+K*(Cl_bar)^2;
    D_bar = 0.5*rho*(V_bar^2)*S*Cd_bar;
    stoaI = ((V2^2-V_Lof^2)/2)/((g/W)*(T_bar-D_bar));
    
    % Airbone Segment II
    J = V2/(n*dprop);
    T = (1-0.3*J)*To;
    Cl = W/(0.5*rho*V2^2*S);
    Cd = CD_o+K*(Cl)^2;
    gamma = (T/W)-(Cd/Cl);
    stoaII = hsc/tan(gamma);

else
    
    % Ground Roll (Method B)
    V_bar = sqrt(((V_Lof^2)+(V_w*(abs(V_w))))/2);
    CD_ge = CD_o+phi*K*Cl_gr^2;
    D_bar = 0.5*rho*(V_bar^2)*S*CD_ge;
    L_bar = 0.5*rho*(V_bar^2)*S*Cl_gr;
    J_bar = V_bar/(n*dprop);
    T_bar = (1-0.3*J_bar)*To;
    Vg_Lof = V_Lof-V_w;
    stog = (Vg_Lof^2/2)/((g/W)*(T_bar-D_bar-mu*(W-L_bar)-W*sin(theta_R)));
    
    % Airbone Segment I
    V_bar = sqrt(((V_Lof^2)+(V2^2))/2);
    J_bar = V_bar/(n*dprop);
    T_bar = (1-0.3*J_bar)*To;
    Cl_bar = W/(0.5*rho*V_bar^2*S);
    Cd_bar = CD_o+K*(Cl_bar)^2;
    D_bar = 0.5*rho*(V_bar^2)*S*Cd_bar;
    stoaI_0 = ((V2^2-V_Lof^2)/2)/((g/W)*(T_bar-D_bar));
    t_toaI = (V2-V_Lof)/((g/W)*(T_bar-D_bar));
    stoaI = stoaI_0 - V_w*t_toaI;
    
    % Airbone Segment II
    J = V2/(n*dprop);
    T = (1-0.3*J)*To;
    Cl = W/(0.5*rho*V2^2*S);
    Cd = CD_o+K*(Cl)^2;
    gamma = (T/W)-(Cd/Cl);
    stoaII_0 = hsc/tan(gamma);
    t_toaII = stoaII_0/(V2*cos(gamma));
    stoaII = stoaII_0 - V_w*t_toaII;
end

% Total Takeoff Distance 
Sto=stog+stoaI+stoaII;