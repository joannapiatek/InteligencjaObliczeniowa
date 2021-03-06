axis_min <- -5
axis_max <- 65

# Rysowanie wykresu
plot(meanRowsMax, 
     type = "p", col="blue", 
     # main = "Por�wnanie warto�ci �rednich i najlepszych - mutacja domy�lna i w�asna",
     # main = "Por�wnanie warto�ci �rednich i najlepszych - selekcja domy�lna i w�asna",
      main = "Por�wnanie warto�ci �rednich i najlepszych - krzy�owanie domy�lne i w�asne",
     xlab=" Iteracja", ylab="Warto�� funkcji dopasowania"
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
       c("Warto�� najlepszego osobnika - krzy�owanie domy�lne",
         "�rednia warto�� osobnik�w - krzy�owanie domy�lne",
         "Warto�� najlepszego osobnika - krzy�owanie w�asne",
         "�rednia warto�� osobnik�w - krzy�owanie w�asne"
         )
       ,lty=c(1,1), lwd=c(2.5,2.5)
       ,col=c("blue","green", "red", "orange")
       ,cex=1, y.intersp = 0.6
       )

#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)
grid (NULL,NULL, lty = 4, col = "cornsilk2")