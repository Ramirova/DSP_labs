
input = [1; 5; 5; 4; 5; 3; 1; 1; 1; 5; 5; 4; 9; 8; 8; 4; 4; 6; 6; 5; 4; 3; 1; 5; 5; 4; 2; 1];
%input = [1]
fs = 8000; 
signal = [];
pause_duration = 0.2;
signal_duration = 0.1;
for i=1:length(input)
    new_signal = generateDTMF(input(i), signal_duration, fs, 0);
    pause = generateDTMF(-1, 0, fs, pause_duration);
    signal = [signal; pause; new_signal];
end;
player = audioplayer(signal, fs, 8);
play(player);
s = spectrogram(signal);
spectrogram(signal,'yaxis')

% Decoding generated signal 
keypads = ['1','2','3','A'; 
    '4','5','6','B'; 
    '7','8','9','C'; 
    '*','0','#','D'];
frequences = [697; 770; 852; 941; 1209; 1336; 1477; 1633]; %1*8 vector of frequences

result = []
start_index = 1 
finish_index = (signal_duration+pause_duration)*fs;
for j = 1:length(input)
    n = [];
    
    start_index = (signal_duration+pause_duration)*(j-1)*fs+1;
    finish_index = (signal_duration+pause_duration)*(j)*fs;
    for i = 1:length(frequences)
        current_signal = signal(start_index:finish_index);
        detected = dtmfscor(current_signal, frequences(i), 100, fs);
        n = [n detected];
    end
    peaks = find(n==1); %indexes where elements of n are equal to 1
    row = peaks(1);
    col = peaks(2)-4;
    result = [result, keypads(row,col)];
end;
disp(result)