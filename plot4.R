setwd("d:/temp/module4")

library(data.table)
library(lubridate)

d <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007"]
d$Global_active_power <- as.numeric(d$Global_active_power)
d[, DateTime := dmy_hms(paste(d$Date, d$Time))]

png("plot4.png", width = 480, height = 480) 

par(mfrow = c(2,2))
par(cex.axis = 0.8)

# Plot 1
plot(as.numeric(d$DateTime), d$Global_active_power, type = "l", xlab="", ylab = "Global Active Power", axes = FALSE)
axis(1, at = c(1170288000, 1170374400, 1170460800), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()

# Plot 2
plot(as.numeric(d$DateTime), d$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", axes = FALSE)
axis(1, at = c(1170288000, 1170374400, 1170460800), labels = c("Thu", "Fri", "Sat"))
axis(2, at = c(234, 236, 238, 240, 242, 244, 246), labels = c("234", "", "238", "", "242", "", "246"))
box()

# Plot 3
plot(as.numeric(d$DateTime), d$Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering", axes = FALSE)
lines(as.numeric(d$DateTime), d$Sub_metering_1, col= "black")
lines(as.numeric(d$DateTime), d$Sub_metering_2, col= "red")
lines(as.numeric(d$DateTime), d$Sub_metering_3, col= "blue")
axis(1, at = c(1170288000, 1170374400, 1170460800), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "blue", "red"), bty = "n", cex = 0.8)

# Plot 4
with(d, plot(as.numeric(DateTime), Global_reactive_power, type = "l", xlab="datetime", axes = FALSE))
axis(1, at = c(1170288000, 1170374400, 1170460800), labels = c("Thu","Fri","Sat"))
axis(2, at = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5), labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))
box()

dev.off()