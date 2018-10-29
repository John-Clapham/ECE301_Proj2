%%% data preparation for ECE301 Project #2 
%%  Alex Topping/John Clapham   , Bradley University

%% created 10/20/2016

%% rev1:   10/24/2016 
% (the device ID and channel were computer-dependent when the data were recorded. 
% The file was updated to solve the problem)

%% updated 9/29/2017 (new datasets)

%% new release on 9/20/2018 


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

%% Segmentation 
t_start = (10^4).*[4.1 6.1 8.3 12.7 14.9 17.2 20.3 22 24.16 26.05];
t_end = t_start + 0.6 * (10^4);

dig_1 = dataset1(t_start(1):t_end(1));
dig_1_fft = abs(fft(dig_1, 44100));
figure;plot(dig_1_fft)
title("dig 1 fft")

dig_2 = dataset1(t_start(2):t_end(2));
dig_2_fft = abs(fft(dig_2, 44100));
figure;plot(dig_2_fft)
title("dig 2 fft")

dig_3 = dataset1(t_start(3):t_end(3));
dig_3_fft = abs(fft(dig_3, 44100));
figure;plot(dig_3_fft)
title("dig 3 fft")

dig_4 = dataset1(t_start(4):t_end(4));
dig_4_fft = abs(fft(dig_4, 44100));
figure;plot(dig_4_fft)
title("dig 4 fft")

dig_5 = dataset1(t_start(5):t_end(5));
dig_5_fft = abs(fft(dig_5, 44100));
figure;plot(dig_5_fft)
title("dig 5 fft")

dig_6 = dataset1(t_start(6):t_end(6));
dig_6_fft = abs(fft(dig_6, 44100));
figure;plot(dig_6_fft)
title("dig 6 fft")

dig_7 = dataset1(t_start(7):t_end(7));
dig_7_fft = abs(fft(dig_7, 44100));
figure;plot(dig_7_fft)
title("dig 7 fft")

dig_8 = dataset1(t_start(8):t_end(8));
dig_8_fft = abs(fft(dig_8, 44100));
figure;plot(dig_8_fft)
title("dig 8 fft")

dig_9 = dataset1(t_start(9):t_end(9));
dig_9_fft = abs(fft(dig_9, 44100));
figure;plot(dig_9_fft)
title("dig 9 fft")

dig_10 = dataset1(t_start(10):t_end(10));
dig_10_fft = abs(fft(dig_10, 44100));
figure;plot(dig_10_fft)
title("dig 10 fft")




