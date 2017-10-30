

library(dplyr)
library(data.table)
library(lubridate)

setwd("C:/Users/hlevy/Documents/R/ElectricPowerConsumption")

#read in data and subset by specific February dates
febdays <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
febdays <- filter(febdays, (Date == "2/2/2007" | Date == "1/2/2007"))

#save plot image to file
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#set up 2 by 2 plots
par(mfcol = c(2,2))
with(febdays, {

  #make plot top left
  plot(febdays$Global_active_power, ylab = "Global Active Power (kilowatts", type = "l", xaxt = "n", xlab = "")
  axis(1, at =c(1,1440,2880), tick = TRUE, labels = c("Thu", "Fri", "Sat"))

  #make plot bottom left
  plot(febdays$Sub_metering_1, ylab = "Energy sub metering", type = "l", xaxt = "n", col = "black",xlab="")
  lines(febdays$Sub_metering_2, type = "l", col = "red",add=T)
  lines(febdays$Sub_metering_3, type = "l", col = "blue", add = T)
  axis(1, at =c(1,1440,2880), tick = TRUE, labels = c("Thu", "Fri", "Sat"))
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

  #make plot top right
  plot(febdays$Voltage, ylab = "Voltage", type = "l", xaxt = "n", xlab = "datetime")
  axis(1, at =c(1,1440,2880), tick = TRUE, labels = c("Thu", "Fri", "Sat"))

  #make plot bottom right
  plot(febdays$Global_reactive_power, ylab = "Global_reactive_power", type = "l", xaxt = "n", xlab = "datetime")
  axis(1, at =c(1,1440,2880), tick = TRUE, labels = c("Thu", "Fri", "Sat"))
})

dev.off()








