%%% data preparation for ECE301 Project #2 
%%  Alex Topping/John Clapham, Bradley University

%% created 10/20/2016
%% updated 10/28/2018



clear all; clc; close all;
%%% 
fs = 44100; %% 44.1 kHz sampling rate
nbit = 16;
channel_num = 1;
device_ID = 1;

%--------- For your information: How the data were recorded--------- 
%MATLAB Codes used to record data %%%%%%
%info=audiodevinfo  
% recorder1 = audiorecorder(fs,nbit,channel_num,device_ID);
% record(recorder1);
% stop(recorder1);
% clean_data = getaudiodata(recorder1);
% play(recorder1);
% len_clean_data = length(clean_data);
% t = (0:1:len_clean_data-1)*1000/fs;
% figure;plot(t, clean_data);
% title('clean data; sampling rate: 44.1kHz')
% xlabel('Time [ms]');
% ylabel('Amplitude');



load all_datasets_project2.mat;
% clean DTMF signals without over-talk 



% Plot the dataset1 and play the audio 
% -----dataset1 : clean DTMF data -------
%soundsc(dataset1,fs);  

figure;plot(t1,dataset1);grid on;
title([ 'dataset1;  sampling rate = '  num2str(fs) 'Hz' ]);
xlabel('Time [ms]');
ylabel('Amplitude');


%pause ( round(max(t1))*1e-3);


% Plot the dataset2 and play the audio 
% -----dataset2 : light corrupted DTMF data -------

%    DTMF signals with light over-talk 
%  1 of 10 numbers is corrupted.

%soundsc(dataset2,fs); %% play the signal(light over-talk)




% figure;plot(t2,dataset2);grid on;
% title([ 'dataset2;  sampling rate = '  num2str(fs) 'Hz' ]);
% xlabel('Time [ms]');
% ylabel('Amplitude');

%pause ( round(max(t2))*1e-3);



% Plot the dataset3 and play the audio 
% -----dataset3 : severe corrupted DTMF data -------

%%   DTMF signals with heavy over-talk
%% most numbers are corrupted

%soundsc(dataset3,fs); %% play the signal of heavy over-talk

% figure;plot(t3,dataset3);grid on;
% title([ 'dataset3;  sampling rate = '  num2str(fs) 'Hz' ]);
% xlabel('Time [ms]');
% ylabel('Amplitude');


%pause ( round(max(t3))*1e-3);

%% Segmentation of dataset 1
% t_start = (10^4).*[4.1 6.1 8.3 12.7 14.9 17.2 20.3 22 24.16 26.05];
% t_end = t_start + 0.6 * (10^4);

t_start = [850 1200 1800 2800 3350 3844 4550 4950 5400 5850]; %from observation
t_end = [1100 1690 2100 3050 3600 4100 4800 5250 5700 6150]; %from observation

start_sample = zeros;
stop_sample = zeros;
for i = 1:1:10
    start_sample(i) = round(t_start(i) *1e-3 *fs); %Array with start segment location
    stop_sample(i) = round(t_end(i)*1e-3*fs); %Array with end segment location
end

digit_dataset = zeros;
digit_seg = zeros(length(dataset1),10); 

for i = 1:1:10
    for j = start_sample(i):1:stop_sample(i)
        digit_dataset(j-start_sample(i)+1,i) = dataset1(j); %making a matrix with segments for fft
        digit_seg(j,i) = dataset1(j); %used for plotting segmented signal
    end
end

digit_spectrum = zeros;
M = 44100; 
for i = 1:1:10  %this is really just for plotting reasons
        temp = fft(digit_dataset(:,i),M);
        for j = 1:1:length(temp)
        digit_spectrum(j,i) = temp(j);
        end
end

%%ploting (did this in for loop because I didn't want to type it all out...
for i = 1:1:10
    figure(i); subplot(211);
    plot(t1,digit_seg(:,i));
    grid on;
    xlabel('Time [ms]');
    ylabel('Amplitude');
    title('segmented signal');
    %xlim([t_start(i) t_end(i)]);
    
    subplot(212);
    plot(abs(digit_spectrum(:,i)));
    title(['spectrum digit5, dataset1'     '   M ='  num2str(M)]);
    xlabel('Frequency [Hz]');
    ylabel('Amplitude');

    xlim([0 2000]);
    grid on;
end

