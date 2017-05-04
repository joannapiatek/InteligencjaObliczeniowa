axis_min <- 0.3
axis_max <- 1.6

# Rysowanie wykresu
plot(meanRowsMax_basic,
    #meanRowsMean_basic, 
     type = "p", col="blue", 
     main = "Wartość najlepszego osobnika po uśrednieniu",
     #main = "Średnia wartość osobników po uśrednieniu",
     xlab=" Iteracja", ylab="Wartość funkcji dopasowania"
     ,ylim=c(axis_min,axis_max)
     )

par(new = TRUE)
plot(
    #meanRowsMean_mut05,
    meanRowsMax_sel1,
     col="green", 
     xlab = "", ylab = ""
     ,ylim=c(axis_min,axis_max)
     )

par(new = TRUE)
plot(#meanRowsMean_mut07,
    meanRowsMax_sel20,
     col="red", 
     xlab = "", ylab = ""
     ,ylim=c(axis_min,axis_max)
)

par(new = TRUE)
plot(#meanRowsMean_mut1, 
  meanRowsMax_sel50,
    col="orange", 
     xlab = "", ylab = ""
     ,ylim=c(axis_min,axis_max)
)

legend("topright",
       # c("Prawdopodobieństwo mutacji równe 0.1 (domyślne)",
       #   "Prawdopodobieństwo mutacji równe 0.5",
       #   "Prawdopodobieństwo mutacji równe 0.7",
       #   "Prawdopodobieństwo mutacji równe 1"
       #   )
       c("6 osobników elitarnych (domyślnie)",
         "1 osobnik elitarny",
         "20 osobników elitarnych",
         "50 osobników elitarnych"
         )
       ,lty=c(1,1), lwd=c(2.5,2.5)
       ,col=c("blue","green", "red", "orange")
       ,cex=1, y.intersp = 0.6
       )

#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)
grid (NULL,NULL, lty = 4, col = "cornsilk2")