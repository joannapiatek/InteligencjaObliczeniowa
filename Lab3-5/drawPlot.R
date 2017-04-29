axis_min <- -65
axis_max <- 10

# Rysowanie wykresu
plot(meanRowsMax, 
     type = "p", col="blue", 
     # main = "Porównanie wartoœci œrednich i najlepszych - mutacja domyœlna i w³asna",
     main = "Porównanie wartoœci œrednich i najlepszych - selekcja domyœlna i w³asna",
     xlab=" Iteracja", ylab="Wartoœæ funkcji dopasowania"
     ,ylim=c(axis_min,axis_max)
     )

par(new = TRUE)
plot(meanRowsMean,
     col="green", 
     xlab = "", ylab = ""
     ,ylim=c(axis_min,axis_max)
     )

par(new = TRUE)
plot(meanRowsMaxCustom, 
     col="red", 
     xlab = "", ylab = ""
     ,ylim=c(axis_min,axis_max)
)

par(new = TRUE)
plot(meanRowsMeanCustom, 
    col="orange", 
     xlab = "", ylab = ""
     ,ylim=c(axis_min,axis_max)
)

# legend("bottomright", 
#        c("Wartoœæ najlepszego osobnika - mutacja domyœlna",
#          "Œrednia wartoœæ osobników - mutacja domyœlna",
#          "Wartoœæ najlepszego osobnika - mutacja w³asna",
#          "Œrednia wartoœæ osobników - mutacja w³asna"
#          )
#        ,lty=c(1,1), lwd=c(2.5,2.5)
#        ,col=c("blue","green", "red", "orange")
#        ,cex=0.6, y.intersp = 0.3
#        )

#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)
grid (NULL,NULL, lty = 4, col = "cornsilk2")