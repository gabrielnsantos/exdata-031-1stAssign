plot3 <- function(File)
{
        household_power_consumption <- read.csv(File, sep=";")
        BASE <- subset(household_power_consumption, as.Date(Date, '%d/%m/%Y') == '2007-02-01' | as.Date(Date,'%d/%m/%Y') == '2007-02-02')
        BASE2 <-  within(BASE, { timestamp=format(as.POSIXct(paste(Date, Time), format = "%d/%m/%Y%H:%M:%S"), "%d/%m/%Y %H:%M:%S") })
        
        png(file = "plot3.png", width = 480, height = 480)
        
        plot(strptime(BASE2$timestamp, '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(BASE2$Sub_metering_1)), type = "n", xlab = "", ylab = "Energy sub metering")
        
        lines(strptime(BASE2$timestamp, '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(BASE2$Sub_metering_1)))
        lines(strptime(BASE2$timestamp, '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(BASE2$Sub_metering_2)), col = "red")
        lines(strptime(BASE2$timestamp, '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(BASE2$Sub_metering_3)), col = "blue")
        
        legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))
        
        dev.off()
}