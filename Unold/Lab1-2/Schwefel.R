library(GA)
library(plot3d)


x1 <- x2 <- seq(-8, 5, by = 1)
f <- outer(x1, x2, camel6)
persp3D(x1, x2, f, theta = 50, phi = 10)


camel6 <- function(x1,x2)
{
  term1 <- (4-2.1*x1^2+(x1^4)/3) * x1^2
  term2 <- x1*x2
  term3 <- (-4+4*x2^2) * x2^2
	
  y <- term1 + term2 + term3
  return(y)
}


