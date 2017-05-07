library(GA)

loopRepetitions <- 30

meanGA <- function(population,iteration,crosing,mutant,mini,maxi,elit)
{
  xMax <- matrix ( 0 ,iteration,loopRepetitions)   
  xMean <- matrix ( 0 ,iteration,loopRepetitions)  
  
  # Petla do usredniania wynikow
  for ( i in 1:loopRepetitions )
  {  
    GA <- ga(type = "real-valued",
             fitness = function(x) - branin(x[1], x[2]),
             min = mini, max = maxi, pcrossover = crosing, pmutation = mutant,
             popSize = population, maxiter = iteration, elitism = elit,
             optim = TRUE
             )
    
    xMax[,i] <- GA@summary[,1]
    xMean[,i] <- GA@summary[,2]
    print(GA@solution)
  }
  return(list(max=xMax,mean=xMean))
}