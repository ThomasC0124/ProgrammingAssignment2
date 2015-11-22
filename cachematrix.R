# This cachematrix.R script calculates the inverse of a SQUARE matrix and cache the result for later use

## makeCacheMatrix function creates a list containing functions to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <- y
        i <- NULL
    }
    get <- function() x
    setinv <- function(inv) i <- inv
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## cacheSolve function calculates the inverse of the matrix by calling the function above:
## If the inverse has already been calculated, it gets the inverse from the cache.
## Otherwise, it calculates the inverse and sets it in the cache for later use.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinv()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(i)
    i
}
