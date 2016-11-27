%Name : Hashan Roshantha Mendis (100306370
%Date Updated : 20/04/08
%------------------------------------------
% Script used to plot the PSD of the signals

fs =36; % sampling rate
window = 2^15; % FFT window size
[pxx,f] = pwelch(real(s_tx),window,fs);
pxx = pxx/sum(pxx);
n = length(f)/2;
pxxdB = 10*log(pxx/pxx(1)); % convert into dB
plot(f(1:n),pxxdB(1:n));