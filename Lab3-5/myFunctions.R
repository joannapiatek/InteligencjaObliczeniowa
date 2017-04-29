myMutation <- function (ga_object, parent) 
{
  mutate <- parent <- as.vector(ga_object@population[parent,])
  parLen <- length(parent)
  
  all <- c(1:parLen)
  excluded <- sample(1:parLen/4, size = 1)
  indexesToMutate <- all[!excluded]
  mutate[indexesToMutate] <- mutate[indexesToMutate] - rnorm(n=1, m=0, sd=3)
  
  return(mutate)
} 


mySelection <- function (ga_object, parent)
{
  prob <- abs(
    cos(ga_object@fitness)/(sin(ga_object@fitness))
  )
  
  sel <- sample(1:ga_object@popSize, size = ga_object@popSize, 
                
                prob = pmin(prob, 1, na.rm = TRUE),
                
                replace = TRUE)
  
  out <- list(population = ga_object@population[sel,,drop=FALSE],
              fitness = ga_object@fitness[sel])
  return(out)
}


myCrossover <- function (x,i)
{
  return(0)
}