%% Flown On Landing Function
% By: Rahul Rohatgi
% Student Number: 500498833
%% Created Function
function[Sld]=flown_on_landing(rho,V_w)
%Input Parameters
%rho = Density
%V_w = Wind (headwind = postitive)
% Initial Fixed Parameters
e = 0.77;
h = 8;
b = 36;
S = 175.5;
W = 2450;
Cl_max_landing = 2.1;
Cl_grl = 0.3;
CDo_l = 0.05;
mu_l = 0.25;
theta_R = 0;
g = 32.2;
hsc = 50;
Cl_ratio = 1.15;
a_angle = 5;
AR = b^2/S;
K = 1/(pi*AR*e);
Vs_ld = sqrt((2*W)/(rho*S*Cl_max_landing));
VA = 1.3*Vs_ld;
t_delay = 2;

%Approach and Flare
R = VA^2/(g*(Cl_ratio-1));
if V_w == 0
    Sla = (hsc/tand(a_angle))+ R*sind(a_angle/2);
else
    Sla = (hsc/tand(a_angle))+ R*sind(a_angle/2);
    delta_t = (hsc/(VA*tand(a_angle)))+ (R/VA)*sind(a_angle/2);
    Sla=Sla-V_w*delta_t;
end

%Ground Roll Segement 1
if V_w == 0
    SlgI = VA*t_delay;
else
    VGA = VA - V_w;
    SlgI = VGA*t_delay;
end

%Ground Roll Segement 2
phi = 1-(1-1.32*(h/b))/(1.05+7.4*(h/b));
Cd_ge = CDo_l+phi*K*(Cl_grl)^2;
To = 0; % Due to No Thrust
N = 0; % No Engine Is Used
A = g*((N*To)/W-mu_l-sin(theta_R));
a = 0; % Due to No Thrust
B = (g/W)*(0.5*rho*S*(Cd_ge-mu_l*Cl_grl)+N*a);
if V_w == 0
    SlgII = (1/(2*B))*log((A-B*VA^2)/A);
else
    SlgII = (1/(2*B))*log((A-B*VGA^2)/A);
end

%Total Ground Roll
Slg = SlgI + SlgII;

%Total
Sld = Sla + Slg;
