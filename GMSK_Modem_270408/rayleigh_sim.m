%Name : Hashan Roshantha Mendis (10030637)
%Date Updated : 20/04/08
%-----------------------------------------------------------------
% Three Path Rayleigh Fading Simulator
% simulates Multipath Rayleigh fading (for 3 paths
% simulate with 4 paths
%-----------------------------------------------------------------
function rt = rayleigh_sim(signal,sps)

   % Setup delay parameters
    delay1 = 0.0; delay2 = 0.5; delay3 = 0.5;
    
   % setup gain parameters
     gain1 = 0; gain2=0.2;  gain3=0.2;
        
% -----------------------------------------------------    
    path1 = [zeros(1,round(delay1*sps)) signal];
    path2 = [zeros(1,round(delay2*sps)) signal];
    path3 = [zeros(1,round(delay3*sps)) signal];
     
    % chop off the end to agree with original lengths
    path1_chop = path1(1: (length(path1)- round(delay1*sps)));
    path2_chop = path2(1: (length(path2)- round(delay2*sps)));
    path3_chop = path3(1: (length(path3)- round(delay3*sps)));
        
    % setup rayleigh envelope weights
    wavlen = 0.333; %wavelength for GSM
    mobspeed = (200*1000)/(60*60); % mobile speed
    %initially test without doppler shift.
    
    ray1 = 1; % Direct LOS wave.
    ray2 = abs(randn(1,length(signal))+ j*randn(1,length(signal)));  % ray2 = kron(ray2,ones(1,sps));
    ray3 = abs(randn(1,length(signal))+ j*randn(1,length(signal)));  % ray3 = kron(ray3,ones(1,sps));
    
          
    % test with doppler filter.
    %ray1 = rayleigh_generator(length(path1_chop),wavlen,mobspeed); % envelope 1
    %ray2 = ray_sos(wavlen,mobspeed,10^3,length(path2_chop)); % envelope 2
    %ray3 = ray_sos(wavlen,mobspeed,10^3,length(path3_chop)); % envelope 3
      
  
    % apply gain to rayleigh weights
    ray1_g = ray1*gain1;
    ray2_g = ray2*gain2;
    ray3_g = ray3*gain3;
       
    % multiply signal with rayleigh envelopes.
    sig1 = ray1_g.*path1_chop;
    sig2 = ray2_g.*path2_chop;
    sig3 = ray3_g.*path3_chop;
        
    % combine multipath faded signals.      
    rt = sig1 + sig2 + sig3;
    
end
    
    
    

    
    
    
    


    
    
        
        
        