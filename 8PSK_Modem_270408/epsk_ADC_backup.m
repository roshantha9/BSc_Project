% epsk_ADC.m - this function converts the analog signal into 3 bit
% groups.according to the 8psk constellation.

function ans = epsk_DAC(sig)

s1=[1 1 1]; s2=[0 1 1]; s3=[0 1 0]; s4=[0 0 0];
s5=[0 0 1]; s6=[1 0 1]; s7=[1 0 0]; s8=[1 1 0];



rx_angle = angle(sig);
rx_d = [];

for n = 1:length(sig)
    if(rx_angle(n) < 0)
        if ((rx_angle(n) < 0) && (rx_angle(n) >= -pi/8))
            rx_d = [rx_d s1];
        elseif ((rx_angle(n) < -pi/8) && (rx_angle(n) >= -3*pi/8))
            rx_d = [rx_d s8];
        elseif ((rx_angle(n) < -3*pi/8) && (rx_angle(n) >= -5*pi/8))
            rx_d = [rx_d s7];
        elseif ((rx_angle(n) < -5*pi/8) && (rx_angle(n) >= -7*pi/8))
            rx_d = [rx_d s6];
        elseif ((rx_angle(n) < -7*pi/8) && (rx_angle(n) >= -pi))
            rx_d = [rx_d s5];
        end    
    end

    if(rx_angle(n)>0)
        if((rx_angle(n) > 0) && (rx_angle(n) <= pi/8))
            rx_d = [rx_d s1];
        elseif((rx_angle(n) > pi/8) && (rx_angle(n) <= 3*pi/8))
            rx_d = [rx_d s2];
        elseif((rx_angle(n) > 3*pi/8) && (rx_angle(n) <= 5*pi/8))
            rx_d = [rx_d s3];
        elseif((rx_angle(n) > 5*pi/8) && (rx_angle(n) <= 7*pi/8))
            rx_d = [rx_d s4];
        elseif((rx_angle(n) >  7*pi/8) && (rx_angle(n) <= pi))
            rx_d = [rx_d s5];
        end       
    end
   
    
end
        
        
ans = rx_d;


