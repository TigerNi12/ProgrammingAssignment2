## Compute and cache the inverse of a matrix

## makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse through getter and setter functions.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y 
    inv <<- NULL 
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
  setInverse = setInverse,
  getInverse = getInverse)
}

## cacheSolve: Computes the inverse of the special 
## matrix returned by makeCacheMatrix. If the inverse has 
## already been calculated, then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get() 
  inv <- solve(mat, ...)
  x$setInverse(inv) 
  inv
}

