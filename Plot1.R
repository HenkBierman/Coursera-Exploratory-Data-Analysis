## This script plots the Global Active Power histogram of 1 and 2 Feb 2007
  
  library(datasets)
  
  setwd("/users/ActuarieelAdvies/documents/CourseraExploratoryDataAnalysis/Week1")

## Read power consumption in a data.table and convert Date and Time to R objects
  
  power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  d1 <- "1/2/2007"
  d2 <- "2/2/2007"
  pw <- power[(power$Date == d1 | power$Date == d2), ]
  pw$Time <- strptime(paste(pw$Date, pw$Time), "%d/%m/%Y %H:%M:%S")
  
## create histogram
  
  hist(na.omit(pw$Global_active_power), col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")
  
## write histogram to plot1.png file
    
  dev.copy(png, file = "plot1.png")

## close device
    
  dev.off()