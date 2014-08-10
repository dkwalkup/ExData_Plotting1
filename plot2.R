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

## plot the data
plot(pwrData$Date_Time, pwrData$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

##Save a png of the plot
dev.copy(png, file = "plot2.png")
dev.off()