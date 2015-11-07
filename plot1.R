library(sqldf)

plot1 <- function() {
  df <- read.csv.sql(file="household_power_consumption.txt",sql="select * from file where Date=='1/2/2007' or Date='2/2/2007'",sep = ";")
  hist(df$Global_active_power, col="red", xlab ="Global Active Power (kilowatts)", main="Global Active Power")
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
}

plot1()