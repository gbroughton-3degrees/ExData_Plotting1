library(data.table)
library(ggplot2)

setwd("C:/Users/Gary/Documents/R Files/EDA/Assignment1")

# should have defined column types in th read.delim call, but subsetting by date is a real mess
#data <- fread("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = FALSE)


day_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") #|| data$Date == as.Date('2-2-2007')")
day_data$Date <- as.Date(day_data$Date)

png('plot4.png', width=480, height=480)
par(mfrow = c(2,2))

# line chart
plot(day_data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)")

# line chart
plot(day_data$Voltage, type = "l", ylab="Voltage")

# submetering
plot(day_data$Sub_metering_1, type = "l", ylab="Energy sub metering", col="black")
legend("topright", legend = "Sub_metering_1")
par(new=T)
plot(day_data$Sub_metering_2, type = "l", ylab="", col="red")
legend("topright", legend = "Sub_metering_2")
par(new=T)
plot(day_data$Sub_metering_3, type = "l", ylab="", col="blue")
legend("topright", legend = "Sub_metering_3")

# line chart
plot(day_data$Global_reactive_power, type = "l", ylab="Global Reactive Power")

dev.off()