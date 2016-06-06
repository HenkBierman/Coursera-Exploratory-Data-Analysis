## This script plots the Energy Sub Meterings of 1 and 2 Feb 2007
  
  library(datasets)
  
  setwd("/users/ActuarieelAdvies/documents/CourseraExploratoryDataAnalysis/Week1")

## Read power consumption in a data.table and convert Date and Time to R objects
  
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  d1 <- "1/2/2007"
  d2 <- "2/2/2007"
  pw <- power[(power$Date == d1 | power$Date == d2), ]
  pw$Time <- strptime(paste(pw$Date, pw$Time), "%d/%m/%Y %H:%M:%S")

## create plot
  
  par(mfrow = c(2,2))
  
  with(pw, plot(pw$Time, pw$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
  
  with(pw, plot(pw$Time, pw$Voltage, "l", xlab = "DateTime", ylab = "Voltage"))
  
  with(pw, plot(pw$Time, pw$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
  lines(pw$Time, pw$Sub_metering_1, col = "black")
  lines(pw$Time, pw$Sub_metering_2, col = "red")
  lines(pw$Time, pw$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
         lty = c(1, 1, 1), col = c("black", "red", "blue"))
  
  with(pw, plot(pw$Time, pw$Global_reactive_power, "l", xlab = "DateTime", ylab = "Global reactive power"))
  
## write plot to plot4.png file
    
  dev.copy(png, file = "plot4.png", width = 650, height = 480)

## close device
    
  dev.off()