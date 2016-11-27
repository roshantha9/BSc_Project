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
for EbNo = 0:1:20

    %rand('twister', sum(100*clock));

    m = randsrc(1,10000); % produces random 1's and -1's.
    m = divisibleby3(m); % make array divisible by 3 (zero padding)

    t1 = 0:SamplePeriod:(length(m)*Tb); % define timeline
    t1(:, length(t1)) = []; % get rid of extra column in timeline

    rect = epsk_upsample(m,samples); % the following code, upsamples the datastream.

    % group message into 3 bit groups and convert D/A
    s = epsk_DAC(m);
    %figure;plot(s);title('8psk prior to rotation and filtering Tx. constellation'); 

    % rotation of symbols.
    s2 = epsk_symbol_rotate(s);
    %s2=s;

    % upsample the complex signal
    s3 = epsk_upsample(s2,samples);

    % generating the pulse shaping filter and convolve with signal
    %s3_filtered = rcosflt(s3,1,36,'fir/Fs');

    %pulse_filter = epsk_shaping_filter(Tb, 18);
    [pulse_filter den] = rcosine(1,18,'default');
    pulse_filter = pulse_filter./sqrt(sum(pulse_filter));
    s3_filtered = conv(pulse_filter,s3);
    s3_filtered = [s3_filtered 0]; % add an extra sample to the end.
    %figure;plot(s3_filtered);title('8psk filtered Tx. constellation'); 

    % Hs = spectrum.periodogram;          % Use default values
    % psd(Hs,s3_filtered,'Fs',SamplePeriod)

  
    % -------------- Pass Through Fading Channel and Add AWGN  ------------
    % ---------------------------------------------------------------------

    % No noise applied
    s_tx = s3_filtered;
    
    % apply Rayleigh multipath fading.
    faded_signal = rayleigh_sim(s_tx,samples);
        
    %EbNo = 1;
    %introduce AWGN noise into the system.
    tx_noisy_real = AWGN_channel(real(faded_signal),EbNo);
    tx_noisy_imag = AWGN_channel(imag(faded_signal),EbNo);
    
    % Following two lines used for NON-FADING scenario (only AWGN)    
    %tx_noisy_real = AWGN_channel(real(s_tx),EbNo);
    %tx_noisy_imag = AWGN_channel(imag(s_tx),EbNo);
    
    s_tx_noisy = tx_noisy_real + (j*tx_noisy_imag);
    
    
    %s_tx_noisy = s_tx;
       
    %s_rx = s_tx_noisy;
    % ------------------------- 8PSK Receiver -----------------------------
    % ---------------------------------------------------------------------
    
    % generate matched filter, convolve with Rx. signal
    
   %m_filt = epsk_matched_filter(Tb,18);
   [m_filt den] = rcosine(1,10,'default');
   m_filt = m_filt./sqrt(sum(m_filt));
   s_rx = conv(m_filt,s_tx_noisy);
   s_rx = [s_rx 0]; % add an extra sample to the end.
    
    
    %figure;plot(s_rx);title('8psk filtered Rx. constellation'); 
    
    % downsample the filtered signal
    s_rx_dwnsmpled = epsk_downsample(s_rx,samples,109,62);
    
    % de-rotation of symbols.
    s_rx_derotate = epsk_derotate(s_rx_dwnsmpled);
    
    % convert analog signal to digital.
    s_rx_digital = epsk_ADC(s_rx_derotate);
    
    % error rate
    [num,rat] = symerr(m,s_rx_digital);
    
        
      %store Pe values
       Pe = [Pe rat];
    
       fprintf('end of %d \n',EbNo);
end

% ---------------- Generate EbNo vs. BER plot -----------------

EbNo_temp = 0:1:20;
semilogy(EbNo_temp,Pe);title('8PSK - EbNo vs. BER');  
hold on;
total_time = toc;

 %Hs = spectrum.periodogram;          % Use default values
 %psd(Hs,s3_filtered,'Fs',SamplePeriod)
