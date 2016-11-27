% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK Pulse Shaping Filter Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

% Definition of the Premodulation - Linearised Gaussian Filter for 8psk

function result = epsk_shaping_filter(T,sps)
    t = (-5*T/2:T/sps:5*T/2); 
    approx_filt = exp((-1.045*(t/T).^2) - (0.218*(t/T).^4));
    
    %normalize filter gain.
    approx_filt = approx_filt/sqrt(sum(approx_filt));
          
    result = approx_filt;
    
end