function result = make_echo(input,fs,shifting_delay,gain,replicas)
    samples = shifting_delay * fs;
    delay_samples = floor(samples);
    result = [input; zeros(delay_samples,1)];
    for i=1:2:replicas
        result = [result; input * gain^(i+1)];
        result = [result; zeros(delay_samples,1)];
    end
end

