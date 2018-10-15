import numpy as np
import struct
import tensorflow as tf
def loadImage(filename):
    try:
        file = open(filename , "rb");
        buffer = file.read();
        header = struct.unpack_from(">IIII", buffer, 0); # >: big endian 
        numOfImage = header[1];
        numOfRows = header[2];
        numOfColumn = header[3];

        offset = struct.calcsize(">IIII")
        bits = numOfImage * numOfRows * numOfColumn;

        bitFMT = ">" + str(bits) + "B"

        imgs = struct.unpack_from(bitFMT, buffer , offset)

        imgs = np.reshape(imgs, (numOfImage, numOfRows * numOfColumn));
        return imgs, header
        
    finally:
        file.close();
       
    return;

def loadLabel(filename):
    try:
        file = open(filename , "rb");
        buffer = file.read();
        header = struct.unpack_from(">II", buffer, 0); # >: big endian 
        numOfLabel = header[1];

        offset = struct.calcsize(">II")

        bitFMT = ">" + str(numOfLabel) + "B"

        lables = struct.unpack_from(bitFMT, buffer , offset)
        print(lables[1])
        return lables, header
    finally:
        file.close();


imgs, header = loadImage("H:/UNNC-Public/Machine Learning/Lab1/train-images-idx3-ubyte");
lables, lablesheader = loadLabel("H:/UNNC-Public/Machine Learning/Lab1/train-labels-idx1-ubyte");


print(np.reshape(imgs[1], (28,28)))
#a=np.array([1,2,3,4,5,6,7,8,9,10,11,12])
#b=np.reshape(a,(2,-1))
#c=a.reshape(2,-1)
#print( 'b=')
#print(b)
#print("c=") 
#print (c)