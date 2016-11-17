## How to use
#
# > my_matrix <- getInvertibleMatrix()
# > special_matrix <- makeCacheMatrix(my_matrix)
# > cacheSolve(special_matrix)
#      [,1] [,2]
# [1,]   -1  1.5
# [2,]    1 -1.0
# > cacheSolve(special_matrix)
# getting cached data
#      [,1] [,2]
# [1,]   -1  1.5
# [2,]    1 -1.0
# >

## makeCacheMatrix() creates a function that use cacheSolve() t6o get the invertible matrix

## Creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}

## Calculates the inverse of the  "matrix" object created by makeCacheMatrix() function beafore
## If it is already cached use that cached value matrix.
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
		
## Function added just to take a invertible matrix to test the other functions		
getInvertibleMatrix <- function(){
	matrix(c(2,2,3,2),2,2)
}

