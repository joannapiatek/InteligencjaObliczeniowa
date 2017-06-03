#install.packages("globalOptTests", "plot3d")
library(globalOptTests)
#library(plot3d)
#library(GA)

branin <- function(x1,x2)
{
  return(goTest(fnName="Branin", par=c(x1,x2)))
}

# Rysowanie wykresu funkcji branin
#x1 <- x2 <- seq(-5, 15, by = 1)
#f <- outer(x1, x2, branin )
#persp3D(x1, x2, f, theta = 50, phi = 20)