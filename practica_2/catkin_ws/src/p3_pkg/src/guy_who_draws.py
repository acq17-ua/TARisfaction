#!/usr/bin/env python3
import sys
import matplotlib.pyplot as plt
import pandas as pd

def parse_files(file_names):

    runs = list()

    for file in file_names:

        df = pd.read_csv(file)
        df.plot.scatter(0,1)

    plt.show()

if __name__ == "__main__":
    
    file_names = sys.argv[1:]
    
    

