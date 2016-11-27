% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 24/01/07
% GMSK - Modulation/Demodulation with AWGN
% [AWGN Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Creates WGN and adds it to the signal.
% result = noisy signal.

function result = AWGN_channel(signal, EbNo_db, bitduration)
    %Eb = 1;
    Eb = 1*sum(abs(signal.^2))/length(signal);
    %Eb =1;
    No = (Eb)/(10^(EbNo_db/10));
    sigma = sqrt(No/2);
    result = signal + (sigma * randn(1,length(signal)));
end    