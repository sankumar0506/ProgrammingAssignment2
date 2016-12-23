## The following functions work together to create a square invertible matrix
## and make the inverse of the matrix available in the cache environment
##
## Sample run-time example included results
## > source("cachematrix.R")    load R program
## > a <- makeCacheMatrix()     create functions
## > a$set(matrix(1:4, 2, 2))   create matrix in working environment
## > cacheSolve(a)              1st run returns inverted matrix
##                              from working environment
## [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
##
## > cacheSolve(a)              2nd and subsequent runs
##                              returns inverted matrix from cache
## getting cached data          
## [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
makeCacheMatrix <- function(x = matrix()) {
  # stores the cached value
  # initialize to NULL
  cache <- NULL
  
  # create the matrix in the working environment
  set <- function(y) {
    x <<- y
    cache <<- NULL
  }
  
  # get the value of the matrix
  get <- function() x
  # invert the matrix and store in cache
  setMatrix <- function(inverse) cache <<- inverse
  # get the inverted matrix from cache
  getInverse <- function() cache
  
  # return the created functions to the working environment
  list(set = set, get = get,
       setMatrix = setMatrix,
       getInverse = getInverse)
}
