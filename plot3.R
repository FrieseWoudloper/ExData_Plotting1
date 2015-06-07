setwd("d:/temp/module4")

library(data.table)
library(lubridate)

d <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007"]
d$Global_active_power <- as.numeric(d$Global_active_power)
d[, DateTime := dmy_hms(paste(d$Date, d$Time))]

png("plot3.png", width = 480, height = 480) # To ensure legend isn't truncated. See https://class.coursera.org/exdata-015/forum/thread?thread_id=21

plot(as.numeric(d$DateTime), d$Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering", axes = FALSE)
lines(as.numeric(d$DateTime), d$Sub_metering_1, col = "black")
lines(as.numeric(d$DateTime), d$Sub_metering_2, col = "red")
lines(as.numeric(d$DateTime), d$Sub_metering_3, col = "blue")
axis(1, at = c(1170288000, 1170374400, 1170460800), labels=c("Thu","Fri","Sat"))
axis(2)
box()
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "blue", "red"))

dev.off()