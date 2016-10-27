### Exercise 3 ###
library(jsonlite)
library(dplyr)
# Use the `load` function to load in the nelly_tracks file.  That should make the data.frame
# `top_nelly` available to you
setwd('~/Desktop/Info/m10-apis/exercise-3/')

load('nelly_tracks.Rdata')

nelly.data <- as.data.frame(top.nelly)

# Use the `flatten` function to flatten the data.frame -- note what differs!

new.nelly.data <- flatten(nelly.data)

# Use your `dplyr` functions to get the number of the songs that appear on each albumt

  num.per.album <-  new.nelly.data %>%
                    group_by(album.name) %>%
                    summarize(n = n()) %>%
                    arrange(-n)

View(nelly.data)

# Bonus: perform both of the steps above in one line (one statement)
