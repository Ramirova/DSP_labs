function result = dft(x)
    %To compute the discrete fourier transoform of x
    N=length(x);
    n = 0:1:N-1; 
    k = 0:1:N-1;
    WN = exp(-1j*2*pi/N); % Twiddle factor (w)
    nk = n'*k; % creates a N by N matrix of nk values
    WNnk = WN .^ nk; % DFT matrix
    result = WNnk*x;

