%% Stalled On Landing MATLAB Code
% By: Rahul Rohatgi
% Student Number: 500498833
%% Created Function
function[Sld]=stalled_on_landing(rho,V_w)
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
VA = 1.25*Vs_ld;

% Airbone Segment I
SlaI = hsc/(tand(a_angle));

% Airbone Segment II
phi = 1-(1-1.32*(h/b))/(1.05+7.4*(h/b));
R = VA^2/(g*(Cl_ratio-1));
V_bar = sqrt((((Vs_ld^2)+(VA^2))/2));
Cl_bar = W/(0.5*rho*V_bar^2*S);
Cd_bar = CDo_l+phi*K*(Cl_bar)^2;
D_bar = 0.5*rho*(V_bar^2)*S*Cd_bar;
T_bar = 0; % No Reverse or Forward Thrust
SlaII = R*sind(a_angle/2)+(W/(2*g))*((Vs_ld^2-VA^2)/(T_bar-D_bar));

if V_w == 0
    Sla = SlaI + SlaII;
else
    Sla = SlaI + SlaII;
    delta_t = hsc/(VA*tand(a_angle))+(R/VA)*sind(a_angle/2)+(W/g)*((Vs_ld-VA)/(T_bar-D_bar));
    Sla = Sla - V_w*delta_t;
end

% Ground Roll Segment I
t_delay = 2; % Initial Parameter
if V_w == 0
    SlgI = Vs_ld*t_delay;
else
    VGS = Vs_ld - V_w;
    SlgI = VGS*t_delay;
end

% Ground Roll Segement II
Cd_ge = CDo_l+phi*K*(Cl_grl)^2;
To = 0; % Due to No Thrust
N = 0; % No Engine Is Used
A = g*((N*To)/W-mu_l-sin(theta_R));
a = 0; % Due to No Thrust
B = (g/W)*(0.5*rho*S*(Cd_ge-mu_l*Cl_grl)+N*a);
if V_w == 0
    SlgII = (1/(2*B))*log((A-B*Vs_ld^2)/A);
else
    SlgII = (1/(2*B))*log((A-B*VGS^2)/A);
end
Slg = SlgI + SlgII;

%Total Landing Distance
Sld = Sla + Slg;
end