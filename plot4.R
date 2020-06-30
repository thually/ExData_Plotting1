library(dplyr)

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- fulldata %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
data <- data %>% mutate(Date_time = paste(Date, Time))
data <- data %>% mutate(Date_time = dmy_hms(Date_time))

png("plot4.png")
par(mfrow = c(2,2))
with(data, {plot(Date_time, Global_active_power, type = "l",
                 ylab = "Global Active Power",
                 xlab = "")
    plot(Date_time, Voltage, type = "l",
         ylab = "Voltage",
         xlab = "datetime")
    plot(Date_time, Sub_metering_1, type = "l",
          ylab = "Energy sub metering",
          xlab = "")
        points(Date_time, Sub_metering_2, type = "l", col = "red")
        points(Date_time, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty = "n")
    plot(Date_time, Global_reactive_power, type = "l",
          xlab = "datetime")
    
})

dev.off()