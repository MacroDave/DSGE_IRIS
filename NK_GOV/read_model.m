%% Create and Solve Model Object                                           
clear
close all
clc
irisrequired 20180131

%% Read Model File and Create Model Object                                 
m = model('NKGOV_linear.model');
disp(m)

%% Calibrate Model Parameters                                              
m.alpha1 = 0.3;
m.alpha2 = 0.65;
m.alpha3 = 0.05;
m.beta = 0.985;
m.delta = 0.025;
m.deltaG = 0.025;
m.theta = 0.75;
m.thetaW = 0.75;
m.sigma = 2;
m.phi = 1.5;
m.psi = 8;
m.psiW = 21;
m.tau_css = 0.16;
m.tau_lss = 0.17;
m.tau_kss = 0.08;
m.phic = 0.8;
m.omegaR = 0.5;
m.Psi2 = 1;
m.chi = 1;

%Fiscal Policy Parameters
m.gammaG = 0;
m.gammaIG = 0.1;
m.gammaTRANS = 0.1;
m.gammatau_c = 0;
m.gammatau_l = 0;
m.gammatau_k = 0;
m.phiG = 0;
m.phiIG = -0.1;
m.phiTRANS = -0.1;
m.phitau_c = 0;
m.phitau_l = 0;
m.phitau_k = 0;

%Taylor’s Rule Parameters
m.gammaR = 0.8;
m.gammaY = 0.5;
m.gammaPI = 1.5;

%Autoregressive Shock Parameters
m.rhoa = 0.9;
m.rhoG = 0.9;
m.rhoIG = 0.9;
m.rhoTRANS = 0.9;
m.rhotau_c = 0.9;
m.rhotau_l = 0.9;
m.rhotau_k = 0.9;
m.rhom = 0.9;

m.Psi1 = (1+m.tau_css)*((1/m.beta)-(1-m.delta));

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
save mat/nkgov.mat m
