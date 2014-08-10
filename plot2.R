##Setting working directory
setwd("C:/Users/Lionel/Documents/R") ##Setting your working directory where the file is located

##Loading the Data
Household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") ##Formating the NA from ?, using the ; delimiter 
newHousehold <- Household[(as.Date(Household$Date, format="%d/%m/%Y") == '2007/02/01') | (as.Date(Household$Date, format="%d/%m/%Y") == '2007/02/02'),] ##Filtering records for 2007/02/01 and 2007/02/02 into newHousehold
newHousehold$Timestamp <- strptime(paste(newHousehold$Date,newHousehold$Time), format="%d/%m/%Y %H:%M:%S")
          
##Plotting the Chart
library(datasets)
plot(newHousehold$Timestamp, newHousehold$Global_active_power, type="l", xlab="", ylab = 'Global Active Power (kilowatts)')

##Exporting the file to PNG
dev.copy(png, file = "plot2.png") ## Copy plot to a PNG file
dev.off() ## Closing the PNG device

