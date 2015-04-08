plot1 <- function() {
    ## Read data file
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows= 2075259, na.strings="?",
                          colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

    ## Keep only the data between 2007-02-01 and 2007-02-02
    data <- subset(data, as.Date(Date, "%d/%m/%Y") <= "2007-02-02" & as.Date(Date, "%d/%m/%Y") >= "2007-02-01")
    
    ## Histogram plot
    hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    
    ## Save the plot to PNG file
    dev.copy(png, file="plot1.png", width=480, height=480)
    dev.off()
}