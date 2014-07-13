plot2 <- function()
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


	png(filename="plot2.png", width=480, height=480)
	plot(reqd$timestamp, reqd$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	
	dev.off()

	}

}