# data file name, should be in workdir
data_file_name <- "household_power_consumption.txt"

# load data of 1/2/2007 and 2/2/2007
load.data <- function() {
  data <- read.table(data_file_name, header=TRUE, sep=";", na.strings="?")
  data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  return(data1)
}

# plot to png file
plot.1 <- function() {
  data <- load.data()
  
  png(file="plot1.png", width=480, height=480, units="px")
  hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}

# plot if the script executed
plot.1()
