df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df2 <- df[df$DateTime >= as.POSIXlt("2007-02-01") & df$DateTime <= as.POSIXlt("2007-02-03") & !is.na(df$DateTime),]
png("plot2.png", width=480, height=480)
plot(df2$DateTime, df2$Global_active_power, type="l", ylab="Global Active Power (killowatts)", xlab="Time")
title("Global Active Power -vs- Time")
dev.off()
