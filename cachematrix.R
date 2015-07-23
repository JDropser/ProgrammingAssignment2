## Together these functions optimize the inversion of a matrix by caching the inverted matrix
## so that it can be accessed without having to recompute the inversion. 

## This function creates a special "matrix" object that can cache its inverse.
## The object is really a list of functions that:
## Set the matrix to be inverted into cache
## Get the matrix to be inverted from cache
## Get the inverted matrix from cache
## Set the inverted matrix in cache

makeCacheMatrix <- function(x = matrix()) {
  invx <- NULL
  set <- function(y) {
    x <<- y
    invx <<- NULL
  }
  get <- function() x
  setinvt <- function(slvmat) invx <<- slvmat
  getinvt <- function() invx
  list(set = set, get = get,
       setinvt = setinvt,
       getinvt = getinvt)
}


## This function checks to see if the inverted matrix is already available from cache.  
## If not, the function gets the matrix to be inverted, inverts the matrix and caches the inverted matrix
## The cached inversion is returned.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of the matrix from the set function in makeCacheMatrix
        ## x is a list of functions from makeCacheMatrix
  invtd<-x$getinvt()
  #check to see if invtd matrix is in cache.
  if (!is.null(invtd)) {
       message("getting inverted matrix from cache")
       return(invtd)
  }
  #if inverted matrix not available, get the matrix to invert from cache
  mtoinv<-x$get()
  # invert the matrix and store in cache
  invtd<-solve(mtoinv)
  x$setinvt(invtd)
  invtd
}
