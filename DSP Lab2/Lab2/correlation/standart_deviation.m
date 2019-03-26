function result = standart_deviation(x)
    if length(x) == 0
        result = 0;
    end
    n = length(x);
    mean_x = sum(x)/n;
    variance = 0;
    for i=1:n
        variance = variance + (x(i) - mean_x)^2;
    end
    variance = variance / n;
    result = variance.^0.5;
end
