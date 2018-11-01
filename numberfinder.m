function [number] = numberfinder(desiredDFT)

%        if (highfreq == 1209 && lowfreq == 697)
%            number = 1;
%        elseif (highfreq == 1209 && lowfreq == 770)
%            number = 4;
%        elseif (highfreq == 1209 && lowfreq == 852)
%            number = 7;
%        elseif (highfreq == 1209 && lowfreq == 941)
%            number = '*';
%        elseif (highfreq == 1336 && lowfreq == 697)
%            number = 2;
%        elseif (highfreq == 1336 && lowfreq == 770)
%            number = 5;
%        elseif (highfreq == 1336 && lowfreq == 852)
%            number = 8;
%        elseif (highfreq == 1336 && lowfreq == 941)
%            number = 0;
%        elseif (highfreq == 1477 && lowfreq == 697)
%            number = 3;
%        elseif (highfreq == 1477 && lowfreq == 770)
%            number = 6;
%        elseif (highfreq == 1477 && lowfreq == 852)
%            number = 9;
%        elseif (highfreq == 1477 && lowfreq == 941)
%            number = '#';
%        elseif (highfreq == 1633 && lowfreq == 697)
%            number = 'A';
%        elseif (highfreq == 1633 && lowfreq == 770)
%            number = 'B';
%        elseif (highfreq == 1633 && lowfreq == 852)
%            number = 'C';
%        elseif (highfreq == 1633 && lowfreq == 941)
%            number = 'D';
%        else
%            number = 100;
%        end 
    [M,I] = maxk(desiredDFT,2);
    
    I = sort(I,'ascend');
    
    if (I(1) == 1 && I(2) == 5)
        number = 1;
    elseif (I(1) == 2 && I(2) == 5)
        number = 4;
    elseif (I(1) == 3 && I(2) == 5)
        number = 7;
    elseif (I(1) == 4 && I(2) == 5)
        number = '*';
    elseif (I(1) == 1 && I(2) == 6)
        number = 2;
    elseif (I(1) == 2 && I(2) == 6)
        number = 5;
    elseif (I(1) == 3 && I(2) == 6)
        number = 8;
    elseif (I(1) == 4 && I(2) == 6)
        number = 0;
    elseif (I(1) == 1 && I(2) == 7)
        number = 3;
    elseif (I(1) == 2 && I(2) == 7)
        number = 6;
    elseif (I(1) == 3 && I(2) == 7)
        number = 9;
    else
        number = 100;
    end

end