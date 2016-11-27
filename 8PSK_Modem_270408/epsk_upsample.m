% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK Upsample Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% upsamples the input signal by sps

function result = epsk_upsample(signal,sps)
    temp = kron(signal,ones(1,sps));
    result = temp;
end    
    