powcon <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                   na.strings = "?", stringsAsFactors = FALSE)

powconsub <- subset(powcon, Date %in% c("1/2/2007", "2/2/2007"))

powconsub$Date <- as.Date(powconsub$Date, format = "%d/%m/%Y")

hist(powconsub$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "Red")

png("plot1.png", width = 480, height = 480)

dev.off()
