library(data.table)
library(lubridate)

setwd("C:/Users/rcaldwe4/Documents/Coursera/ExploringData/ExData_Plotting1")

data <- fread(file = "C:/Users/rcaldwe4/Documents/Coursera/ExploringData/household_power_consumption.txt",
              na.strings = "?")
data$date_time <- paste(data$Date,data$Time)
data$times <- dmy_hms(data$date_time)

begin_date <- as.Date("02/01/2007", format = "%m/%d/%Y")
end_date <- as.Date("02/02/2007", format = "%m/%d/%Y")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= begin_date & data$Date <= end_date,]



#Plot 1
png('plot4.png',
    width = 480,
    height = 480)


par(mfrow = c(2,2))

plot(x = data$times,
     y = data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(x = data$times,
     y = data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(x = data$times,
     y = data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
points(x = data$times,
       y = data$Sub_metering_2,
       type = "l",
       col = "red")
points(x = data$times,
       y = data$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), 
       lty = c(1,1,1),
       cex = 0.75, 
       bty = "n")

plot(x = data$times,
     y = data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")


dev.off()