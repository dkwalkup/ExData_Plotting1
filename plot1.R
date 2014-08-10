##Script to make plot 1
 
##Get the data
power <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, colClasses=c("character", "character", "numeric", "numeric", 
"numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

## Subset data
data1 <- subset(power, Date == "1/2/2007")
data2 <- subset(power, Date == "2/2/2007")
powerData <- rbind(data1, data2) ##note here date and time classes are character, no need to change

##Create histogram with required labels and color
hist(powerData$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power")

##Save a png of the plot
dev.copy(png, file = "plot1.png")
dev.off()