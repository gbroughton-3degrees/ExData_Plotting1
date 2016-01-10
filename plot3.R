library(data.table)
library(ggplot2)

setwd("C:/Users/Gary/Documents/R Files/EDA/Assignment1")

# should have defined column types in th read.delim call, but subsetting by date is a real mess
#data <- fread("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)

day_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") #|| data$Date == as.Date('2-2-2007')")
day_data$Date <- as.Date(day_data$Date)

png('plot3.png', width=480, height=480)

plot(day_data$Sub_metering_1, type = "l", ylab="Energy sub metering", col="black")
legend("topright", legend = "Sub_metering_1")
par(new=T)
plot(day_data$Sub_metering_2, type = "l", ylab="", col="red")
legend("topright", legend = "Sub_metering_2")
par(new=T)
plot(day_data$Sub_metering_3, type = "l", ylab="", col="blue")
legend("topright", legend = "Sub_metering_3")
dev.off()