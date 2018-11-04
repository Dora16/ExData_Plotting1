library (data.table)
x=fread("household_power_consumption.txt",sep = ";", header = TRUE, na.strings ="?")
png(filename = "plot1.png",width = 480, height = 480)
hist(x$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frenquency")
dev.off()

# subset dataset on dates 1/2/2007 and 2/2/2007

x <- subset(x, 

Date %in% c("1/2/2007", "2/2/2007"))

# create single POSIXlt class field from Date and Time string fields

x$datetime <- strptime(paste(x$Date, x$Time), 

                                    "%d/%m/%Y %H:%M:%S")
# launch PNG file device (i.e. create output PNG file)

png(file="plot2.png", width=480,height=480)

# create plot (will be output to PNG file)

with(x, plot(datetime, Global_active_power, type = "l", 

                          xlab = "", ylab = "Global Active Power (kilowatts)"))

# close PNG file device

dev.off()

# launch PNG file device (i.e. create output PNG file)
png(file="plot3.png", width=480,height=480)

# create plot (will be output to PNG file)

with(x, plot(datetime, Sub_metering_1, type = "l", 

                          xlab = "", ylab ="Energy sub metering"))
with(x, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(x, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), 

       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),

       lty = c(1, 1, 1))
# close PNG file device

dev.off()

# launch PNG file device (i.e. create output PNG file)

png(file="plot4.png", width=480,height=480)




# initialise 2x2 plot window

par(mfrow=c(2,2))




# create subplot 1

with(x, plot(datetime, Global_active_power, type = "l", 

                          xlab = "", ylab = "Global Active Power"))




# create subplot 2

with(x, plot(datetime, Voltage, type = "l"))




# create subplot 3

with(x, plot(datetime, Sub_metering_1, type = "l", 

                          xlab = "", ylab = "Energy sub metering"))

with(x, lines(datetime, Sub_metering_2, type = "l", col = "red"))

with(x, lines(datetime, Sub_metering_3, type = "l", col = "blue"))

legend("topright", col = c("black", "red", "blue"), 

       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),

       lty = c(1, 1, 1), bty = "n")




# create subplot 4

with(x, plot(datetime, Global_reactive_power, type = "l"))




# close PNG file device

dev.off()

