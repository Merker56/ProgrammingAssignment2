## Put comments here that give an overall description of what your
## functions do

## The first function will store the matrix's inverse in cache and make a 
## Few other functions available in the global environment
## Get, set, getinv, and setinv are allowed to be called by the second function

## Write a short comment describing this function
## Creates the functions necessary for caching a matrix's inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- solve() m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function
## This function checks the cache for the inverted matrix of x.
## If the inverted matrix does not exist it will create it and return it.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
