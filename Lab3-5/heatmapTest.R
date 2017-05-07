library(GA)
#library(plot3D)


loopRepetitions <- 30
population <- 100 
iteration <- 50
crosing <- 1
mini <- c(-5,-5)
maxi <- c(15,15)

source("branin.R")
source("myFunctions.R")
source("meanGaCustom.R")

heatmapDim <- 10
mutationsProp <- seq(0, 1, 1/heatmapDim)
elitVal <- seq(0, population, population/heatmapDim)
heatmapValues <- matrix(0, nrow = heatmapDim, ncol = heatmapDim) 

for( elitCounter in 1:heatmapDim )
{
  for( mutCounter in 1:heatmapDim )
  {
    gaResultCustom <- meanGaCustom(population, iteration, crosing, 
                                   mutationsProp[mutCounter], 
                                   mini, maxi, 
                                   elitVal[elitCounter])
    meanRowsMaxCustom <- -rowMeans(gaResultCustom$max)
    lastBestResult <- round(tail(meanRowsMaxCustom, n=1), digit=6)
    
    heatmapValues[elitCounter, mutCounter] <- lastBestResult
  } 
}
h <- heatmapValues[2:10,]

heatmapValues[1,]

persp3D(seq(1, 9, by = 1), seq(1, 10, by = 1), h, theta = 30, phi = 40, xlab = "Elitaryzm", ylab = "Mutacja")
