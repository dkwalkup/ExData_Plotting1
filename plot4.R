## Script for 2nd plot in assigment
##Get the data
power <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, colClasses=c("character", "character", "numeric", "numeric", 
                                                                                            "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

## Subset data
data1 <- subset(power, Date == "1/2/2007")
data2 <- subset(power, Date == "2/2/2007")
powerData <- rbind(data1, data2) ##note here date and time classes are character, no need to change

## Add a date time column to use for plotting
Date_Time <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %T", tz="")
pwrData <- cbind(powerData, Date_Time)

## plot the four graphs
par(mfrow=c(2,2))

##graph 1 - global active power over time
plot(pwrData$Date_Time, pwrData$Global_active_power, xlab = "", 
     ylab = "Global Active Power", type = "l")
##graph2 - voltage over time
plot(pwrData$Date_Time, pwrData$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l")
##graph3 - sub_metering over time
plot(pwrData$Date_Time, pwrData$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "n")
points(pwrData$Date_Time, pwrData$Sub_metering_1, type = "l")
points(pwrData$Date_Time, pwrData$Sub_metering_2, type = "l", col="red")
points(pwrData$Date_Time, pwrData$Sub_metering_3, type = "l", col="blue")
legend("topright", pch = "-", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
##graph4 - global reactive power over time
plot(pwrData$Date_Time, pwrData$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")

##Save a png of the plot
dev.copy(png, file = "plot4.png")
dev.off()