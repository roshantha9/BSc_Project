% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 20/04/08
% GMSK - Modulation/Demodulation with AWGN
% [Gaussian Filter script]
% ========================================================================

% Definition of the Premodulation - Gaussian Filter

function result = GMSK_gaussian_filter(T,sps)
    t = (-1.5*T:T/sps:1.5*T); 
    BT = 0.3; % T=1
  
    h = (BT.*sqrt((2*pi)/log(2))).*exp((-1*(((2*pi^2)*(BT.^2))).*t.^2)./log(2)); 
    % need to scale the filter, so that there is a phase change of pi/2 for
    % every bit change.
    
    K = pi/2/sum(h);
    gfilter = K*h;
    
    %normalize filter gain.
    gfilter = gfilter./sqrt(sum(gfilter));
    
    %figure;plot(gfilter);title('gaussian filter');
    result = gfilter;
    
end
    