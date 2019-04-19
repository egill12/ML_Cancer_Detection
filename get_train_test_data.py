'''
Author: Edward Gill
Sutdent Id: 13131340

This file gets the training and test data to be used in the jupyter notebooks
'''
import pandas as pd
import numpy as np
import sklearn as sk
from matplotlib import pyplot as plt
csv_path = "C:/Users/edgil/Documents/Masters/machine_learning/Coursework/video_data"



def get_data(data_list):
    '''
    Get the training data as needed
    :return: DataFrame containing all the neccessary datafiles
    '''
    i = 0
    for element in data_list:
        train_data = pd.read_csv(csv_path + element, header=None, sep="\t")
        if i == 0:
            master_train = train_data
        else:
            #print("getting data")
            #print("%s" %str(len(master_train)))
            master_train = pd.concat([master_train, train_data], axis=0, ignore_index=True)
            #print("data processed: length = %s" % str(len(master_train)))
        i =+ 1
    return master_train

def main():
    get_data([r"/1trn.SSV", r"/2trn.SSV" , r"/3trn.SSV", r"/4trn.SSV", r"/5trn.SSV", r"/6trn.SSV", r"/7trn.SSV"])

if __name__ == "__main__" :
    main()
