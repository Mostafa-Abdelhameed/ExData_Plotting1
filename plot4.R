path <- "C:/Users/Mabdelhameed/Documents/exdata_data_household_power_consumption/household_power_consumption.txt"
Data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(sub_Data$Global_active_power)
time <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

subMetering1 <- as.numeric(sub_Data$Sub_metering_1)
subMetering2 <- as.numeric(sub_Data$Sub_metering_2)
subMetering3 <- as.numeric(sub_Data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(time, voltage, type="l", xlab="time", ylab="Voltage")

plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMetering2, type="l", col="red")
lines(time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(time, globalReactivePower, type="l", xlab="time", ylab="Global_reactive_power")

dev.off()