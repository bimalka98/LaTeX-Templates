%% Initialization
clear; close all; clc
%% ========= Free Space Propagation Loss with Frequency =========

%Defining the frequency range in GigaHertz
f_GHz = 50:1000;
%Free Space Path Loss Model obtained through calculations
freeSpaceLoss1 = 112.44778322 + 20*log10(f_GHz);

% Plotting Data
plotCurve(freeSpaceLoss1, 'FreeSpacePL')

%% == Rain, Fog, Atmospheric Gases Attenuations with Frequency ==

freq = f_GHz*1e9;% Defining the frequency range in Hertz
range = 10e3;    % Distance between transceivers in m
rainrate = 20;   % Rain rate in mm/h
elev = 0;        % Elevation angle of the propagation path
tau = 0;         % Polarization tilt angle of the signal
temp = 31;       % Ambient Temperature in celcious
dens = 0.5;      % Liquid Water Density in g/m^3
rou = 30.4;      % Water Vapor Density in g/m^3
p =  101325;     % Atmospheric Pressure in Pa at sea level

% Calculating Attenuations
rainAttenuation = rainpl(range,freq,rainrate,elev,tau);
fogAttenuation = fogpl(range,freq,temp,dens);
gasAttenuation = gaspl(range,freq,temp, p, rou);

% Plotting Data
plotCurve(rainAttenuation, 'RainPL');
plotCurve(fogAttenuation, 'FogPL');
plotCurve(gasAttenuation, 'GasPL');

%% ============ Total Propagation Loss with Frequency ============

% Calculating Total Attenuation
Totalpathloss = freeSpaceLoss1 + rainAttenuation + ...
                                fogAttenuation +gasAttenuation;
% Plotting Data
plotCurve(Totalpathloss, 'TotalPL');

%% ======= Variation of the Signal Power with the Distance =======

distance = 0:10e3; % Distance between transceivers in m
freq = 50*1e9;     % Choosen frequency value in Hertz

% Calculating Attenuations with Distance
freeSpaceLoss2 = 126.4271833 + 20*log10(distance/(10e2));
rainAttenuation = rainpl(distance,freq,rainrate,elev,tau);
fogAttenuation = fogpl(distance,freq,temp,dens);
gasAttenuation = gaspl(distance,freq,temp, p, rou);

% Total Path Loss with Distancce
TotalLosswithDistance = freeSpaceLoss2' + rainAttenuation + ...
                                fogAttenuation +gasAttenuation;

% Calculating the signal Power with the distance
signalPower =  74 - TotalLosswithDistance;

% Plotting Data
figure;
plot(distance/10e2, signalPower, 'r','LineWidth', 2);
grid on;
xlabel('Distance (km)');
ylabel('Signal Power (dB)');
title('Variation of the Signal Power with the Distance');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ==Sending Voice Signal Over a Noisy Channel - Associated Logic==

freqDeviation = 4000; % Frequency Deviation of the Voice signal
CarrierFreq = 50e9;   % Carrier Frequency

% Frequency range of the Transmitted Signal
freqRange = CarrierFreq - freqDeviation :...
                    CarrierFreq + freqDeviation;

% Calculating Losses
freeSpaceLoss3 = 112.44778322 + 20*log10(freqRange/(1e9));
rainAttenuation = rainpl(range,freqRange,rainrate,elev,tau);
fogAttenuation = fogpl(range,freqRange,temp,dens);
gasAttenuation = gaspl(range,freqRange,temp, p, rou);

% Total Path Loss in the given Frequency Range
TotalPathLoss = freeSpaceLoss3 + rainAttenuation + ...
                                fogAttenuation +gasAttenuation;
% Plotting Data
figure;
plot(freqRange, TotalPathLoss, 'r', 'LineWidth', 2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Total Path Loss (dB)');
title('Variation of the Path Loss with Frequency');
