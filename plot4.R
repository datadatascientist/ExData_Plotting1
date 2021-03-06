## Load the data from 'household_power_consumption.txt' corresponding to dates 1/2/2007 and 2/2/2007
## Assummes 'household_power_consumption.txt' is in the working directory
library(sqldf)
file <- "household_power_consumption.txt"
householdpower <- read.csv2.sql(file, sql = "select * from file where Date in ('01/02/2007', '02/02/2007')")

## Create a column 'Date_Time' coverting 'Date' and 'Time' into respective Date and Time formats
householdpower$Date_Time <- paste(householdpower$Date, householdpower$Time)
householdpower$Date_Time <- strptime(householdpower$Date_Time, "%d/%m/%Y %H:%M:%S")

## Open png device; create 'plot2.png' in working directory
png(file = "plot4.png")

## Split the device into four plotting regions
par(mfcol = c(2, 2))

## Create plots and send to file

## Create the 'Global Active Power' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

## Create the 'Energy sub metering' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Sub_metering_1, 
     type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_1)
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_2, col = "red")
lines(x = householdpower$Date_Time, y = householdpower$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")

## Create the 'Voltage' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

## Create the 'Global_reactive_power' vs 'Time' plot
plot(x = householdpower$Date_Time, y = householdpower$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

## Close the png file device
dev.off()

