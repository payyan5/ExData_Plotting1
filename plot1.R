##Loading the data
setwd(".\\R\\C4-ExploratoryDA\\Quizzes\\Week1")
filename <- "household_power_consumption.txt"
powerConsumption <- read.table(filename, header = TRUE, sep = ";", dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),col.names =c("Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),skip = 0)

#Converting the date data to Date type
powerConsumption$Date <- as.Date(powerConsumption$Date,"%d/%m/%Y")

# filtering-in the data for the dates 2007-02-01 and 2007-02-02
powerConsumption <- powerConsumption[powerConsumption$Date >= as.Date("2007-02-01") & powerConsumption$Date <= as.Date("2007-02-02"),]

#creating a png device to plot the histogram and to save as plot1.png
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
#plotting histogram	
hist(powerConsumption$Global_active_power, col= "red", main=" Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()

