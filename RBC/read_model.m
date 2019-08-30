%% Create and Solve Model Object                                           
clear
close all
clc
irisrequired 20180131

%% Read Model File and Create Model Object                                 
m = model('RBC_linear.model');
%m = model('RBC.model');
disp(m)

%% Calibrate Model Parameters                                              
%
m.sigma = 2;
m.phi = 1.5;
m.alpha = 0.35;
m.beta = 0.985;
m.delta = 0.025;
m.rhoa = 0.95;
m.Ea = 0.01;

disp('Parameter Databank from Model Object:');
get(m, 'Parameters')

%% Find Steady State 
m = sstate(m);
chksstate(m);
get(m,'sstateLevel') %?sstateLevel?
get(m,'sstateGrowth') %?sstateGrowth?

%% Calculate First-Order Solution Matrices                                 
m = solve(m);
disp(m)

%% Save Model Object                                                       
save mat/rbc.mat m
