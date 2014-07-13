plot1 <- function()
{
	if (file.exists("household_power_consumption.txt"))
	{
		table1 <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )
		table1$Date <- as.Date(table1$Date, "%d/%m/%Y")
		#read the entire table. then changed the date into Date class. 
		reqd <- table1[ (table1$Date == "2007-02-01") | (table1$Date == "2007-02-02"),]
		#we get the required table for the two days. 
		png(filename = "plot1.png", width = 480, height = 480, units = "px") 
		hist (reqd$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global active power")
		dev.off()

	}

}