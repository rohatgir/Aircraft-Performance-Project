%% Density Function
% By: Rahul Rohatgi
% Student Number: 500498833
%% Created Function
function[density]=density(alt)
format shorte
alt=alt*0.3048; %Feet to Meter conversion
density_slvl = 0.002378; %Density of Air at Sea Level In Imperial Units
temp_ratio = 1-2.26e-5*alt; %Calculating Temperature Ratio
density_ratio = temp_ratio^4.256; %Calculating Density Ratio
density = density_ratio*density_slvl; %Calculating New Density
end