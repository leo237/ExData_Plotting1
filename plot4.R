plot4 <- function()
{
	if (file.exists("household_power_consumption.txt"))
	{
		reqd <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )
		#read the entire table. then changed the date into Date class. 
		
		reqd$timestamp = strptime(paste(reqd$Date, reqd$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
		startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
		endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
		reqd = reqd[reqd$timestamp >= startDate & reqd$timestamp <= endDate, ]


		png(filename="plot4.png", width=480, height=480)

		par(mfcol=c(2,2))
		# First plot
		plot(reqd$timestamp, reqd$Global_active_power, type="l", xlab="",
		     ylab="Global Active Power")

		# Second plot
		plot(reqd$timestamp, reqd$Sub_metering_1, type="l", xlab="",
		     ylab="Energy sub metering")
		lines(reqd$timestamp, reqd$Sub_metering_2, col="red")
		lines(reqd$timestamp, reqd$Sub_metering_3, col="blue")
		legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

		# Third Plot
		plot(reqd$timestamp, reqd$Voltage, type="l",
		     xlab="datetime", ylab="Voltage")

		# Fourth plot
		plot(reqd$timestamp, reqd$Global_reactive_power, type="l",
		     xlab="datetime", ylab="Global_reactive_power")

		dev.off()
	}
}