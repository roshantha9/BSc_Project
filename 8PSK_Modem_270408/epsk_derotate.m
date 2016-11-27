% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK De-rotate Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% derotates the signal by (3*pi/8) to fit the original 8psk constellation

function result = epsk_derotate(signal)
    x = 1:length(signal);
    temp = signal./(exp((j*x*3*pi)/8));
    result = temp;
end

    