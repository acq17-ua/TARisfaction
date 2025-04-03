#!/usr/bin/env python3
import sys
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

def parse_files(file_names):

    runs = list()

    for file in file_names:

        points = np.genfromtxt(file, delimiter=',')
        plt.scatter(points[:,0],points[:,1])

        #df = pd.read_csv(file)
        #df.plot.scatter(0,1)
        #df.plot(kind='scatter', x=0, y=1, color="green")
        #df.scatter(x=0, y=0)

    plt.show()

if __name__ == "__main__":
    
    file_names = sys.argv[1:]
    file_names = [ "plots/plot_"+str(i) for i in range(10) ]
    print(file_names)
    parse_files(file_names) 
    

