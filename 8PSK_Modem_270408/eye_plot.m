
function eye_plot(signal)
    N = 100;
    n=36*2;
    
    %t2 = linspace(0,1,n);
    for i = 1:N
        
        temp_real = real(signal((i-1)*n+1:(i-1)*n+n));
        temp_imag = imag(signal((i-1)*n+1:(i-1)*n+n));
        subplot(2,1,1);plot(temp_real);
        title('Eye diagram for 8psk - I-phase');
        hold on
        subplot(2,1,2);plot(temp_imag);
        title('Eye diagram for 8psk - Q-phase');
        hold on
    end
end