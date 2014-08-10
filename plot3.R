## Script for line plot for 3 different sub metering values
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

## plot the data - 3 different lines for each sub-metering with legend
par(mfrow=c(1,1), mar=c(5,4,4,2))
plot(pwrData$Date_Time, pwrData$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "n")
points(pwrData$Date_Time, pwrData$Sub_metering_1, type = "l")
points(pwrData$Date_Time, pwrData$Sub_metering_2, type = "l", col="red")
points(pwrData$Date_Time, pwrData$Sub_metering_3, type = "l", col="blue")
legend("topright", pch="-", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save a png of the plot !!double check file name!!
dev.copy(png, file = "plot3.png")
dev.off()