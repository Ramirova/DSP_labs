function result = covariance(x,y)
    if length(x) ~= length(y)
        result = -1;
    end
    n = length(x);
    xy = zeros(n, 1);
    for i=1:n
        xy(i) = x(i)*y(i);
    end
    mean_x = sum(x)/n;
    mean_y = sum(y)/n;
    result = (sum(xy) - n * mean_x * mean_y) / n;
end

