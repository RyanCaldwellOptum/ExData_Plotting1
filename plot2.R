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


#Plot 2
png("plot2.png",
    width = 480,
    height = 480)


plot(x = data$times,
     y = data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")


dev.off()