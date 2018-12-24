function [score, Precision, Recall] = f1(labels, predictlabels)
    ConfusionMat = confusionmat(categorical(labels), categorical(predictlabels));
    TP = ConfusionMat(1,1);
    FP = ConfusionMat(2,1);
    FN = ConfusionMat(1,2);
    Precision = TP / (TP + FP);
    Recall = TP / (TP + FN);
    score = (2 * Precision * Recall ) / (Precision + Recall);
end