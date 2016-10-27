### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:
  
  # Replace all of the spaces in your movie title with plus signs (+)
Movie <- function(input.movie) {
movie.no.spaces <- gsub(" ","+", input.movie)
  
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  
base <- "https://api.nytimes.com/svc/movies/v2/reviews/search.json?"
query <- paste0(base, "query=", movie.no.spaces, "&api-key=f9df295994fd488fbf387b75ed16ae29")
  
  # Request data using your search query

data <- as.data.frame(fromJSON(query))
  
  
  # What type of variable does this return?

  # Flatten the data stored in the `$results` key of the data returned to you
  
  data <- flatten(data)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  
  movie.headline <- data$results.headline[1]
  movie.short.summary <- data$results.summary_short[1]
  movie.url.to.article <- data$results.link.url[1]
  
  # Return an list of the three ieces of information from above
  list <- c(movie.headline, movie.short.summary, movie.url.to.article)
  return(list)
}
# Test that your function works with a movie of your choice
Movie('The Hunger Games')
