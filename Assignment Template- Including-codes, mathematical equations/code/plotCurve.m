function [] = plotCurve(inputArg1,inputArg2)
% Function to plot the Curves

f_GHz = 50:1000;%Defining the frequency range in GigaHertz
figure;         
loglog(f_GHz, inputArg1, 'r', 'LineWidth', 2);
grid on;
xlabel('Frequency (GHz)');

if strcmp(inputArg2, 'FreeSpacePL')
    ylabel('Free Space Path Loss (dB)');
    title('Free Space Path Loss');

elseif strcmp(inputArg2, 'RainPL')
     ylabel('Rain Attenuation (dB)');
     title('Rain Attenuation for Horizontal Polarization');

elseif strcmp(inputArg2, 'FogPL')
     ylabel('Fog Attenuation (dB)');
     title('Fog Attenuation');

elseif strcmp(inputArg2, 'GasPL')
     ylabel('Atmospheric Gases Attenuation (dB)');     
     title('Atmospheric Gases Attenuation');

elseif strcmp(inputArg2, 'TotalPL')
     ylabel('Total Path Loss (dB)');
     title('Total Path Loss');         
end

legend(inputArg2);
%saveas(gcf,strcat(inputArg2,'.png'));
fprintf('Program paused. Press enter to continue.\n');
pause;
end