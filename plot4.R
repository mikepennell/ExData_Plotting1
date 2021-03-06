# Initialization
  library(dplyr)
  setwd("~/0 SourceThought Private/Data Science Course/repo/ExData_Plotting1")

# Download power consumption dataset
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, destfile = "Dataset.zip") #for PC. For mac add method="curl"
  unzip("Dataset.zip")
  hpRaw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
            colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric",
                           "numeric", "numeric", "numeric"))
  
# Sample for 2 days of data per specification and format date time
  hpSample <- filter(hpRaw, Date == "1/2/2007" | Date == "2/2/2007")
  hpSample$DateTime <- strptime(paste(hpSample$Date, hpSample$Time), format = "%d/%m/%Y %H:%M:%S")
  
# Plot 4  - Plot global active power, voltage, energy sub metering (1,2 & 3) and global reactive power for sample period
  png(file = "plot4.png")
  par(mfrow = c(2, 2))
  with(hpSample, {
      plot(DateTime, Global_active_power, type = "l",
           xlab = "", ylab = "Global Active Power (kilowatts)")
      plot(DateTime, Voltage, type = "l",
           xlab = "datetime", ylab = "Voltage")
      plot(DateTime, Sub_metering_1, type = "l",
           xlab = "", ylab = "Energy sub metering")
      lines(hpSample$DateTime, hpSample$Sub_metering_2, col = "red")
      lines(hpSample$DateTime, hpSample$Sub_metering_3, col = "blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             col = c("black", "blue", "red"), lty=c(1,1), bty = "n")
      plot(DateTime, Global_reactive_power, type = "l",
           xlab = "datetime")
  })
  dev.off()
  
  
  