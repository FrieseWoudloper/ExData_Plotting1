setwd("d:/temp/module4")

library(data.table)
library(lubridate)

d <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007"]
d$Global_active_power <- as.numeric(d$Global_active_power)

png("plot1.png", width = 480, height = 480) 

hist(d$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()