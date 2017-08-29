# Upper Confidence Bound

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Ads_CTR_Optimisation.csv')

# Implementing UCB
import math

# number of tryes
N = 10000
# number of versions of ad
d = 10
ads_selected = []
numbers_of_selections = [0] * d
sums_of_rewards = [0] * d
for n in range(0, N):
     ad = 0
     max_upper_bound = 0
     for i in range(0, d):
          if (numbers_of_selections[i] > 0):
               average_reward = sums_of_rewards[i] / numbers_of_selections[i]
               delta_i = math.sqrt(3/2 * math.log(n + 1) / numbers_of_selections[i])
               upper_bound = average_reward + delta_i
          else:
               upper_bound = 1e400
          if upper_bound > max_upper_bound:
               max_upper_bound = upper_bound
               ad = i