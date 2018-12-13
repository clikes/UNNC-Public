import numpy as np
from sklearn.decomposition import PCA
a = np.fromfile("wdbc.data",dtype=np.float)
buffer = np.loadtxt("wdbc.data", dtype=np.str, delimiter=",")
data = buffer[:, 2:].astype(np.float)
row = buffer.shape[0]
col = buffer.shape[1]
testing = buffer[:169, :]
training = buffer[169:, :]

pca = PCA(n_components=3)
