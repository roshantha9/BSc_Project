% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 24/01/07
% GMSK+BPSK+8PSK - Modulation/Demodulation with AWGN
% [Theoretical BER]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

EbN0 = 0:1:10; %EbN0 values in dB, ranging from 0dB to 12 dB
% convert EbN0 from dB to Linear and obtain sqaure root
gamma = 0.895; % approximate value for GMSK,BT=0.3
EbN0_lin = 10.^(EbN0./10);
x_GMSK = sqrt(2.*gamma.*EbN0_lin); 
x_BPSK = sqrt(EbN0_lin);
x_8PSK = (sqrt(6.*(EbN0_lin)).*sin(pi/8)); 
% BER definition for GMSK,BPSK and 8PSK using built in erfc function in matlab
BER_GMSK = 0.5*erfc(x_GMSK/sqrt(2));
BER_BPSK = 0.5*erfc(x_BPSK);
BER_8PSK = (1/3)*erfc(x_8PSK/sqrt(2));  %symbol error prob.

% when plotting use logarithmic scale for Y-axis
%semilogy(EbN0, BER_GMSK,'r');grid on;hold on;
%semilogy(EbN0, BER_BPSK);
semilogy(EbN0, BER_8PSK,'g');

xlabel('EsNo - dB');
ylabel('BER - Logarithmic Scale');
title('EsNo Vs. BER');
