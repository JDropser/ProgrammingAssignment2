## Together these functions optimize the inversion of a matrix by caching the inverted matrix
## so that it can be accessed without having to recompute the inversion. 

## This function creates a special "matrix" object that can cache its inverse.
## The object is really a list of functions that:
## Set the matrix to be inverted
## Get the matrix to be inverted
## Get the inverted matrix
## Set the inverted matrix

makeCacheMatrix <- function(x = matrix()) {

}


## This function checks to see if the inverted matrix is already available from cache.  
## If not, the function gets the matrix to be inverted, inverts the matrix and caches the inverted matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
