clear;

filename = 'Knock.ogg';
%filename = 'Flying.ogg'
file = 'Flying.ogg';
[y1,fs1] = audioread(filename);

delay = 0.05;
gain = 0.5;
replicas = 5;

echoed_signal = make_echo(y1, fs1, delay, gain, replicas);
player=audioplayer(echoed_signal, fs1, 8);
play(player);

echo_removed = remove_echo(y1, fs1, echoed_signal, delay, gain, replicas);
%player = audioplayer(echo_removed, fs1, 8);
%play(player);

%Computation of auto-correlation
time_reversed_sygnal = fliplr(echoed_signal);
autocorrelation = conv(echoed_signal, time_reversed_sygnal);
plot(autocorrelation);

[pks, locs] = findpeaks(autocorrelation,'MinPeakDistance',length(y1));
N = locs(2) - locs(1);
delay_autocorr = (N - length(y1)) / fs1;

%Removing echo with delay computed using auto-correlation
echo_removed_autocorr = remove_echo(y1, fs1, echoed_signal, delay_autocorr, gain, replicas);
%player = audioplayer(echo_removed_autocorr, fs1, 8);
%play(player);


