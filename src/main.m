clc;
clear;
close all;


%%%%%%%%%%%%%%%%%%%%%% Step A %%%%%%%%%%%%%%%%%%%%%%
load("hum.mat");

soundsc(hum1, 8000);
soundsc(hum2, 8000);

%%%%%%%%%%%%%%%%%%%%%% Step B %%%%%%%%%%%%%%%%%%%%%%
load("Firfilter.mat");

filtered_hum1_fir = filter(firnotch, 1, hum1);
filtered_hum2_fir = filter(firnotch, 1, hum2);

soundsc(filtered_hum1_fir, 8000);
soundsc(filtered_hum2_fir, 8000);

%%%%%%%%%%%%%%%%%%%%%% Step P %%%%%%%%%%%%%%%%%%%%%%
freqz(firnotch, 1, 8000, 8000);

%%%%%%%%%%%%%%%%%%%%%% Step T %%%%%%%%%%%%%%%%%%%%%%
A = 0.9;
B = 1.4;
x_coef = [1 -B 1];
y_coef = [1 -A*B A^2];

freqz(x_coef, y_coef, 8000, 8000);
title(strcat("A=", num2str(A), " B=", num2str(B)));

% figure;
% for A=0.6:0.02:1.8
%     IIR_filter_A_B(A, 1.4);
%     title(strcat("A=", num2str(A), " B=", num2str(1.4)));
%     pause(0.1);
% end
% 
% for B=0.7:0.02:1.5
%     IIR_filter_A_B(0.9, B);
%     title(strcat("A=", num2str(0.9), " B=", num2str(B)));
%     pause(0.1);
% end

% A changes the phase and also the intensity of the removing frequencies around 400Hz
% B shifts the frequency response

%%%%%%%%%%%%%%%%%%%%%% Step S %%%%%%%%%%%%%%%%%%%%%%
A = 0.82;
B = 1.902;
x_coef = [1 -B 1];
y_coef = [1 -A*B A^2];

freqz(x_coef, y_coef, 8000, 8000);
title(strcat("A=", num2str(A), " B=", num2str(B)));

filtered_hum1_iir = filter(x_coef, y_coef, hum1);
filtered_hum2_iir = filter(x_coef, y_coef, hum2);

soundsc(filtered_hum1_iir, 8000);
soundsc(filtered_hum2_iir, 8000);




