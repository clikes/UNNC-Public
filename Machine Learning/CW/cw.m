wdbc = csvread("H:/UNNC-Public/Machine Learning/CW/wdbc.data", 0,2);
traindata = wdbc(1:400,1:end);
testdata = wdbc(401:end,1:end);
file = fopen("H:/UNNC-Public/Machine Learning/CW/wdbc.data");
buffer = textscan(file, '%*d %s %*[^\n]', 'delimiter', ',');
labels = buffer{1,1};
trainlabels = labels(1:400,1:end);
testlabels = labels(401:end,1:end);
[coeff,score,latent] = pca(traindata);
pca3 = score(1:end,1:3);
pca5 = score(1:end,1:5);
pca7 = score(1:end,1:7);
pca9 = score(1:end,1:9);
pca11 = score(1:end,1:11);
pcas = {pca3 pca5 pca7 pca9 pca11};
indices = crossvalind('Kfold',400,10);
models = cell(1,5);
predicelabels = cell(1,5);
for pi = 1:5
    rng(1);
    for i = 1:10
        cvmodel = fitctree(pcas{1,pi}(indices == i),trainlabels(indices == i));
    end
    %todo calculate precision and recall
    models{1,pi} =  fitctree(pcas{1,pi},trainlabels);
end
    predicelabels{1,pi} = predict(cvmodel{1,pi},testdata);