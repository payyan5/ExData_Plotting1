
##Loading the data
setwd(".\\R\\C4-ExploratoryDA\\Quizzes\\Week1")
filename <- "household_power_consumption.txt"
powerConsumption <- read.table(filename, header = TRUE, sep = ";", dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),col.names =c("Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),skip = 0)

#Converting the date data to Date type
powerConsumption$Date <- as.Date(powerConsumption$Date,"%d/%m/%Y")

# filtering-in the data for the dates 2007-02-01 and 2007-02-02
powerConsumption <- powerConsumption[powerConsumption$Date >= as.Date("2007-02-01") & powerConsumption$Date <= as.Date("2007-02-02"),]

#combining the date and time columns to a column called Datetime
a <- data.frame(as.POSIXct(paste(powerConsumption$Date,powerConsumption$Time), format = "%Y-%m-%d %H:%M:%S"))

names(a)[1] <- "Datetime"
powerConsumption <- cbind(powerConsumption, a)

#creating a png device to plot and to save as plot3.png

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot(x=powerConsumption$Datetime, y=powerConsumption$Sub_metering_1,  col='black', type='l', ylab = "Energy sub metering", xlab="")
points(x=powerConsumption$Datetime, y=powerConsumption$Sub_metering_2, col='red', type='l', lwd=1)
points(x=powerConsumption$Datetime, y=powerConsumption$Sub_metering_3, col='blue', type='l', lwd=1)
legend("topright", legendName, lty = legendType, col = legendColor)
dev.off()

