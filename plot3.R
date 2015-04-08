plot3 <- function() {
    ## Read data file
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows= 2075259, na.strings="?",
                          colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

    ## Keep only the data between 2007-02-01 and 2007-02-02
    data <- subset(data, as.Date(Date, "%d/%m/%Y") <= "2007-02-02" & as.Date(Date, "%d/%m/%Y") >= "2007-02-01")
    
    datetimes <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    ## Line plot with 3 variables
    par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,0,0), ps=12)
    with(data, plot(datetimes, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering"))
    lines(datetimes, data$Sub_metering_2, col="red")
    lines(datetimes, data$Sub_metering_3, col="blue")
    
    legend("topright", lty=1, col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Save the plot to PNG file
    dev.copy(png, file="plot3.png", width=480, height=480)
    dev.off()
}