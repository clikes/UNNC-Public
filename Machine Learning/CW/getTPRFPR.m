function [TPR, FPR] = getTPRFPR(labels, predictlabels)
    ConfusionMat = confusionmat(categorical(labels), categorical(predictlabels));
    TP = ConfusionMat(1,1);
    FP = ConfusionMat(2,1);
    TN = ConfusionMat(2,2);
    FN = ConfusionMat(1,2);
    TPR = TP / (TP + FN);
    FPR = FP / (FP + TN);
end