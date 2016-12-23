cacheSolve <- function(x, ...) {
  ## attempt to get the inverse of the matrix stored in cache
  cache <- x$getInverse()
  
  # return inverted matrix from cache if it exists
  # else create the matrix in working environment
  if (!is.null(cache)) {
    message("getting cached data")
    
    # display matrix in console
    return(cache)
  }
  
  # create matrix since it does not exist
  matrix <- x$get()
  
  # make sure matrix is square and invertible
  # if not, handle exception cleanly
  tryCatch( {
    # set and return inverse of matrix
    cache <- solve(matrix, ...)
  },
  error = function(e) {
    message("Error:")
    message(e)
    
    return(NA)
  },
  warning = function(e) {
    message("Warning:")
    message(e)
    
    return(NA)
  },
  finally = {
    # set inverted matrix in cache
    x$setMatrix(cache)
  } )
  
  # display matrix in console
  return (cache)
}