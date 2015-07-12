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
  
# Plot 1 - Histogram of global active power for sample period
  png(file = "plot1.png")
  hist(hpSample$Global_active_power,
       xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power",
       col = "red")
  dev.off()