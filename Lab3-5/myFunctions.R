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


mySelection <- function (x,i)
{
  selectedNumber <- attributes(x)$elitism
  selected <- attributes(x)$population[1:selectedNumber,]
  return(selected)
}

myCrossover <- function (x,i)
{
  return(0)
}