## Use the following functions to cache and solve the inverse of a matrix
## This is done because solving a matrix inverse is quite costly

## Create a structure to cache a matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
          x <<- y
          m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  list(set = set, get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}


## Solve a matrix that is always invertable
## If the matrix hasn't been cached, this function inverts it and caches the result
## If the matrix is cached, then the cached inverse is returned

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setInverse(m)
        m
}
