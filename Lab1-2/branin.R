branin <- function(x1,x2, a=1, b=5.1/(4*pi^2), c=5/pi, r=6, s=10, t=1/(8*pi))
{
  term1 <- a * (x2 - b*x1^2 + c*x1 - r)^2
  term2 <- s*(1-t)*cos(x1)
	
  y <- term1 + term2 + s
  return(y)
}


# Rysowanie wykresu funkcji branin
x1 <- x2 <- seq(-5, 15, by = 1)
f <- outer(x1, x2, branin )
persp3D(x1, x2, f, theta = 50, phi = 20)


