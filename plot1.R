##Script for histogram of global active power
 
##Get the data, specified column classes to subset and create histogram 
power <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE,  
                colClasses=c("character", "character", "numeric", "numeric", 
                "numeric", "numeric", "numeric", "numeric", "numeric"), 
                na.strings="?")

## Subset data to limit the dates to Feb 1 & 2, 2007
data1 <- subset(power, Date == "1/2/2007")
data2 <- subset(power, Date == "2/2/2007")
powerData <- rbind(data1, data2) 

##Create histogram with required labels and color
par(mfrow=c(1,1), mar=c(5,4,4,2))
hist(powerData$Global_active_power, xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power", col = "red")

##Save a png of the plot !!double check file name!!
dev.copy(png, file = "plot1.png")
dev.off()