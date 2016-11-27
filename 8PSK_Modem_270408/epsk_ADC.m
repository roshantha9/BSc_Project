% Name : Hashan Roshantha Mendis (10030637)
% Date Updated : 01/02/07
% 8PSK - Modulation/Demodulation with AWGN
% [8PSK ADC Script]
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% This function converts the analog signal into 3 bit
% groups according to the 8psk constellation at receiver end.

function result = epsk_ADC(sig)

s1=[1 1 1]; s2=[-1 1 1]; s3=[-1 1 -1]; s4=[-1 -1 -1];
s5=[-1 -1 1]; s6=[1 -1 1]; s7=[1 -1 -1]; s8=[1 1 -1];

rx_angle = angle(sig);
rx_d = [];

for n = 1:length(sig)
    if(rx_angle(n) < 0)
        if ((rx_angle(n) <= 0) && (rx_angle(n) >= -pi/8))   
            rx_d = [rx_d s1]; % group = [1 1 1] 
        elseif ((rx_angle(n) < -pi/8) && (rx_angle(n) >= -3*pi/8))  
            rx_d = [rx_d s8]; % group = [1 1 -1]
        elseif ((rx_angle(n) < -3*pi/8) && (rx_angle(n) >= -5*pi/8)) 
            rx_d = [rx_d s7]; % group = [1 -1 -1]
        elseif ((rx_angle(n) < -5*pi/8) && (rx_angle(n) >= -7*pi/8)) 
            rx_d = [rx_d s6]; % group = [1 -1 1]
        elseif ((rx_angle(n) < -7*pi/8) && (rx_angle(n) >= -pi)) 
            rx_d = [rx_d s5]; % group = [-1 -1 1]
        end    
    end

    if(rx_angle(n)>0)
        if((rx_angle(n) >= 0) && (rx_angle(n) <= pi/8))  
            rx_d = [rx_d s1]; % group = [1 1 1]
        elseif((rx_angle(n) > pi/8) && (rx_angle(n) <= 3*pi/8))   
            rx_d = [rx_d s2]; % group = [-1 1 1]
        elseif((rx_angle(n) > 3*pi/8) && (rx_angle(n) <= 5*pi/8))   
            rx_d = [rx_d s3]; % group = [-1 1 -1]
        elseif((rx_angle(n) > 5*pi/8) && (rx_angle(n) <= 7*pi/8))   
            rx_d = [rx_d s4]; % group = [-1 -1 -1]
        elseif((rx_angle(n) >  7*pi/8) && (rx_angle(n) <= pi))   
            rx_d = [rx_d s5]; % group = [-1 -1 1]
        end       
    end
    
    if(rx_angle(n) == 0)
        rx_d = [rx_d s1];
    end    
   
    
end
         
result = rx_d;

end
