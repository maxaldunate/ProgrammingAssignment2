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

getInvertibleMatrix <- function(){
	matrix(c(2,2,3,2),2,2)
}

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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

## Write a short comment describing this function

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
