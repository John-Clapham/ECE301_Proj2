%%% data preparation for ECE301 Project #2 
%%  Alex Topping/John Clapham   , Bradley University

%% created 10/20/2016
%%revised 10/28/2018

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




figure;plot(t2,dataset2);grid on;
title([ 'dataset2;  sampling rate = '  num2str(fs) 'Hz' ]);
xlabel('Time [ms]');
ylabel('Amplitude');

%pause ( round(max(t2))*1e-3);



% Plot the dataset3 and play the audio 
% -----dataset3 : severe corrupted DTMF data -------

%%   DTMF signals with heavy over-talk
%% most numbers are corrupted

%soundsc(dataset3,fs); %% play the signal of heavy over-talk

figure;plot(t3,dataset3);grid on;
title([ 'dataset3;  sampling rate = '  num2str(fs) 'Hz' ]);
xlabel('Time [ms]');
ylabel('Amplitude');


%pause ( round(max(t3))*1e-3);

%% Filter

t_start = (10^4).*[4.1 6.1 8.3 12.7 14.9 17.2 20.3 22 24.16 26.05];
t_end = t_start + 0.6 * (10^4);

dig_1 = dataset1(t_start(1):t_end(1));
dig_2 = dataset1(t_start(2):t_end(2));
dig_3 = dataset1(t_start(3):t_end(3));
dig_4 = dataset1(t_start(4):t_end(4));
dig_5 = dataset1(t_start(5):t_end(5));
dig_6 = dataset1(t_start(6):t_end(6));
dig_7 = dataset1(t_start(7):t_end(7));
dig_8 = dataset1(t_start(8):t_end(8));
dig_9 = dataset1(t_start(9):t_end(9));
dig_10 = dataset1(t_start(10):t_end(10));

%passes through the goretzel algorithm
[highfreq,lowfreq] = DTMFfinder(t_start(1),t_end(1))

%Passes through number function






