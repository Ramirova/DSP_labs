function result = correlation(x,y)
    if length(x) ~= length(y)
        result = -1;
    end
    result = covariance(x,y) / (standart_deviation(x)*transpose(standart_deviation(y)));
end
