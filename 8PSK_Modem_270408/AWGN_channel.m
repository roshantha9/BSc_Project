% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 02/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [AWGN Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Creates WGN and adds it to the signal.
% result = noisy signal.

function result = AWGN_channel(signal, EbNo_db, bitduration)
    %Eb = 1*sum(abs(signal))/length(signal);
    Eb = (1*bitduration);
    No = (36*Eb)/(10^(EbNo_db/10));
    sigma = sqrt(No);
    result = signal + (sigma * randn(1,length(signal)));
end    