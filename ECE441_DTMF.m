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

%% dataset1 no noise

t_start = (10^4).*[4.1 6.1 8.3 12.7 14.9 17.2 20.3 22 24.16 26.05];
t_end = t_start + 0.6 * (10^4);

desiredDFT = zeros(8,10); %preallocation
for i = 1:10
    desiredDFT(:,i) = DTMFfinder(dataset1,t_start(i),t_end(i));
end

number1 = zeros(1,10); %preallocation
for i = 1:10
    number1(i) = numberfinder(desiredDFT(:,i));
end

number1

%% dataset2 half noise

t_start2 = 44.1.*[5100 5950 6800 7700 8600 9310 10100 10900 12100 13400];
t_end2 = t_start2 + (200*44.1);


for i = 1:10
    desiredDFT(:,i) = DTMFfinder(dataset2,t_start2(i),t_end2(i));
end


for i = 1:10
    number2(i) = numberfinder(desiredDFT(:,i));
end

number2

%% dataset3 full noise

t_start2 = 44.1.*[1350 2850 3450 4200 4750 5200 5600 6000 6500 7000];
t_end2 = t_start2 + (200*44.1);

for i = 1:10
    desiredDFT(:,i) = DTMFfinder(dataset3,t_start2(i),t_end2(i));
end


for i = 1:10
    number3(i) = numberfinder(desiredDFT(:,i));
end

number3
