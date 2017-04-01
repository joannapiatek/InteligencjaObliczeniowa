library(GA)
library(plot3d)
easom <- function(x1,x2)
{  
  
	
  fact1 <- -cos(x1)*cos(x2)
  fact2 <- exp(-(x1-pi)^2-(x2-pi)^2)
	
  y <- fact1*fact2
  return(y)
}


x1 <- x2 <- seq(-30, 30, by = 0.1)
f <- outer(x1, x2, easom)
persp3D(x1, x2, f, theta = 50, phi = 20)

GA <- ga(type = "real-valued", 
         fitness =  function(x) -easom(x[1], x[2]),
         min = c(-12,-12 ), max = c(10, 10), 
         popSize = 100, maxiter = 1000, run = 200)
summary(GA)