function score = f1(labels, predictlabels)
    [row, ~] = size(labels);
    corrects = 0;
    for i = 1:row
        if labels(i) == predictlabels(i)
            corrects = corrects + 1;
        end
    end
    
    precision = corrects/row;
    recall = 
end