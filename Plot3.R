##Setting working directory
setwd("C:/Users/Lionel/Documents/R") ##Setting your working directory where the file is located

##Loading the Data
Household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") ##Formating the NA from ?, using the ; delimiter 
newHousehold <- Household[(as.Date(Household$Date, format="%d/%m/%Y") == '2007/02/01') | (as.Date(Household$Date, format="%d/%m/%Y") == '2007/02/02'),] ##Filtering records for 2007/02/01 and 2007/02/02 into newHousehold
newHousehold$Timestamp <- strptime(paste(newHousehold$Date,newHousehold$Time), format="%d/%m/%Y %H:%M:%S")

##Plotting the Chart
library(datasets)
plot(newHousehold$Timestamp,  newHousehold$Sub_metering_1, type="l", cex.lab=0.75, cex.axis=0.75 , xlab="", ylab = "Enery Sub Metering") ##Plotting the black line
lines(newHousehold$Timestamp,  newHousehold$Sub_metering_2, col = "red") ##Plotting the red line
lines(newHousehold$Timestamp,  newHousehold$Sub_metering_3, col = "blue") ##Plotting the blue line
legend("topright", lty=1, y.intersp = 0.5, cex = 0.75, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) ##Creating the legend

##Exporting the file to PNG
dev.copy(png, file = "plot3.png", width = 480, height = 480) ## Copy plot to a PNG file
dev.off() ## Closing the PNG device

