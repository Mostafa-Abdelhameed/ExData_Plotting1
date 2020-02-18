path <- "C:/Users/Mabdelhameed/Documents/exdata_data_household_power_consumption/household_power_consumption.txt"
Data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_Data <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(sub_Data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()