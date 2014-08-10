## Script for line plot of global active power over time

##Get the data, specified column classes to subset
power <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, 
                  colClasses=c("character", "character", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric", "numeric"), 
                  na.strings="?")

## Subset data to limit the dates to Feb 1 & 2, 2007
data1 <- subset(power, Date == "1/2/2007")
data2 <- subset(power, Date == "2/2/2007")
powerData <- rbind(data1, data2) 

## Add a date time column to use for plotting
Date_Time <- strptime(paste(powerData$Date, powerData$Time), 
                      "%d/%m/%Y %T", tz="")
pwrData <- cbind(powerData, Date_Time)

## plot the data as a line graph
par(mfrow=c(1,1), mar=c(5,4,4,2))
plot(pwrData$Date_Time, pwrData$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

##Save a png of the plot !!double check file name!!
dev.copy(png, file = "plot2.png")
dev.off()