library(lubridate)
library(dplyr)

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- fulldata %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
data <- data %>% mutate(Date_time = paste(Date, Time))
data <- data %>% mutate(Date_time = dmy_hms(Date_time))

with(data, plot(Date_time, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)",
                xlab = "", xaxt="n"))
axis(1, at = c(data$Date_time[1],data$Date_time[1441], data$Date_time[2880]), labels=c("Thu", "Fri", "Sat"))

dev.copy(png, filename = "plot2.png")
dev.off()