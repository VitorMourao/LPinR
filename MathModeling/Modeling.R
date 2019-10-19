# Calling lpsolve library
library(lpSolve)

##########

#Minimize 20x[1] + 10x[2] + 10x[3]
#2x[1]+3x[2]+7x[3] >= 10
#4x[1]+2x[2]+x[3] >= 15
#x[1]+8x[2]+x[3] >= 10
#30x[1]+x[2]+x[3] >= 2
#x[1] > 0, x[2] > 0, x[3] > 0

##########

#Set the costs
C <- c(20,10,10)

#Set the constraints matrix
A <- matrix(c(2,3,7,
              4,2,1,
              1,8,1,
              30,1,1))

#Set the limits
B <- c(10,15,10,2)

#Set directions
Direction <- c(">=", ">=",">=", ">=")

#Find the optimum
optimum <- lp(direction = "min", objective.in = C, const.mat = A, const.rhs = B,
              const.dir = Direction)

#Print status
#0 - Sucess, 2 - No feasible solution
print(paste("Status: ",optimum$status))
if (optimum$status == 2){
  print("No feasible solution")
} else{
  #Display the optimum
  best_sol <- optimum$solution
  names(best_sol) <- c("x[1]", "x[2]", "x[3]")
  print(best_sol)
  
  #Check the value of the function on optimal point
  print(paste("Total: ", optimum$objval, sep = ""))
}
