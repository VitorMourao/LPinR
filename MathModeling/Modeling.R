# Calling lpsolve library
library(lpSolve)

##########
print("Example 10")
## EXAMPLE 10 ##
#Maximize 90x[1] + 100x[2]
#x[1]+ x[2] <= 500
#x[1]+ 1.4x[2] <= 400
#90x[1] + 100x[2] >= 25000
#           x[2] >= 50
#8x[1] - 2.1x[2] >= 67
#x[1] > 0, x[2] > 0

##########

#Set the costs
C <- c(90,100)

#Set the constraints matrix
A <- matrix(c(1,1,
              1,1.4,
              90,100,
              0,1,
              8,-2.1), nrow = 5,byrow = TRUE)

#Set the limits
B <- c(500,400,25000,50,67)

#Set directions
Direction <- c("<=", "<=",">=", ">=", ">=")

#Find the optimum
optimum <- lp(direction = "max", objective.in = C, const.mat = A, const.rhs = B,
              const.dir = Direction, all.int = T)

#Print status
#0 - Sucess, 2 - No feasible solution
print(paste("Status: ",optimum$status))
if (optimum$status == 2){
  print("No feasible solution")
} else{
  #Display the optimum
  print("Exists a feasible solution")
  best_sol <- optimum$solution
  names(best_sol) <- c("x[1]", "x[2]")
  print(best_sol)
  
  #Check the value of the function on optimal point
  print(paste("Total: ", optimum$objval, sep = ""))
}

cat("\n\n")
##########
print("Example 7")
## EXAMPLE 7 ##
#Maximize 90x[1] + 100x[2]
#x[1]+ x[2] <= 500
#x[1]+ 1.4x[2] <= 400
#x[1] > 0, x[2] > 0

##########

#Set the costs
C2 <- c(90,100)

#Set the constraints matrix
A2 <- matrix(c(1,1,
              1,1.4), nrow = 2,byrow = TRUE)

#Set the limits
B2 <- c(500,400)

#Set directions
Direction2 <- c("<=", "<=")

#Find the optimum
optimum2 <- lp(direction = "max", objective.in = C2, const.mat = A2, const.rhs = B2,
              const.dir = Direction2, all.int = T)

#Print status
#0 - Sucess, 2 - No feasible solution
print(paste("Status: ",optimum2$status))
if (optimum2$status == 2){
  print("No feasible solution")
} else{
  #Display the optimum
  print("Exists a feasible solution")
  best_sol2 <- optimum2$solution
  names(best_sol2) <- c("x[1]", "x[2]")
  print(best_sol2)
  
  #Check the value of the function on optimal point
  print(paste("Total: ", optimum2$objval, sep = ""))
}

cat("\n\n")
##########
print("Example 9")
## EXAMPLE 9 ##
#Maximize 90x[1] + 100x[2]
#x[1]+ x[2] <= 500
#x[1]+ 1.4x[2] <= 400
#90x[1] + 100x[2] >= 25000
#           x[2] >= 50
#x[1] > 0, x[2] > 0

##########

#Set the costs
C3 <- c(90,100)

#Set the constraints matrix
A3 <- matrix(c(1,1,
               1,1.4,
               90,100,
               0,1), nrow = 4,byrow = TRUE)

#Set the limits
B3 <- c(500,400)

#Set directions
Direction3 <- c("<=", "<=", ">=", ">=")

#Find the optimum
optimum3 <- lp(direction = "max", objective.in = C3, const.mat = A3, const.rhs = B3,
               const.dir = Direction3, all.int = T)

#Print status
#0 - Sucess, 2 - No feasible solution
print(paste("Status: ",optimum3$status))
if (optimum3$status == 2){
  print("No feasible solution")
} else{
  #Display the optimum
  print("Exists a feasible solution")
  best_sol3 <- optimum3$solution
  names(best_sol3) <- c("x[1]", "x[2]")
  print(best_sol3)
  
  #Check the value of the function on optimal point
  print(paste("Total: ", optimum3$objval, sep = ""))
}