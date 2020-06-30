library(lubridate)
library(dplyr)

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- fulldata %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
data <- data %>% mutate(Date_time = paste(Date, Time))
data <- data %>% mutate(Date_time = dmy_hms(Date_time))

with(data, hist(Global_active_power, main = "Global Active Power",
                xlab = "Global Active Power", col = "#ff2600"))

dev.copy(png, filename = "plot1.png")
dev.off()
