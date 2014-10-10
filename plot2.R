##
## This script reproduces the plot2.png file from the ExData_Plotting1 assignment
##
## Niels Ole Dam, 10/10-2014
##

## Read the data
data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE )

## Convert the Date variable to the correct type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting to the required date interval
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Convert the other variables to the correct types
data$Time <- strptime(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Open the png device, plot to the file and close the device
png(filename="plot2.png")
par(mar=c(4,4,4,2))
plot(data$Time,
     data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

