library(lubridate)
library(dplyr)

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- fulldata %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
data <- data %>% mutate(Date_time = paste(Date, Time))
data <- data %>% mutate(Date_time = dmy_hms(Date_time))

png("plot3.png")

with(data, {plot(Date_time, Sub_metering_1, type = "l",
                ylab = "Energy sub metering",
                xlab = "", xaxt="n")
    axis(1, at = c(data$Date_time[1],data$Date_time[1441], data$Date_time[2880]), labels=c("Thu", "Fri", "Sat"))
    points(Date_time, Sub_metering_2, type = "l", col = "red")
    points(Date_time, Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = "solid", col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })


dev.off()