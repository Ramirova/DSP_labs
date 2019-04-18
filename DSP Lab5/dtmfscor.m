function result = dtmfscor(signal, testing_freq, L, fs)
    n = 0:L-1;
    hh = (2/L)*cos(2*pi*(testing_freq/fs)*n); % bandpass filter coeffs here 
    result = (mean(conv(signal,hh).^2) > mean(signal.^2)/5);


