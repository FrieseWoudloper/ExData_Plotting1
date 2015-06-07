setwd("d:/temp/module4")

library(data.table)
library(lubridate)

d <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007"]
d$Global_active_power <- as.numeric(d$Global_active_power)
d[, DateTime := dmy_hms(paste(d$Date, d$Time))]

png("plot2.png", width = 480, height = 480) 

plot(as.numeric(d$DateTime), d$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", axes = FALSE)
axis(1, at = c(1170288000, 1170374400, 1170460800), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()

dev.off()