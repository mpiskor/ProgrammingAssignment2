## The functions do (I hope) what the assignment requires - makeCacheMatrix caches the matrix and returns a list of functions, with the data "built in", and the cacheSolve function either solves for the inverse and stores (caches) the result in the object passed, or reads the cached data and returns it
## 

## This function follows the example and the assignemnt description - it takes data (the default is an empty matrix) sets (function "set") the matrix one level above (<<-) - i.e. in the environment of makeCacheMatrix, defines three other helper functions (get, setinv, getinv) and returns the list of all the 4 functions

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(N){
        M <<- N
        inverse <<- NULL
    }
    get <- function() M
    setinv <- function(inv) inverse <<- inv
    getinv <- function() inverse
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## This functions gets an object returned by makeCacheMatrix, which, among others, contains the matrix to be inverted, and if there is no inverted matrix in the object it calculates the result. If the inverse has already been calculated it returns the cached value

cacheSolve <- function(x, ...) {
    inverse <- MC$getinv()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- MC$get()
    inverse <- solve(data, ...)
    MC$setinv(inverse)
    ## Return a matrix that is the inverse of 'x'
    inverse
    
}
