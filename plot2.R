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

# Open native device and show the plot We set the Y-axis label and X-axis label. 
# Before setting the axis labels we told the plot to plot a line instead of the default.
plot(electric$Date,electric$Global_active_power, type = 'l',
     ylab = 'Global Active Power (kilowatts)',xlab = '')


# Open PNG device and create image file with a size of 480x480 px.
png('plot2.png', width = 480, height = 480, units = 'px')

# Plot the above to the PNG device.
plot(electric$Date,electric$Global_active_power, type = 'l',
     ylab = 'Global Active Power (kilowatts)',xlab = '')

# Close device and retrieve .png from working directory.
dev.off()