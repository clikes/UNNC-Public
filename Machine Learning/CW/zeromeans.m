function result = zeromeans(data)
    [~, col] = size(data)
    result = data;
    for i = 1:col
       result(1:end,i) =  result(1:end,i) - mean(result(1:end,i));
    end
end