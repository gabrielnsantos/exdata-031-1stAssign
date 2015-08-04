plot1 <- function(File)
{
        household_power_consumption <- read.csv(File, sep=";")
        BASE <- subset(household_power_consumption, as.Date(Date, '%d/%m/%Y') == '2007-02-01' | as.Date(Date,'%d/%m/%Y') == '2007-02-02')
        
        png(file = "plot1.png", width = 480, height = 480)
        hist(as.numeric(as.character(BASE$Global_active_power)), col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", xlim = c(0,6))
        dev.off()
}