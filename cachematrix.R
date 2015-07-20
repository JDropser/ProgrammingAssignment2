## Together these functions optimize the inversion of a matrix by caching the inverted matrix
## so that it can be accessed without having to recompute the inversion. 

## This function creates a special "matrix" object that can cache its inverse.
## The object is really a list of functions that:
## Set the matrix to be inverted into cache
## Get the matrix to be inverted from cache
## Get the inverted matrix from cache
## Set the inverted matrix in cache

makeCacheMatrix <- function(x = matrix()) {
  invtd <- NULL
  set <- function(y) {
    x <<- y
    invtd <<- NULL
  }
  get <- function() x
  setinvtd <- function(solve) invtd <<- solve
  getinvtd <- function() invtd
  list(set = set, get = get,
       setinvtd = setinvtd,
       getinvtd = getinvtd)
}


## This function checks to see if the inverted matrix is already available from cache.  
## If not, the function gets the matrix to be inverted, inverts the matrix and caches the inverted matrix
## The cached inversion is returned.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invtd<-x$getinvtd
  #check to see if invtd matrix is in cache.
  if (!is.null(invtd)) {
       message("getting inverted matrix from cache")
       return(invtd)
  }
  #if inverted matrix not available, get the matrix to invert from cache
  mtoinv<-x$get()
  # invert the matrix and store in cache
  invtd<-solve(mtoinv)
  x$setinvtd(invtd)
  invtd
}
