% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [Theoretical BER of 8PSK] 
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

EbN0 = 0:1:18; %EbN0 values in dB, ranging from 0dB to 12 dB
% convert EbN0 from dB to Linear and obtain sqaure root
EbN0_lin = 10.^(EbN0./10);
x = sqrt((2.*EbN0_lin).*(log2(8))).*sin(pi/8); 
% BER definition for GMSK, using built in erfc function in matlab
BER = erfc(x./sqrt(2)); 

% when plotting use logarithmic scale for Y-axis
semilogy(EbN0, BER);grid on
xlabel('EbN0 - dB');
ylabel('BER - Logarithmic Scale');
title('Theoretical EbN0 Vs. BER plot for 8PSK');


            
            