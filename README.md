---
title: "README"
author: "Jay GAdrner"
date: "February 20, 2016"
output: html_document
---
 Creating a function "makeCacheMatrix" to cache an input matrix
 and to set some functions within the scope of this 
 mackeCacheMatrix function; namely, Set, Get, SetInverse and
 GetInverse to call from outside of this function

Testing my functions...
 The makeCacheMatrix function puts a matrix into the Global 
 Environment Cache. 
> my_matrix <- makeCacheMatrix(matrix(c(10,20,30,40),2,2))
> my_matrix$get()
     [,1] [,2]
[1,]   10   30
[2,]   20   40

Checking that $set and $get work...
> my_matrix$set(matrix(c(2:5), 2, 2))
> my_matrix$get()
     [,1] [,2]
[1,]    2    4
[2,]    3    5

Checking that the NULL gets set on $getInverse
> my_matrix$getInverse()
NULL

Checking that cacheSolve works 
> cacheSolve(my_matrix)
     [,1] [,2]
[1,] -2.5    2
[2,]  1.5   -1

Checking to see that on the second call (now out of scope) 
  the cached matrix gets called and so the cacheSolve uses 
that data
> cacheSolve(my_matrix)
getting cached data
     [,1] [,2]
[1,] -2.5    2
[2,]  1.5   -1

 Getting the inverse of the matrix again

> my_matrix$getInverse()
     [,1] [,2]
[1,] -2.5    2
[2,]  1.5   -1

 Calling $set and $get again for my_matrix to repopulate it
 with different values

> my_matrix$set(matrix(c(3:6), 2, 2))
> my_matrix$get()
     [,1] [,2]
[1,]    3    5
[2,]    4    6

Checking that the NULL gets set on $getInverse
> my_matrix$getInverse()
NULL

Checking that cacheSolve works on the new values
> cacheSolve(my_matrix)
     [,1] [,2]
[1,]   -3  2.5
[2,]    2 -1.5

 Checking again to see that on the second call (now out of
 scope) the cached matrix gets called and so the cacheSolve
 uses that data
> cacheSolve(my_matrix)
getting cached data
     [,1] [,2]
[1,]   -3  2.5
[2,]    2 -1.5

  And checking again to see that the inverse is indeed the same
> my_matrix$getInverse()
     [,1] [,2]
[1,]   -3  2.5
[2,]    2 -1.5 
