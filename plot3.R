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

# Plot first line of Date vs Sub metering. Set the y_axis lable now, as well
# as the X-axis.
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# Add a new line, in red, for sub meter 2
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# Add a new line, in blue, for sub meter 3
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

# Add a legend, in the topright corner. Set the proper names for the legend and that
# it should show line symbols in the specified colors, matching the lines of the plot.
legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'))

# Open PNG device and create image file with a size of 480x480 px.
png('plot3.png', width = 480, height = 480, units = 'px')

# Plot the first portion of the plot to the PNG device. 
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# Add the 2nd line to the plot in PNG
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# Add the 3rd line to the plot in PNG
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

# Add the legend to the PNG plot
legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'))

# Close device and retrieve .png from working directory.
dev.off()