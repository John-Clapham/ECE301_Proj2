function [desiredDFT] = DTMFfinder(t_start,t_end)
% Function outputs 2 DTMF frequencies for a single digit
% Needs t_start and t_end which is a phone beep
load all_datasets_project2.mat;
dig = dataset1(t_start:t_end);


freq_table = [697 770 852 941 1209 1336 1477 1633];
q = zeros(1,10);
fs = 44100;
N = 570; %choosen to get the same K values as reference 

k = zeros;
for i = 1:length(freq_table)
    k(i) = N * (freq_table(i)/fs);
end

vk1 = zeros(1,N+2);
vk2 = zeros(1,N+2);
vk3 = zeros(1,N+2);
vk4 = zeros(1,N+2);
vk5 = zeros(1,N+2);
vk6 = zeros(1,N+2);
vk7 = zeros(1,N+2);
vk8 = zeros(1,N+2);

 for n = 3:N+2
    vk1(n) = (2*cos((2*pi*k(1))/N)*vk1(n-1))-vk1(n-2)+dig(n);
    vk2(n) = (2*cos((2*pi*k(2))/N)*vk2(n-1))-vk2(n-2)+dig(n); 
    vk3(n) = (2*cos((2*pi*k(3))/N)*vk3(n-1))-vk3(n-2)+dig(n); 
    vk4(n) = (2*cos((2*pi*k(4))/N)*vk4(n-1))-vk4(n-2)+dig(n); 
    vk5(n) = (2*cos((2*pi*k(5))/N)*vk5(n-1))-vk5(n-2)+dig(n);
    vk6(n) = (2*cos((2*pi*k(6))/N)*vk6(n-1))-vk6(n-2)+dig(n);
    vk7(n) = (2*cos((2*pi*k(7))/N)*vk7(n-1))-vk7(n-2)+dig(n);
    vk8(n) = (2*cos((2*pi*k(8))/N)*vk8(n-1))-vk8(n-2)+dig(n);
 end
 
 Wnk = zeros;
 
 for n = 1:length(freq_table)
     Wnk(n) = exp((-2)*pi*(k(n)/N));
 end
 
 ykN1 = abs(vk1(N+2)-(Wnk(1)*vk1(N-1)))^2;
 ykN2 = abs(vk2(N+2)-(Wnk(2)*vk2(N-1)))^2;
 ykN3 = abs(vk3(N+2)-(Wnk(3)*vk3(N-1)))^2;
 ykN4 = abs(vk4(N+2)-(Wnk(4)*vk4(N-1)))^2;
 ykN5 = abs(vk5(N+2)-(Wnk(5)*vk5(N-1)))^2;
 ykN6 = abs(vk6(N+2)-(Wnk(6)*vk6(N-1)))^2;
 ykN7 = abs(vk7(N+2)-(Wnk(7)*vk7(N-1)))^2;
 ykN8 = abs(vk8(N+2)-(Wnk(8)*vk8(N-1)))^2;
 
 %the two highest values indicate the index position in frequency table
 desiredDFT = [ykN1 ykN2 ykN3 ykN4 ykN5 ykN6 ykN7 ykN8];
 
%%This stuff kinda works but im trying another method above...
% for i = 1:length(freq_table)
%     num = 1;
%     %den = [1 (-2)*(cos(freq_table(i))) 1]; % Where the cosine argument is the frequency of interest
%     %den = [1 -exp(1i*i)];
%     den = [1 (-2)*(cos(2*pi*k(i)/N)) 1];
%     
%     goertzel_filt = filter(num, den, dig);
%     %figure;plot(goertzel_filt)
%     %title(strcat("Goertzel freq ",num2str(freq_table(i))))
%     
%     q(i) = trapz(abs(goertzel_filt));
% end

% max_freqs = maxk(q,2);
% lowfreq = freq_table(find(q == max_freqs(1)));
% highfreq = freq_table(find(q == max_freqs(2)));
% lowfreq = 'myass';
% highfreq = 'myotherass';
end

