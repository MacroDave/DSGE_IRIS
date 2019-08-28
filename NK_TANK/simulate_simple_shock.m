%% Simulate Simple Shock Responses
%
% Simulate a simple shock both as deviations from control and in full
% levels, and report the simulation results.

%% Clear Workspace
%
% Clear workspace, close all graphics figures, clear command window, and
% check the IRIS version.

clear
close all
clc
irisrequired 20180131

%% Load Solved Model Object
%
% Load the solved model object built in <read_model.html read_model>. Run
% |read_model| at least once before running this m-file.

load mat/nktank.mat m;

%% Define Dates
%
% Define the start and end dates as plain numbered periods here.

startDate = 1;
endDate = 40;

%% Simulate Consumption Demand Shock
%
d = zerodb(m, startDate:endDate);
d.Ea(startDate) = log(1.01);
s = simulate(m, d, 1:40, 'Deviation=', true, 'AppendPresample=', true);
display(s);

%% Report Simulation Results
%
% Use the |dbplot( )| function to create a quick report of simulation
% results.  Note how we use the |Transform=| option to plot percent
% deviations of individual variables.

plotRng = startDate : startDate+40;
plotList = { ...
    ' "Output [Pct Level Dev]" Y ', ...
    ' "Investment [Pct Level Dev]" I ', ...
    ' "Consumption [Pct Level Dev]" C ', ...
    ' "Real Rental Rate [Pct Level Dev]" R ', ...
    ' "Capital Stock [Pct Level Dev]" K ', ...	
    ' "Real Wage [Pct Level Dev]" W ', ...
    ' "Hours Worked [Pct Level Dev]" N ', ...
    ' "Productivity [Pct Level Dev]" A', ...
   };
dbplot(s, plotRng, plotList, ...
   'Tight=', true, 'Transform=', @(x) x); 
grfun.ftitle('Productivity Shock -- Deviations from Control');

% Show Variables and Objects Created in This File                         
whos

