function [number] = numberfinder(desiredDFT)

    %finds location of max
    [M,I] = maxk(desiredDFT,2);
    
    %sorts based on index
    I = sort(I,'ascend');
    
    %compares position of 2 max energy levels with associated digit
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