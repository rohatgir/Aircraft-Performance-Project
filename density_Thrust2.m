%% Density & Thrust Function
% By: Rahul Rohatgi
% Student Number: 500498833
%% Created Function
function[density,thrust,density_ratio]=density_Thrust2(alt)
format shorte
alt=alt*0.3048; %Feet to Meter conversion
density_slvl = 0.002378; %Density of Air at Sea Level In Imperial Units
To_slvl=531.911; %Static Thrust at Sea Level
temp_ratio = 1-2.26e-5*alt; %Calculating Temperature Ratio
density_ratio = temp_ratio^4.256; %Calculating Density Ratio
density = density_ratio*density_slvl; %Calculating New Density
thrust=density_ratio*To_slvl; %Calculating New Static Thrust
end