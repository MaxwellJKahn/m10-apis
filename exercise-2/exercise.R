### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd('~/Desktop/Info/m10-apis/exercise-2/')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist

top.artist <- function(artist) {
  base <- 'https://api.spotify.com/v1/'
  search <- paste0('search?q=',artist)
  type <- '&type=artist'
  query_url <- paste0(base, search, type)
  
  returned.search <- fromJSON(query_url)
  artist.id <- returned.search$artists$items$id[1]
  
  get.top.tracks.url <- paste0(base,'artists/',artist.id,'/top-tracks','?country=US')
  returned.search.2 <- fromJSON(get.top.tracks.url)

  top.songs <- returned.search.2$tracks$name
  return(top.songs)
}

# What are the top 10 tracks by Nelly?

top.Nelly <- top.artist('Nelly')
top.Nelly



### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

