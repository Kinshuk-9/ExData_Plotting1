full_data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, dec='.')
data1 <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]
data1$day <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Voltage <- as.numeric(data1$Voltage)
data1$SubMetering1 <- as.numeric(data1$Sub_metering_1)
data1$SubMetering2 <- as.numeric(data1$Sub_metering_2)
data1$SubMetering3 <- as.numeric(data1$Sub_metering_3)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data1$day, data1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data1$day, data1$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data1$day, data1$SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(data1$day, data1$SubMetering2, type="l", col="red")
lines(data1$day, data1$SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 3, col=c("black", "red", "blue"))

plot(data1$day, data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power ")

dev.off()
