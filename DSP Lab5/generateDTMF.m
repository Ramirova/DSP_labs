function result = generateDTMF(digit, duration, fs, silence_duration) 
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    lfg = [697 770 852 941]; % Low frequency group
    hfg = [1209 1336 1477];  % High frequency group
    f  = [];
    for c=1:4,
        for r=1:3,
            f = [ f [ lfg(c); hfg(r) ] ];
        end
    end
    N = fs * duration; 
    t   = (0:N-1)/fs; % 800 samples at Fs
    pit = 2*pi*t;
    if digit ~= -1 
        result = sum(sin(f(:,digit)*pit))';
    else 
        N = fs * silence_duration; 
        result = zeros([N, 1]);
    end 
end

