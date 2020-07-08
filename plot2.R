full_data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, dec='.')
data1 <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]
data1$day <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data1$Global_active_power <- as.numeric(data1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(data1$day, data1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()