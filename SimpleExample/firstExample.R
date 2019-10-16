#Calling lpsolve library
library(lpSolve)

# We are gonna to solve the following problem:
##############

#Maximize x[1] + 2*x[2]
#subject to
#x[1]+x[2] <= 4
#x[1] <= 2
#x[2] <= 3
#x[1] > 0,x[2] > 0

##############

#Set the coefficients of the decisions variables
C <- c(1,2)

#Create the constrains matrix
A <- matrix(c(1,1,1,0,0,1), nrow = 3, byrow = TRUE)

#Write the limits of the constraints
B <- c(4,2,3)

#Direction of the constraints
cons_direction <- c("<=","<=","<=")

#Find the optimal value
optimum <- lp(direction = "max",
              objective.in = C,
              const.mat = A,
              const.dir = cons_direction,
              const.rhs = B,
              all.int = T)

#Print status
print(optimum$status)

#Display the optimum
best_sol <- optimum$solution
names(best_sol) <- c("x[1]", "x[2]")
print(best_sol)

#Cheche the value of objective function at optimal point
print(paste("Total: ", optimum$objval, sep = ""))