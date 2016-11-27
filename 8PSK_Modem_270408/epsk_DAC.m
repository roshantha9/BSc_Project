% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK DAC Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% This function groups message into 3 bit groups according to the constellation diagram
% and converts digital to analog signal.

function ans = epsk_DAC(data)
  
    signal = [];
    for n = 1:3:length(data)
        if ((data(n)) == 1) && ((data(n+1)) == 1) && ((data(n+2)) == 1)
            l = 0;
            temp_sig = exp((j*2*pi*l)/8);
        elseif ((data(n)) == -1) && ((data(n+1)) == 1) && ((data(n+2)) == 1)
            l = 1;
            temp_sig = exp((j*2*pi*l)/8);
        elseif ((data(n)) == -1) && ((data(n+1)) == 1) && ((data(n+2)) == -1)
            l = 2;
            temp_sig = exp((j*2*pi*l)/8);
        elseif ((data(n)) == -1) && ((data(n+1)) == -1) && ((data(n+2)) == -1)
            l = 3;
            temp_sig = exp((j*2*pi*l)/8);
        elseif ((data(n)) == -1) && ((data(n+1)) == -1) && ((data(n+2)) == 1)
            l = 4;
            temp_sig = exp((j*2*pi*l)/8);
        elseif ((data(n)) == 1) && ((data(n+1)) == -1) && ((data(n+2)) == 1)
            l = 5;
            temp_sig = exp((j*2*pi*l)/8);
        elseif ((data(n)) == 1) && ((data(n+1)) == -1) && ((data(n+2)) == -1)
            l = 6;
            temp_sig = exp((j*2*pi*l)/8);
        elseif ((data(n)) == 1) && ((data(n+1)) == 1) && ((data(n+2)) == -1)
            l = 7;
            temp_sig = exp((j*2*pi*l)/8);
        end

        signal = [signal temp_sig];
    end
   
  ans = signal;
end