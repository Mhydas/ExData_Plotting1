#Read in only 2/1/07 & 2/2/07 data from the file. We are setting the separator as
# colon and since we are skipping the 1st line we will set the column names.
# We then let R know about the ? as the na string and specify the data to read in.
electric <- read.table('household_power_consumption.txt',sep = ';',
                       col.names = c('Date','Time','Global_active_power',
                                     'Global_reactive_power','Voltage',
                                     'Global_intensity','Sub_metering_1',
                                     'Sub_metering_2','Sub_metering_3'),
                       na.strings = c('?'), skip = 66637, nrows = 2880)

# Paste Date and Time together so x-axis has a refernce of timeline
electric$Date <- paste(electric$Date,':',electric$Time, sep = '')

# Set the dates to day of the week for later manipulation
electric$Date <- strptime(electric$Date,format = '%d/%m/%Y:%T')

# Set the parameters for the native device to accept 4 graphs, filled in by row
par(mfrow = c(2,2))

# Plot plot2 in the native device
plot(electric$Date,electric$Global_active_power, type = 'l',
     ylab = 'Global Active Power',xlab = '')

# Plot Date vs Voltage as second plot, upper right. 
plot(electric$Date,electric$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')

# Plot plot3 to the native device, lower left.
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# Continue plot3.
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# Continue plot3.
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

# Continue plot3.
legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'), bty = 'n')

# Plot Date vs Global reactive power as the 4th plot, lower right.
plot(electric$Date, electric$Global_reactive_power, type = 'l',
     ylab = 'Global_reactive_power', xlab = 'datetime')

# Open PNG device and create image file with a size of 480x480 px.
png('plot4.png', width = 480, height = 480, units = 'px', res = 70)

# par(mfrow = c(2,2), mar = c(2.1,2.1,2.1,2.1))
# Set the parameters for the native device to accept 4 graphs, filled in by row
par(mfrow = c(2,2))

# Plot plot2 in the native device
plot(electric$Date,electric$Global_active_power, type = 'l',
     ylab = 'Global Active Power',xlab = '')

# Plot Date vs Voltage as second plot, upper right. 
plot(electric$Date,electric$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')

# Plot plot3 to the native device, lower left.
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# Add line 2 to plot3.
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# Add line 3 to plot3.
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

# Add legend to plot3.
legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'), bty = 'n')

# Plot Date vs Global reactive power as the 4th plot, lower right.
plot(electric$Date, electric$Global_reactive_power, type = 'l',
     ylab = 'Global_reactive_power', xlab = 'datetime')

# Close device and retrieve .png from working directory.
dev.off()
