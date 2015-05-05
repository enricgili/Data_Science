## Second Assignment for Coursera's 'R Programming' course
## The following functions store in cache the inverse of a matrix

## makeCacheMatrix function creates a matrix object that stores a matrix in the cache
## This matrix object also contains functions to retrieve or set both the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y){
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
              setinverse = setinverse,
              getinverse = getinverse)
}


## Cachesolve calculates the inverse of a matrix object (returned by makeCacheMatrix())
## If the inverse has been calculated already before, then the function gets the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}
