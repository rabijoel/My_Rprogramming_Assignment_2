## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#'
## the fonction "makeCacheMatrix" creats a special "matrix", which is really
#'  a list containing a function to

# 1. set the value of the matrix
#'
# 2.get the value of the matrix
#'
# 3.set the value of the inverse
#'
# 4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#'
## This second fonction calculates the inverse of the special "matrix" created created by "makeCacheMatrix"
#'
## If the inverse are already been calculated, it gets the inverse from the cache and skips the computation
#'
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via 
#  the setinverse function.

cacheSolve <- function(x, ...) {
  
        ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
    
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
