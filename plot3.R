path <- "C:/Users/Mabdelhameed/Documents/exdata_data_household_power_consumption/household_power_consumption.txt"
Data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(sub_Data$Global_active_power)
time <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(sub_Data$Sub_metering_1)
subMetering2 <- as.numeric(sub_Data$Sub_metering_2)
subMetering3 <- as.numeric(sub_Data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMetering2, type="l", col="red")
lines(time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()