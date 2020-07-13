data <- read.csv(file="aneu_check.csv",header=T)


samples =    c("W10","W13","W14-1","W14-4","W14-8","W14-9","W14","W15","W16","W18","W22","W23","W24","W25-10","W25-12B","W25-14","W25-1B",
"W25-1","W25-2","W25-3","W25-4","W25-5B","W25-8B","W25-9B","W25","W26","W27","W28","W2","W30","W32","W33","W36","W38","W3","W4","W6","W7",
"W8","W9")

for (i in 1:length(samples)){
figname = paste(samples[i],c(".tif"),sep="")
tiff(filename = figname, width = 4000, height = 600, res =150)
#par(mfrow = c(1,1), mar=c(2,2,2,2))
###########################################################################

data1<-data[,c(1,2,i+2)]

plot(c(),xlim= c(0,3733), ylim= c(0,600),xlab = "Chromosome",ylab = "Depth",axes=T, 
     main = samples[i], cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5,xaxt="n"
     )

color.vector<-rep(c("deepskyblue","orange","forestgreen","indianred3"),12)

points(data1[,2]/10, data1[,3],
     pch = 20, font = 2,cex=0.5, col = color.vector[data1[-1,1]])

#abline(v = c(0,434,667,958,1234,1594,1959,2315,2615,2928,3225,3510,3733), col = "gray2", lty = 3)


abline(h = mean(data1[,3],na.rm = TRUE), col = "blue", lty = 1)

abline(h = mean(data1[,3],na.rm = TRUE)*1.163511, col = "black", lty = 2,  lwd=2)
abline(h = mean(data1[,3],na.rm = TRUE)*0.791859, col = "black", lty = 2,  lwd=2)


points(168,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(568.8,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(986.2,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(1253.5,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(1636.6,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(1964,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(2244.6,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(2549.6,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(2733.3,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(3017.5,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(3287.5,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")
points(3577.8,mean(data1[,3],na.rm = TRUE), pch = 19, cex = 1.6, col = "blue")

dev.off()
}
