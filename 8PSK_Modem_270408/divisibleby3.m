% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK Divisible by 3 Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% divisible3.m - this function makes the data array divisible by 3
% if remainder after dividing by three is 1 -> 2 zero paddings.
% if remainder after dividing by three is 2 -> 1 zero padding.

function ans = divisibleby3(data)
    R = rem(length(data),3);
    
    if(R == 0)
        data = data;
    elseif (R == 1)
        data = [data -1 -1];
    elseif (R == 2)
        data = [data -1];
    end    

    ans = data;
end