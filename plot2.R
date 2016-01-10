library(data.table)

setwd("C:/Users/Gary/Documents/R Files/EDA/Assignment1")

# should have defined column types in th read.delim call, but subsetting by date is a real mess
data <- fread("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)

day_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") #|| data$Date == as.Date('2-2-2007')")
day_data$Date <- as.Date(day_data$Date)

png('plot2.png', width=480, height=480)

plot(day_data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)")

dev.off()