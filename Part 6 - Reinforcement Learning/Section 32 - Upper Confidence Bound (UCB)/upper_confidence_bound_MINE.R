# Upper Confidence Bound

# Importing the dataset
dataset = read.csv('Ads_CTR_Optimisation.csv')

# Implementing UCB

# Total number of rounds
N = 10000
# Total number of ads
d = 10
# Vector containing ads that were selected each round
ads_selected = integer(0)

# Creating vector containing only zeros, this vector will hold number of selections for each ad
numbers_of_selections = integer(d)
# Creating vector containing only zeros, this vector will hold sum of rewards for each ad
sums_of_rewards = integer(d)
total_reward = 0
for (n in 1:N) {
  ad = 0
  # Variable holding value of maxiumum upper bound
  max_upper_bound = 0
  for (i in 1:d) {
    if (numbers_of_selections[i] > 0) {
      # The average reward of ad i up to round n
      average_reward = sums_of_rewards[i] / numbers_of_selections[i]
      # Upper bound of the confidence interval
      delta_i = sqrt(3/2 * log(n) / numbers_of_selections[i])
      upper_bound = average_reward + delta_i
    } else {
      upper_bound = 1e400
    }
    # If we find new maximum upperbound
    if (upper_bound > max_upper_bound) {
      # We save new max upper bound value
      max_upper_bound = upper_bound
      # We save index of ad with maximum upper bound
      ad = i
    }
  }
  # Saving which ad was selected in specific round
  ads_selected = append(ads_selected, ad)
  # Updating vector that holds number of selections for each ad
  numbers_of_selections[ad] = numbers_of_selections[ad] + 1
  # Checking if add will be selected
  reward = dataset[n, ad]
  # Updatind vector holding rewards for each ad
  sums_of_rewards[ad] = sums_of_rewards[ad] + reward
  total_reward = total_reward + reward
}

# Visualising the results - Histogram
hist (ads_selected,
      col = 'blue',
      main = 'Histogram of ads selections',
      xlab = 'Ads',
      ylab = 'Number of times each ad was selected')