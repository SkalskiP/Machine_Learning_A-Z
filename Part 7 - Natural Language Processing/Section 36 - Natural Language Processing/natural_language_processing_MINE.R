# Natural Language Processing

# Importing the dataset
dataset = read.delim('Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

# Cleaning the texts 
# install.packages('tm')
# install.packages('SnowballC')
library(tm)
library(SnowballC)
corpus = VCorpus(VectorSource(dataset$Review))
# Lower case
corpus = tm_map(corpus, content_transformer(tolower))
# Remowing numbers
corpus = tm_map(corpus, removeNumbers)
# Removing punctuations
corpus = tm_map(corpus, removePunctuation)
# Removing un relevant words
corpus = tm_map(corpus, removeWords, stopwords())
# Stemming
corpus = tm_map(corpus, stemDocument)
# Removing extra spaces
corpus = tm_map(corpus, stripWhitespace)
