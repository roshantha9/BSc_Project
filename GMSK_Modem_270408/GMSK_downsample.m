% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 20/04/08
% GMSK - Modulation/Demodulation with AWGN
% [Downsample Script]
% ========================================================================

% Downsamples the received GMSK signal.

% Function parameters :
% ---------------------
% start - begin sampling from this sample.(i.e. leave out(start-1) samples)
% en    - number of samples to leave out at the end
% sps   - downsampling rate
% derivative - input signal to be sampled.

function result = GMSK_downsample(start,en,sps,derivative)
    i = start:sps:length(derivative)-en;
    temp = derivative(i);
    result = temp;
end