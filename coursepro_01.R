
#Course Project 1

#Our overall goal here is simply to examine how household energy usage varies 
#over a 2-day period in February, 2007. 


#Loading the data

file_01 <- "household_power_consumption.txt"
datos <- read.table(file_01, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#We will only be using data from the dates 2007-02-01 and 2007-02-02.

datos_date <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

#Making Plots

# Plot 1
activepower <- as.numeric(datos_date$Global_active_power)
png("plot1.png")
hist(activepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

# Plot 2

datetime <- strptime(paste(datos_date$Date, datos_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(datos_date$Global_active_power)
png("plot2.png")
plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# Plot 3


datetime <- strptime(paste(datos_date$Date, datos_date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(datos_date$Global_active_power)
subMetering1 <- as.numeric(datos_date$Sub_metering_1)
subMetering2 <- as.numeric(datos_date$Sub_metering_2)
subMetering3 <- as.numeric(datos_date$Sub_metering_3)

png("plot3.png")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()



#Plot 4

activepower <- as.numeric(datos_date$Global_active_power)
reactivepower <- as.numeric(datos_date$Global_reactive_power)
voltage <- as.numeric(datos_date$Voltage)
submeter1 <- as.numeric(datos_date$Sub_metering_1)
submeter2 <- as.numeric(datos_date$Sub_metering_2)
submeter3 <- as.numeric(datos_date$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submeter1, type="l", ylab="Energy submeter", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
