% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK Downsample Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% Downsamples the signal, the head and tail are the start and end samples.
% sps = sampling rate

function result = epsk_downsample(signal,sps,head,tail)
    n = head:sps:(length(signal)-tail);
    temp = signal(n);
    result = temp;
end
