library(sqldf)

plot2 <- function() {
  df <- read.csv.sql(file="household_power_consumption.txt",sql="select a.*, a.Date ||' ' ||a.Time as DateTime from file a where Date=='1/2/2007' or Date='2/2/2007'",sep = ";")
  df[,"DateTime"] <- as.POSIXct(df[,"DateTime"],format="%d/%m/%Y %H:%M:%S")
  plot(x=df[,"DateTime"],y=df[,"Global_active_power"],type = "l", xlab = "",ylab="Global Active Power (kilowatts)")
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()
}

plot2()