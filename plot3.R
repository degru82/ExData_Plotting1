data <- read.csv("./data/household_power_consumption.txt", header = T, sep=";", stringsAsFactors = F)
energy <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

energy$Date <- as.Date(energy$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(energy$Date), energy$Time)
energy$Datetime <- as.POSIXct(datetime)

energy$Sub_metering_1 <- as.numeric(as.character(energy$Sub_metering_1))
energy$Sub_metering_2 <- as.numeric(as.character(energy$Sub_metering_2))
energy$Sub_metering_3 <- as.numeric(as.character(energy$Sub_metering_3))

png("plot3.png", width=480, height=480)
plot(energy$Datetime, energy$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(energy, {
  lines(Datetime, Sub_metering_1)
  lines(Datetime, Sub_metering_2, col="red")
  lines(Datetime, Sub_metering_3, col="blue")
})
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()