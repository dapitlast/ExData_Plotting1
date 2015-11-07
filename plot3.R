library(sqldf)

plot3 <- function() {
  df <- read.csv.sql(file="household_power_consumption.txt",sql="select a.*, a.Date ||' ' ||a.Time as DateTime from file a where Date=='1/2/2007' or Date='2/2/2007'",sep = ";")
  df[,"DateTime"] <- as.POSIXct(df[,"DateTime"],format="%d/%m/%Y %H:%M:%S")
  
  plot(x=df[,"DateTime"],y=df[,"Sub_metering_1"],type="l",ylab="Energy sub metering", xlab="")
  lines(x=df[,"DateTime"],y=df[,"Sub_metering_2"],type="l",col="red")
  lines(x=df[,"DateTime"],y=df[,"Sub_metering_3"],type="l",col="blue")
  legend(x='topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd ="1")
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
}

plot3()