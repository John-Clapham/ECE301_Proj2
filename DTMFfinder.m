function [outputArg1,outputArg2] = DTMFfinder(t_start,t_end)
% Function outputs 2 DTMF frequencies for a single digit
% Needs t_start and t_end which is a phone beep
load all_datasets_project2.mat;
dig = dataset1(t_start:t_end);


freq_table = [697 770 852 941 1209 1336 1477 1633];
q = zeros(1,10);


for i = 1:length(freq_table)
    num = 1;
    den = [1 (-2)*(cos(freq_table(i))) 1]; % Where the cosine argument is the frequency of interest
    
    goertzel_filt = filter(num, den, dig);
    
    q(i) = trapz(abs(goertzel_filt));
end

max_freqs = maxk(q,2);

freq_component1 = freq_table(find(q == max_freqs(1)))
freq_component2 = freq_table(find(q == max_freqs(2)))



outputArg1 = freq_component1;
outputArg2 = freq_component2;
end

