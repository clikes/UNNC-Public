function errorsrate = classificationerror(labels, predictlabels)
    count = 0;
    for i = 1:length(labels)
        if labels{i,1} ~= predictlabels{i,1}
            count = count+1;
        end
    end
    errorsrate = count/length(labels);
end