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