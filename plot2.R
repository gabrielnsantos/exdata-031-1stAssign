plot2 <- function(File)
{
        household_power_consumption <- read.csv(File, sep=";")
        BASE <- subset(household_power_consumption, as.Date(Date, '%d/%m/%Y') == '2007-02-01' | as.Date(Date,'%d/%m/%Y') == '2007-02-02')
        BASE2 <-  within(BASE, { timestamp=format(as.POSIXct(paste(Date, Time), format = "%d/%m/%Y%H:%M:%S"), "%d/%m/%Y %H:%M:%S") })
        
        png(file = "plot2.png", width = 480, height = 480)
        plot(strptime(BASE2$timestamp, '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(BASE2$Global_active_power)), type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
        lines(strptime(BASE2$timestamp, '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(BASE2$Global_active_power)))
        dev.off()
}