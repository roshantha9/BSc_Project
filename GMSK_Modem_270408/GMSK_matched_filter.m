% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 24/01/07
% GMSK - Modulation/Demodulation with AWGN
% [MAtched Filter Script]
% ========================================================================

% Definition of the Matched-Filter

function result = GMSK_matched_filter(T,sps)
    t = (-1.5*T:T/sps:1.5*T); 
    BT = 0.75;
        
    h = (BT.*sqrt((2*pi)/log(2))).*exp((-1*(((2*pi^2)*(BT.^2))).*t.^2)./log(2)); 
    % need to scale the filter, so that there is a phase change of pi/2 for
    % every bit change.
    
    K = pi/2/sum(h);
    Mfil = h*K;
    
    %normalize filter
    Mfil = Mfil./sqrt(sum(Mfil));
    
    result = Mfil;
    
end
    