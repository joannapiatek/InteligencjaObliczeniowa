source("branin.R")
source("meanHybrid.R")

# Wywolanie funkcji
population <- 100 
iteration <- 50
crosing <- 1
mutant <- 0.1
mini <- c(-5,-5)
maxi <- c(15,15)
elit <- 50


gaResult <- meanGA(population, iteration, crosing, mutant, mini, maxi, elit)
meanRowsMax <- -rowMeans(gaResult$max)
meanRowsMean <- -rowMeans(gaResult$mean)

round(tail(meanRowsMean, n=1), digit=6)
round(tail(meanRowsMax, n=1),  digit=6)