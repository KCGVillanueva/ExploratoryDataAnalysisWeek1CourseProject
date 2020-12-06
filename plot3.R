powcon <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                   na.strings = "?", stringsAsFactors = FALSE)

powconsub <- subset(powcon, Date %in% c("1/2/2007", "2/2/2007"))

powconsub$Date <- as.Date(powconsub$Date, format = "%d/%m/%Y")

TimeDate <- paste(as.Date(powconsub$Date), powconsub$Time)

powconsub$TimeDate <- as.POSIXct(TimeDate)

with(powconsub, {
  plot(Sub_metering_1 ~ TimeDate, type = "l",
       ylab = "Global Active Power (Kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ TimeDate, col = "red")
  lines(Sub_metering_3 ~ TimeDate, col = "blue")
})

legend("topright", col = c("Black", "Red", "Blue"), lty = 1, lwd = 1, cex = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png("plot3.png", height = 480, width = 480)

dev.off()
