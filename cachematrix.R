# Functions to cache the inverse of a matrix. makeCacheMatrix returns a list 
# that contains functions to set and get the value of a matrix, and functions to 
# set and get the value of the inverse of that matrix. cacheSolve takes the list
# generated by makeCacheMatrix and returns the inverse of the matrix from the 
# cache if it has already been calculated, otherwise it calculates and stores it
#in the cache

# makeCacheMatrix takes a matrix as its input, and sets i (the variable used to
# store the inverse of the matrix) to NULL initially. It defines functions: 
# "set" which caches the input matrix y in x, "get" which returns the value of 
# x, "setinverse" which takes an input "inverse" and caches its value in i, and 
# "getinverse" which returns the value of i. These functions are stored and 
# returned in a list.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i

    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# This function takes an input "x", which is a list generated by the
# makeCacheMatrix function, and ..., which can contain other arguments to be 
# used in the solve function. It sets i to the value retrieved from the input
# list using getinverse(), which will be NULL unless it has been previously 
# calculated. If it isn't null, we return i from the cache, otherwise we get
# the matrix to be inverted from the input using the get() function, before
# calculating its inverse using solve() and then caching it using setinverse() 
# and finally returning it as the output of the function
cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
