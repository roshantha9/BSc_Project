% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 24/01/07
% GMSK - Modulation/Demodulation with AWGN
% [Theoretical BER of GMSK, BT=0.3]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

EbN0 = 0:1:9; %EbN0 values in dB, ranging from 0dB to 12 dB
% convert EbN0 from dB to Linear and obtain sqaure root
gamma = 0.895;
EbN0_lin = 10.^(EbN0./10);
x = sqrt(2.*gamma.*EbN0_lin); 
% BER definition for GMSK, using built in erfc function in matlab
BER = 0.5*erfc(x./sqrt(2)); 

% when plotting use logarithmic scale for Y-axis
semilogy(EbN0, BER,'c');grid on
xlabel('EbN0 - dB');
ylabel('BER - Logarithmic Scale');
title('Theoretical EbN0 Vs. BER plot for GMSK');
% obtain value for EbNo = 8dB, output to command window
%db8 = find(EbN0 == 8);
%BER(db8)
%hold on
% plot EbN0 = 8dB value on graph.
%plot(EbN0(db8),BER(db8),'--rs','LineWidth',2,'Marker','o',...
                %'MarkerEdgeColor','r',...
                %'MarkerSize',5);
            
            
            