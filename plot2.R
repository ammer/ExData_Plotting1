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
plot.2 <- function() {
  data <- load.data()
  
  png(filename="plot2.png", width=480, height=480, units="px")
  
  plot(data$Datetime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  dev.off()
}

# plot if execute this script
plot.2()
