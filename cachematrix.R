## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a ## matrix rather than computing it repeatedly. The following functions calculate and cache the inverse of a matrix.

## makeCacheMatrix creates a list containing a function to 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix

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


## The following function calculates the inverse of the matrix created with the above function. If the inverse has ## already been calculated it gets the inverse from the cache and skips the computation. Otherwise, it calculates ## the inverse of the matrix and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
        
}
