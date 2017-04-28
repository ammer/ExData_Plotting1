# make sure weekday shows in English
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# data file name, should be in workdir
data_file_name <- "household_power_consumption.txt"

# load data of 1/2/2007 and 2/2/2007
load.data <- function() {
  data <- read.table(data_file_name, header=TRUE, sep=";", na.strings="?")
  
  data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  data1$Datetime = strptime(paste(data1$Date, data1$Time, seq=" "), format="%d/%m/%Y %H:%M:%S")
  
  return(data1)
}

# plot to png file
plot.3 <- function() {
  data <- load.data()
  
  png(filename="plot3.png", width=480, height=480, units="px")
  
  with(data, {
    plot(Datetime, Sub_metering_1, col="green", type='l', ylab="Energy sub metering", xlab="")
    lines(Datetime, Sub_metering_2, col="red")
    lines(Datetime, Sub_metering_3, col="blue")
  })
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
          col = c("green", "red", "blue"), lwd = 1)

  dev.off()
}

# plot when calling this script
plot.3()