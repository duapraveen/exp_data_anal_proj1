df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df2 <- df[df$DateTime >= as.POSIXlt("2007-02-01") & df$DateTime <= as.POSIXlt("2007-02-03") & !is.na(df$DateTime),]
png("plot3.png", width=480, height=480)
plot(df2$DateTime, df2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="")
lines(df2$DateTime, df2$Sub_metering_2, col="red")
lines(df2$DateTime, df2$Sub_metering_3, col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()
