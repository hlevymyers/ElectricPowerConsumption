
library(dplyr)
library(data.table)
library(lubridate)

setwd("C:/Users/hlevy/Documents/R/ElectricPowerConsumption")

#read in data and subset by specific February dates
febdays <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
febdays <- filter(febdays, (Date == "2/2/2007" | Date == "1/2/2007"))

#save plot image to file
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#make plot 2
plot(febdays$Global_active_power, ylab = "Global Active Power (kilowatts", type = "l", xaxt = "n", xlab = "")
axis(1, at =c(1,1440,2880), tick = TRUE, labels = c("Thu", "Fri", "Sat"))

dev.off()
