%% Bradle Univeristy
%% Alex Topping/John Clapham   10/20/2016
%% updated 10/28/2018

%%% Prepare to demo the concept of ECE301 project #2

%%% clean data sets
clear all; clc; close all;
%%% 
fs = 44100; %% 44.1 kHz sampling rate
nbit = 16;
channel_num = 1;
device_ID = 1;


load all_datasets_project2.mat;
%% clean DTMF signals without over-talk 

%%% the 5th digit (by observation) 
start_time = 3380; %% ms
stop_time = 3555; %% ms

%I think this is just setting the bounds to perform analysis
start_sample = round(start_time *1e-3 *fs);
stop_sample = round(stop_time*1e-3*fs);
digit5_dataset1 = dataset1(start_sample: stop_sample);

%this is segmenting the samle?
digit5_seg = zeros(size(dataset1));
digit5_seg(start_sample: stop_sample)= dataset1(start_sample: stop_sample);

%%%
%Analysis of sample
M = 44100;  %% 
digit5_spectrum = fft(digit5_dataset1,M);

figure; subplot(211);
plot(t1,digit5_seg);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
title('segmented signal');
xlim([3000 4000]);

subplot(212);
plot(abs(digit5_spectrum));
title(['spectrum digit5, dataset1'     '   M ='  num2str(M)]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

xlim([0 2000]);
grid on;



%%
M2 = 5000;
digit5_spectrum2 = fft(digit5_dataset1,M2);
freq_pseduo = ((0:1:M2-1)./M2 ) * fs; %we should figure out what this is

figure; subplot(211);
plot(t1,digit5_seg);
grid on;
xlabel('Time [ms]');
ylabel('Amplitude');
xlim([3000 4000]);

title('segmented signal');

subplot(212);
plot(freq_pseduo,abs(digit5_spectrum2));
title(['spectrum 2 : digit5, dataset1: ' 'M2 ='  num2str(M2)]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

xlim([0 2000]);
grid on;
