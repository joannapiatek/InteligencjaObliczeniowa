library(globalOptTests)

branin <- function(x1,x2)
{
  return(goTest(fnName="Branin", par=c(x1,x2)))
}

