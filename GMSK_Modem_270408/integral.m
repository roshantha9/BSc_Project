% hand coded 'cumsum'
msg_int =[];
 for k = 1:length(m_filtered)
     msg_int(k) = sum(m_filtered(1:k)); % take sum upto every k samples.
 end