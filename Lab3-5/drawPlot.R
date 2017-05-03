axis_min <- -5
axis_max <- 65

# Rysowanie wykresu
plot(meanRowsMax, 
     type = "p", col="blue", 
     # main = "Porównanie wartoœci œrednich i najlepszych - mutacja domyœlna i w³asna",
     # main = "Porównanie wartoœci œrednich i najlepszych - selekcja domyœlna i w³asna",
      main = "Porównanie wartoœci œrednich i najlepszych - krzy¿owanie domyœlne i w³asne",
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

legend("topright",
       c("Wartoœæ najlepszego osobnika - krzy¿owanie domyœlne",
         "Œrednia wartoœæ osobników - krzy¿owanie domyœlne",
         "Wartoœæ najlepszego osobnika - krzy¿owanie w³asne",
         "Œrednia wartoœæ osobników - krzy¿owanie w³asne"
         )
       ,lty=c(1,1), lwd=c(2.5,2.5)
       ,col=c("blue","green", "red", "orange")
       ,cex=1, y.intersp = 0.6
       )

#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)
grid (NULL,NULL, lty = 4, col = "cornsilk2")