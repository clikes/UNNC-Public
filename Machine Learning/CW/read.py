import numpy as np
import sklearn.decomposition as sl
import pandas as pd
import matplotlib.pyplot as plt
a = np.fromfile("H:/UNNC-Public/Machine Learning/CW/wdbc.data",dtype=np.float)
buffer = np.loadtxt("H:/UNNC-Public/Machine Learning/CW/wdbc.data", dtype=np.str, delimiter=",")
data = buffer[:, 2:].astype(np.float)
row = data.shape[0]
col = data.shape[1]
testing = data[:169, :]
training = data[169:, :]
PCA = sl.PCA(n_components=3)
newdata = PCA.fit_transform(training)

# test = pd.read_csv(newdata)
# df = pd.read_csv('H:/UNNC-Public/Machine Learning/CW/wdbc.data', header=0)
df = pd.DataFrame(newdata)
df.hist()
plt.show()
# print("123213")