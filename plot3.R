##Proyecto 1
data<-read.table("household_power_consumption.txt", sep = ";", dec = ".", stringsAsFactors=FALSE, header = TRUE, colClasses = c(Global_active_power="numeric", Global_reactive_power="numeric", Voltage="numeric", Global_intensity="numeric", Sub_metering_1 ="numeric", Sub_metering_2="numeric", Sub_metering_3="numeric"), na.strings="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#Plot 3
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1,  col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
