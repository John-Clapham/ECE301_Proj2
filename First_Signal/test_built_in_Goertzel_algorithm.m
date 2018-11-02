%% Test built_in Goertzel Algorithm ECE301_17FA)
%% Alex Topping/John Clapham
%% 11/4/2017
%% It aims to provide a comparative result of direct FFT and built-in Goertzel algorithm.

clc;clear all; close all;
Fs = 44100; % sampling rate
N = 5000; % length of x    %2000, 3000, 5000


%%%%%%% Goertzel MATLAB search.....
lo = sin(2*pi*697*(0:N-1)/Fs);
hi = sin(2*pi*1209*(0:N-1)/Fs);
data = lo + hi;

f = [697 770 852 941 1209 1336 1477];
freq_indices = round(f/Fs*N) + 1;   
dft_data = goertzel(data,freq_indices);


ax = gca;
ax.XTick = f;
xlabel('Frequency (Hz)')
title('DFT Magnitude')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N_fft = 5000;

data_fft = fft(data, N_fft);

figure; 
subplot(2,1,1);
stem(f,abs(dft_data)); grid on;
subplot(2,1,2);
f_indx = ((0:1:N_fft-1)/N_fft)*Fs;
stem(f_indx, abs(data_fft));grid on;

