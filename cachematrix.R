## Creating a function to cache an input matrix and to set some
## functions within the scope of this mackeCacheMatrix function, 
## namely, Set, Get, SetInverse and GetInverse
## to call from outside of this function

## Creating the cached matrix
  makeCacheMatrix <- function(x = matrix()) {
## Instantiate the inverseMatrix by assigning it to "NULL"    
    inverseMatrix <- NULL
    
## Create the function to assign the inverseMatrix variable
    set <- function(y) {
      x <<- y
      inverseMatrix <<- NULL
    }
## create the function to do the matrix inversion
    get <- function() x
    setInverse <- function(inverse) inverseMatrix <<- inverse
    getInverse <- function() inverseMatrix
    
## Create the list of functions to call on the Cached matrix    
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
  }

## The cacheSolve function takes in a matrix and returns the
##  Inverse of the matrix

cacheSolve <- function(x, ...) {
## getInverse on the input matrix 'x'
  inverseMatrix <- x$getInverse()
## If this results in a NULL value, return the inverseMatrix variable
  if (!is.null(inverseMatrix)) {
    message("getting cached data")
    return(inverseMatrix)
  }
## If it is not NULL, then run the Solve function on the matrix  
  matrixSolved <- x$get()
  inverseMatrix <- solve(matrixSolved, ...)
  x$setInverse(inverseMatrix)
  inverseMatrix
}
