## Put comments here that give an overall description of what your
## functions do

##MakeCacheMatrix is a function that sets and gets the inverse of the matrix so that it can be recalled anytime needed

makeCacheMatrix <- function(x = matrix()) { #set the main argument of the function to be a matrix
        inv<<- NULL # sets the inverse of matrix as Null
        set <- function(y) {
                y <<- x #if a new matrix is set in the parent enviroment, this function assigns the new matrix to (x)
                inv <<- NULL #Resets inverse
        }
        get <- function() {
                x # gets the matrix
                 }
        setinverse <- function(inverse) inv <<- inverse #assigns the inverse of the matrix in the parent enviroment
        getinverse <- function() {
                inv #returns inverse of matrix when needed
                } 
        
        list(set= set, get= get, setinverse= setinverse, getinverse= getinverse)

}


## CacheSolve finds the inverse of the matrix and stores it in cache to be recalled later
## if the matrix changes in parent enviroment, CacheSolve finds the new inverse and stores it
## if matrix is constant, Cachesolve recalls inverse from cache

cacheSolve <- function(x, ...) {         ## Return a matrix that is the inverse of 'x'

        inv <- x$getinverse
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv) #Returns inverse if already computed before and matrix hasn't changed
        }
        data <- x$get()
        inv <- solve(data)
        x$setinverse(inv)
        inv # calculates and returns inverse if it hasn't been calculated before and stores it in cache using setinverseS
}
