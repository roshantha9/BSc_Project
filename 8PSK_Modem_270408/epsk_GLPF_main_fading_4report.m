% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK Main Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

clear all;%close all
tic
% ------------------------- 8PSK Transmitter -----------------------------
% ------------------------------------------------------------------------
samples = 36;
Tb = 1; % bit duration
SamplePeriod = Tb*(1/samples); 
%m = [1 0 1 1]; % message bits

Pe =[];
%for i = 1:1:10;
  %for EsNo = (0:1:12)

    rand('state', sum(100*clock));
    
    %m = [-1 -1 -1 1 1 -1 1 1 1 1 -1 1 -1 1 -1 -1];
    m = randsrc(1,10^4); % produces random 1's and -1's.
    %m = randombits();
    m = divisibleby3(m); % make array divisible by 3 (zero padding)

    t1 = 0:SamplePeriod:(length(m)*Tb); % define timeline
    t1(:, length(t1)) = []; % get rid of extra column in timeline

    %rect = epsk_upsample(m,samples); % the following code, upsamples the datastream.

    % group message into 3 bit groups and convert D/A
    s = epsk_DAC(m); % here we group the discrete data bits. NOT the continous
    %plot(s);title('8psk prior to rotation and filtering Tx. constellation'); 

    % rotation of symbols.
    s2 = epsk_symbol_rotate(s);
    %s2=s;
    % upsample the complex signal
    s3 = epsk_upsample(s2,samples);

    % generating the pulse shaping filter and convolve with signal
    pulse_filter = epsk_shaping_filter(Tb,21);
    s3_filtered = conv(pulse_filter,s3);
    s3_filtered = [s3_filtered 0]; % add an extra sample to the end.
    %plot(s3_filtered);title('8psk filtered Tx. constellation'); 

    % Hs = spectrum.periodogram;          % Use default values
    % psd(Hs,s3_filtered,'Fs',SamplePeriod)

  
    % ------------------------- Applying AWGN -----------------------------
    % ---------------------------------------------------------------------

    % No noise applied
    s_tx = s3_filtered;
    %s_tx = s3;

    %faded_signal = rayleigh_sim(s_tx,samples);
    %EsNo = 10;
    % introduce AWGN noise into the system.
    %tx_noisy_real = AWGN_channel(real(faded_signal),EsNo,Tb);
    %tx_noisy_imag = AWGN_channel(imag(faded_signal),EsNo,Tb);
    %s_tx_noisy = tx_noisy_real + (j*tx_noisy_imag);
    
    %Add Noise - using matlab built in function
    %s_tx_noisy = awgn(s_tx,EbNo,'measured','db');
    
    
    
    s_tx_noisy=s_tx;
    %s_rx = s_tx;
    % ------------------------- 8PSK Receiver -----------------------------
    % ---------------------------------------------------------------------
    
    % generate matched filter, convolve with Rx. signal
    m_filt = epsk_matched_filter(Tb,7);
    %s_rx=[];
    s_rx = conv(m_filt,s_tx_noisy);
    s_rx = [s_rx 0]; % add an extra sample to the end.
    %plot(s_rx);title('8psk filtered Rx. constellation'); 
    
    % downsample the filtered signal
    s_rx_dwnsmpled = epsk_downsample(s_rx,samples,86,57);
    
    % de-rotation of symbols.
    s_rx_derotate = epsk_derotate(s_rx_dwnsmpled);
    
    % convert analog signal to digital.
    s_rx_digital = epsk_ADC(s_rx_derotate);
    
    % error rate
    [num,rat] = symerr(m,s_rx_digital)
    
    
      %j = EbNo+1;  
      %store Pe values
       %Pe(i,j) = rat;
       %Pe = [Pe rat];
    
      %fprintf('end of iteration %d \n',EsNo);
  %end
%end 

% ---------------- Generate EbNo vs. BER plot -----------------
%{
%Pe2 = sum(Pe)./10;
EsNo_temp = 0:1:12;
semilogy(EsNo_temp,Pe);hold on;  
total_time = toc;
%----theoretical -------
%{
EbN0_lin = 10.^(EsNo_temp./10);
x_8PSK = (sqrt(6.*(EbN0_lin)).*sin(pi/8)); 
BER_8PSK = (1/3)*erfc(x_8PSK/sqrt(2));  %symbol error prob.
semilogy(EsNo_temp, BER_8PSK,'g');
%}
%}