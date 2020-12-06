powcon <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                   na.strings = "?", stringsAsFactors = FALSE)

powconsub <- subset(powcon, Date %in% c("1/2/2007", "2/2/2007"))

powconsub$Date <- as.Date(powconsub$Date, format = "%d/%m/%Y")

TimeDate <- paste(as.Date(powconsub$Date), powconsub$Time)

powconsub_TimeDate <- as.POSIXct(TimeDate)

with(powconsub, plot(Global_active_power ~ powconsub_TimeDate, type = "l",
       ylab = "Global Active Power (Kilowatts)", xlab = ""))

png("plot2.png", height = 480, width = 480)

dev.off()

