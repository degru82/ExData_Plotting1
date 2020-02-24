data <- read.csv("./data/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
power_time <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

power_time$Date <- as.Date(power_time$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(power_time$Date), power_time$Time)
power_time$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)
with(power_time, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)",))
dev.off()