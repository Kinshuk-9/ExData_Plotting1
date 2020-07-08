
full_data <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE, na.strings = '?')
head(full_data)
data1 <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format = '%d/%m/%Y')
png("plot1.png", width=480, height=480)
hist(data1$Global_active_power, main = "Global active power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = 'Turquoise')
dev.off()
