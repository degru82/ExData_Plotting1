# 1. Global Active Power

data <- read.csv("./data/household_power_consumption.txt", header = T, sep=";", stringsAsFactors = F)

power <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
power$Global_active_power <- as.numeric(power$Global_active_power)


png("plot1.png", width=480, height=480)
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)")

dev.off()
