[y1, fs1] = audioread('Knock.ogg');
tic
my_dft_result = dft(y1(1:256));
timeElapsed = toc;
disp(timeElapsed)

tic
my_fft_result = my_fft(y1(1:256));
timeElapsed = toc;
disp(timeElapsed)

tic
result = fft(y1(1:256));
timeElapsed = toc;
disp(timeElapsed)

t = 0:0.01:10-0.01;
x = sin(2*pi*10*t);
xdft = fft(x);
% plot(abs(xdft))


x = zeros(1, 10);
x(5) = 1;
res = conv(x, sinc(100));
plot(res);
