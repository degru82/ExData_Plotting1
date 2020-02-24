data <- read.csv("./data/household_power_consumption.txt", header = T, sep=";", stringsAsFactors = F)
four_graph <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

four_graph$Date <- as.Date(four_graph$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(four_graph$Date), four_graph$Time)
four_graph$Datetime <- as.POSIXct(datetime)

four_graph$Sub_metering_1 <- as.numeric(as.character(four_graph$Sub_metering_1))
four_graph$Sub_metering_2 <- as.numeric(as.character(four_graph$Sub_metering_2))
four_graph$Sub_metering_3 <- as.numeric(as.character(four_graph$Sub_metering_3))

four_graph$Global_active_power <- as.numeric(as.character(four_graph$Global_active_power))
four_graph$Voltage <- as.numeric(as.character(four_graph$Voltage))
four_graph$Global_reactive_power <- as.numeric(as.character(four_graph$Global_reactive_power))

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(four_graph, {
  plot(Datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(Datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_1~Datetime)
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()