

# Implementacja funkcji pozwalaj�cej na zmian� parametr�W
meanGA <- function(population,iteration,crosing,mutant,mini,maxi,elit)
{
    xMax <- matrix ( 0 ,iteration,5)   
    xMean <- matrix ( 0 ,iteration,5)  

# P�tla do u�redniania wynik�w
    for ( i in 1:5)
    {  
        GA <- ga(type = "real-valued",
            fitness =  function(x) - branin(x[1], x[2]),
                min = mini, max = maxi, pcrossover = crosing, pmutation = mutant,
                popSize = population, maxiter = iteration, elitism = elit)
        
        xMax[,i] <- GA@summary[,1]
        xMean[,i] <- GA@summary[,2]
		    print(GA@solution)
    }
    return(list(max=xMax,min=xMean))
}

# Wywo�anie funkcji
gaResult <- meanGA(50,50,0.5,0.1,c(-5,-5),c(15,15), 6)
meanRowsMax <- rowMeans(gaResult$max )
meanRowsMean <- rowMeans(gaResult$min)

# Rysowanie wykresu
plot(meanRowsMax , type = "p",col="red", main = "Warto�� najlepszego osobnika po u�rednieniu",
xlab=" Iteracja", ylab="Warto�� funkcji dopasowania")
#par(new = TRUE)
plot(meanRowsMean,col="green", xlab = "", ylab = "")
legend("bottomright",  c("Wartosc najlepszego osobnika","�rednia warto�� osobnik�w"), 
       lty=c(1,1), lwd=c(2.5,2.5),col=c("red","green"))
#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)
grid (NULL,NULL, lty = 4, col = "cornsilk2")
