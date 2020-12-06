powcon <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                   na.strings = "?", stringsAsFactors = FALSE)

powconsub <- subset(powcon, Date %in% c("1/2/2007", "2/2/2007"))

powconsub$Date <- as.Date(powconsub$Date, format = "%d/%m/%Y")

TimeDate <- paste(as.Date(powconsub$Date), powconsub$Time)

powconsub$TimeDate <- as.POSIXct(TimeDate)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(powconsub, {
  plot(Global_active_power ~ TimeDate, type = "l", 
       ylab = "Global Active Power (Kilowatts)", xlab = "")
  
  plot(Voltage ~ TimeDate, type = "l", 
       ylab = "Voltage (Volt)", xlab = "")
  
  plot(Sub_metering_1 ~ TimeDate, type = "l", 
       ylab = "Global Active Power (Kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ TimeDate, col = "red")
  lines(Sub_metering_3 ~ TimeDate, col = "blue")
  
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, bty="n", cex = 0.5,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power ~ TimeDate, type = "l", 
       ylab = "Global Reactive Power (Kilowatts)", xlab = "")
})

png("plot4.png", height = 480, width = 480)

dev.off()