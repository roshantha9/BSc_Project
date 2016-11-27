
function rt_env_out = ray_sos(lamda,v,fs,samples)
    %----- function parameters -------
        %lamda = 0.3333;
        %v = (5*1000)/(60*60);
    
        %N = 66;
    
        %fs = 36;
        %samples = 360000;
        %M = 0.5*(N/2 -1);
    % ------------------------
    fm = v/lamda;
    M = 16;
    N = 2*(2*M +1);
    ts = 1/fs;

    % have to stretch the time axis to avoid incorrect samples at the front
    extra = M*(1/fm); 
    tlen = 2*extra + samples*ts;

    t = 0 : ts : tlen;
    a = 0;
    I_x =  sqrt(2)*cos(a)*cos(2*pi*fm*t); % results in cos(2*pi*fm*t), because cos(0)=1;
    Q_x =  sqrt(2)*sin(a)*cos(2*pi*fm*t); % results in zero, because sin(0)=0;

    I = zeros(1,length(I_x));
    Q = zeros(1,length(Q_x));

    for nn = 1:M
      bn = (pi*nn)/M;

      fn = fm*cos((2*pi*nn)/N);   

        Itemp = (2*cos(bn)*cos(2*pi*fn*t));
        Qtemp = (2*sin(bn)*cos(2*pi*fn*t));

      I = I+Itemp;
      Q = Q+Qtemp;
    end

    I_final = I + I_x;
    Q_final = Q + Q_x;

    ss = extra + 0.9*rand(1)*extra;
    ss = round(ss/ts);
    es = ss + samples-1;

    rt_complex = (1/sqrt(2*M+1))*(I_final+j*Q_final);
    rt_complex = rt_complex(ss:1:es);

    rt_env = sqrt((real(rt_complex).^2)+(imag(rt_complex).^2));
    rt_env_out = abs(rt_complex);

        %r_dB = 10*log10(rt_env);
        %r_rms_dB = 10*log10(sqrt(mean(rt_env)^2));
        %r_rms_dB = 10*log10(r_rms);
        %plot([0:samples-1]*ts,r_dB-r_rms_dB);title('envelope r_d_B');%figure;plot(r_rms_dB);title('envelope rms_d_B');
        %axis([0 1 min(r_dB-r_rms_dB) max(r_dB-r_rms_dB)]);
end

