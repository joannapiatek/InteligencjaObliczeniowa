library(GA)
library(plot3d)



x1 <- x2 <- seq(-10, 10, by = 0.1)
f <- outer(x1, x2, easom)
persp3D(x1, x2, f, theta = 50, phi = 10)

GA <- ga(type = "real-valued", 
         fitness =  function(x) -easom(x[1], x[2]),
         min = c(-12,-12 ), max = c(10, 10), 
         popSize = 100, maxiter = 1000, run = 200)
summary(GA)


easom2 <- function(x1,x2)
{  
  
	
  return(goTest(fnName="Easom", par=c(x1,x2)))
}