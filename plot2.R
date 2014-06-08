## Load the data from 'household_power_consumption.txt' corresponding to dates 1/2/2007 and 2/2/2007
## Assummes 'household_power_consumption.txt' is in the working directory
library(sqldf)
file <- "household_power_consumption.txt"
householdpower <- read.csv2.sql(file, sql = "select * from file where Date in ('01/02/2007', '02/02/2007')")

## Create a column 'Date_Time' coverting 'Date' and 'Time' into respective Date and Time formats
householdpower$Date_Time <- paste(householdpower$Date, householdpower$Time)
householdpower$Date_Time <- strptime(householdpower$Date_Time, "%d/%m/%Y %H:%M:%S")

## Open png device; create 'plot2.png' in working directory
png(file = "plot2.png")

## Create plot and send to file
plot(x = householdpower$Date_Time, y = householdpower$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Close the png file device
dev.off()