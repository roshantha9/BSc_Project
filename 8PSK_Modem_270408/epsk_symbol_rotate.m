% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 24/01/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK Symbol Rotation Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% This function rotates the current 8psk symbols by (3*pi/8)

function result = epsk_symbol_rotate(signal)
    temp = [];
    x = 1:length(signal);
    temp = signal.*exp((j*x*3*pi)/8);
    result = temp;
end
    
