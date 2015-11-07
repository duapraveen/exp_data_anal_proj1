df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

# make 4 panels
par(mfrow = c(2,2), mar=c(4,4,2,4), cex = 0.7)

# make 1st plot
plot(df2$DateTime, df2$Global_active_power, type="l", ylab="Global Active Power (killowatts)", xlab="")

# make 2nd plot
plot(df2$DateTime, df2$Voltage, type="l", ylab = "Voltage", xlab="datetime")

# make 3rd plot
plot(df2$DateTime, df2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="")
lines(df2$DateTime, df2$Sub_metering_2, col="red")
lines(df2$DateTime, df2$Sub_metering_3, col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty = "n")

# make 4th plot
plot(df2$DateTime, df2$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()
