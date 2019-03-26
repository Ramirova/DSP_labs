clear;
filename = 'Flying.ogg';
[y1,fs1] = audioread(filename);

chorused_signal = chorus(y1, fs1, 15);
player = audioplayer(chorused_signal, fs1, 8);
play(player);