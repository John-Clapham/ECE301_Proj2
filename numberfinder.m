function number = numberfinder(highfreq,lowfreq)

number = zeros;
for i = 1:1:10
       if (highfreq == 1209 && lowfreq == 697)
           number(i) = 1;
       elseif (highfreq == 1209 && lowfreq == 770)
           number(i) = 4;
       elseif (highfreq == 1209 && lowfreq == 852)
           number(i) = 7;
       elseif (highfreq == 1336 && lowfreq == 697)
           number(i) = 2;
       elseif (highfreq == 1336 && lowfreq == 770)
           number(i) = 5;
       elseif (highfreq == 1336 && lowfreq == 852)
           number(i) = 8;
       elseif (highfreq == 1336 && lowfreq == 941)
           number(i) = 0;
       elseif (highfreq == 1477 && lowfreq == 697)
           number(i) = 3;
       elseif (highfreq == 1477 && lowfreq == 770)
           number(i) = 6;
       elseif (highfreq == 1477 && lowfreq == 852)
           number(i) = 9;
       else
           number(i) = 100;
       end
end    


end