function result = chorus(signal, Fs, voices)
    delay = 0.2; 
    alpha = 0.65; 
    D = delay*Fs;  
    min_delay = 1;
    result = zeros(size(signal));  
    result(1:D) = signal(1:D);  
    
    for j=1:voices
        d = floor(min_delay+rand(1,1)*(D-min_delay));
        for i=d+1:length(signal)  
            result(i) = signal(i) + alpha*signal(i-d);  
        end
    end  
end

