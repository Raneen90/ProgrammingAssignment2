## This function makes a "matrix" object that can cache its inverse

## This function makes a "matrix" object
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function (y)
    x <<- y
##  Assigns matrix y to variable x in parent environment
  m <<- NULL
## Puts m in the parent environment 

  get <- function () x
## Returns function x
  setinverse <- function (inverse) m <<- inverse
  getinverse <- function () m 
##Returns cached inverse of x
  list(set = set, get = get,
          setinverse = setinverse
          getinverse = getinverse)
}

## This function computes the inverse of the "matrix"
## It checks if the inverse has already been calculared
## If calculated, then it retrieves the inverse and skips the calculation


cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
      message("getting cached data")
      return(m)
  }
  data <- $get()
  m <- solve(data, ...)
  x$setinverse(m)
}
