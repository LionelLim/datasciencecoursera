##Setting working directory
setwd("C:/Users/Lionel/Documents/R") ##Setting your working directory where the file is located

##Loading the Data
Household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") ##Formating the NA from ?, using the ; delimiter 
newHousehold <- Household[(as.Date(Household$Date, format="%d/%m/%Y") == '2007/02/01') | (as.Date(Household$Date, format="%d/%m/%Y") == '2007/02/02'),] ##Filtering records for 2007/02/01 and 2007/02/02 into newHousehold
newHousehold$Timestamp <- strptime(paste(newHousehold$Date,newHousehold$Time), format="%d/%m/%Y %H:%M:%S")

##Plotting the Chart
library(datasets)
par(mfrow = c(2, 2))
plot(newHousehold$Timestamp, newHousehold$Global_active_power, type="l", cex.lab=0.75, cex.axis=0.75, xlab="", ylab = 'Global Active Power')

plot(newHousehold$Timestamp, newHousehold$Voltage, type="l", cex.lab=0.75, cex.axis=0.75, xlab="datetime", ylab = 'Voltage')


plot(newHousehold$Timestamp,  newHousehold$Sub_metering_1, type="l", cex.lab=0.75, cex.axis=0.75 , xlab="", ylab = "Enery Sub Metering")
lines(newHousehold$Timestamp,  newHousehold$Sub_metering_2, col = "red")
lines(newHousehold$Timestamp,  newHousehold$Sub_metering_3, col = "blue")
legend(x="topright", inset=0.1, lty=1, bty = "n", y.intersp = 0.75, cex = 0.5, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(newHousehold$Timestamp, newHousehold$Global_reactive_power, type="l", cex.lab=0.75, cex.axis=0.75, xlab="datetime", ylab = 'Global Active Power')


##Exporting the file to PNG
dev.copy(png, file = "plot4.png", width = 480, height = 480) ## Copy plot to a PNG file
dev.off() ## Closing the PNG device

