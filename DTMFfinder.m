function [highfreq,lowfreq] = DTMFfinder(t_start,t_end)
% Function outputs 2 DTMF frequencies for a single digit
% Needs t_start and t_end which is a phone beep
load all_datasets_project2.mat;
dig = dataset1(t_start:t_end);


freq_table = [697 770 852 941 1209 1336 1477 1633];
q = zeros(1,10);


for i = 1:length(freq_table)
    num = 1;
    %den = [1 (-2)*(cos(freq_table(i))) 1]; % Where the cosine argument is the frequency of interest
    den = [1 -exp(1i*i)];
    
    goertzel_filt = filter(num, den, dig);
    figure;plot(goertzel_filt)
    title(strcat("Goertzel freq ",num2str(freq_table(i))))
    
    q(i) = trapz(abs(goertzel_filt));
end

max_freqs = maxk(q,2);
lowfreq = freq_table(find(q == max_freqs(1)));
highfreq = freq_table(find(q == max_freqs(2)));

end

