meanGA <- function(population,iteration,crosing,mutant,mini,maxi)
{
    xMax <- matrix ( 0 ,iteration,5)   
    xMean <- matrix ( 0 ,iteration,5)  
 
    for ( i in 1:5)
    {  
        GA <- ga(type = "real-valued",
            fitness =  function(x) - camel6(x[1], x[2]),
                min = mini, max = maxi, pcrossover = crosing, pmutation = mutant,
                popSize = population, maxiter = iteration, run = 100)
        xMax[,i] <- GA@summary[,1]
        xMean[,i] <- GA@summary[,2]
		print(GA@solution)
 
    }
 
return(list(max=xMax,min=xMean))
 
}
gaResult <- meanGA(50,50,0.5,0.1,c(-8,-8),c(5,5))
meanRowsMax <- rowMeans(gaResult$max )
meanRowsMean <- rowMeans(gaResult$min)

plot(meanRowsMax , type = "p",col="red", main = "Wartoœæ najlepszego osobnika po uœrednieniu",
xlab=" Iteracja", ylab="Wartoœæ funkcji dopasowania")
par(new = TRUE)
plot(meanRowsMean,col="green", xlab = "", ylab = "")
legend("bottomright",  c("Wartosc najlepszego osobnika","Œrednia wartoœæ osobników"), lty=c(1,1), lwd=c(2.5,2.5),col=c("red","green"))
#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)
grid (NULL,NULL, lty = 4, col = "cornsilk2")
