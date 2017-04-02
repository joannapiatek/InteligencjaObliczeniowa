meanGA <- function(population,iteration,crosing,mutant,mini,maxi)
{
    xMax <- matrix ( 0 ,iteration,5)   
    xMean <- matrix ( 0 ,iteration,5)  
 
    for ( i in 1:5)
    {  
        GA <- ga(type = "real-valued",
            fitness =  function(x) -easom(x[1], x[2]),
                min = mini, max = maxi, pcrossover = crosing, pmutation = mutant,
                popSize = population, maxiter = iteration, run = 100)
        xMax[,i] <- GA@summary[,1]
        xMean[,i] <- GA@summary[,2]
 
    }
 
return(list(max=xMax,min=xMean))
 
}
gaResult <- meanGA(100,100,0.5,0.1,c(-12,-12),c(10,10))
meanRowsMax <- rowMeans(gaResult$max )
meanRowsMean <- rowMeans(gaResult$min)

plot(meanRowsMax , type = "p",col="red", main = "Wartoœæ najlepszego osobnika po uœrednieniu",
xlab=" Iteracja", ylab="Wartoœæ funkcji dopasowania")
par(new = TRUE)
plot(meanRowsMean,col="green", axes = FALSE, xlab = "", ylab = "")
legend("bottomright",  c("Wartosc najlepszego osobnika","Œrednia wartoœæ osobników"), lty=c(1,1), lwd=c(2.5,2.5),col=c("red","green"))
