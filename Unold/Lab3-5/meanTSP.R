data("USCA50")
D <- as.matrix(USCA50)
d <- USCA50


tourLength <- function(tour, distMatrix) {
    tour <- c(tour, tour[1])
    route <- embed(tour, 2)[, 2:1]
    sum(distMatrix[route])
}



tpsFitness <- function(tour, ...) 1/tourLength(tour, ...)


meanGA <- function(population,iteration,crosing,mutant,inst,elit, D)
{
    xMax <- matrix ( 0 ,iteration,15)   
    xMean <- matrix ( 0 ,iteration,15)  
 
    for ( i in 1:15)
    {  
        GA <- ga(type = "permutation",
            fitness = tpsFitness ,
                min = 1,distMatrix = D, max =attr(inst, "Size"), pcrossover = crosing, pmutation = mutant,
                popSize = population, maxiter = iteration,elitism = elit )
        xMax[,i] <- 1/GA@summary[,1]
        xMean[,i] <- 1/GA@summary[,2]
		print(GA@solution)
 
    }
 
return(list(max=xMax,min=xMean))
 
}
gaResult <- meanGA(100,50,0.5,0.1,d,5,D)
meanRowsMax <- rowMeans(gaResult$max )
meanRowsMean <- rowMeans(gaResult$min)

plot(meanRowsMax , type = "p",col="red", main = "Wartoœæ najlepszego osobnika po uœrednieniu",
xlab=" Iteracja", ylab="Wartoœæ funkcji dopasowania")
grid (NULL,NULL, lty = 4, col = "cornsilk2")
#par(new = TRUE)
#plot(meanRowsMean,col="green", xlab = "", ylab = "")
#legend("bottomright",  c("Wartosc najlepszego osobnika","Œrednia wartoœæ osobników"), lty=c(1,1), lwd=c(2.5,2.5),col=c("red","green"))
#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)

