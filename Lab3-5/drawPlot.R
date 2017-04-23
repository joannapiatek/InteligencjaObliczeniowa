axis_min <- -150
axis_max <- 10
# Rysowanie wykresu
plot(meanRowsMax , type = "p",col="red", main = "Wartoœæ najlepszego osobnika po uœrednieniu",
     xlab=" Iteracja", ylab="Wartoœæ funkcji dopasowania",
     ylim=c(axis_min,axis_max))
par(new = TRUE)
plot(meanRowsMean, col="green", xlab = "", ylab = "",
     ylim=c(axis_min,axis_max))

legend("bottomright", c("Wartoœæ najlepszego osobnika","Œrednia wartoœæ osobników"), 
       lty=c(1,1), lwd=c(2.5,2.5),col=c("red","green")
       ,cex=0.9, y.intersp = 0.2)
#axis(1, at = seq(0, 200, by = 2), las=2)
#axis(2, at = seq(0, 500, by = 1), las=2)
grid (NULL,NULL, lty = 4, col = "cornsilk2")