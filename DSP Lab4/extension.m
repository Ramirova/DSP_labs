[y1, fs1] = audioread('Knock.ogg');
[y2, fs2] = audioread('Flying.ogg');

N = 500;
y1 = y1(1:N, 1);
y2 = y2(1:N, 1);
FT1 = fft(y1, 2*N-1);
FT2 = fft(y2, 2*N-1);

result_ft = (FT1 .* FT2); 
result_conv = fft(conv(y1, y2));