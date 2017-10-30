
library(dplyr)
library(data.table)
library(lubridate)

setwd("C:/Users/hlevy/Documents/R/ElectricPowerConsumption")

#read in data and subset by specific February dates
febdays <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
febdays <- filter(febdays, (Date == "2/2/2007" | Date == "1/2/2007"))

#save plot image to file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#make plot 1
hist(febdays$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
