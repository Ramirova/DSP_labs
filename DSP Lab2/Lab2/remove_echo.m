function result = remove_echo(input, fs, echoed, shifting_delay,gain,replicas)
    samples = shifting_delay * fs;
    delay_samples = floor(samples);
    disp(delay_samples+length(input))
    echoes = [zeros(length(input),1); zeros(delay_samples,1)];
    for i=1:2:replicas
        echoes = [echoes; input * gain^(i+1)];
        echoes = [echoes; zeros(delay_samples,1)];
    end
    fprintf(mat2str(size(echoed)))
    fprintf(mat2str(size(echoed)))
    result = echoed - echoes;
end

