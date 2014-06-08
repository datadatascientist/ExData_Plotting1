## Load the data from 'household_power_consumption.txt' corresponding to dates 1/2/2007 and 2/2/2007
## Assummes 'household_power_consumption.txt' is in the working directory
library(sqldf)
file <- "household_power_consumption.txt"
householdpower <- read.csv2.sql(file, sql = "select * from file where Date in ('01/02/2007', '02/02/2007')")

## Open png device; create 'plot1.png' in working directory
png(file = "plot1.png")

## Create plot and send to file
with(householdpower, hist(Global_active_power, main = "Global Active Power", 
                          xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red"))

## Close the png file device
dev.off()