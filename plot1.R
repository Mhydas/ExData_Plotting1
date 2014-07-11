# Open native device and show the histogram. We set the title and X-axis label. 
# The Y-axis label is perfect by default. We then set the color of the graph to red.
hist(electric$Global_active_power, main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)', col = 'red')

# Open PNG device and create image file with a size of 480x480 px.
png('plot1.png', width = 480, height = 480, units = 'px')

# Plot the above historgram to the PNG device.
hist(electric$Global_active_power, main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)', col = 'red')

# Close device and retrieve .png from working directory.
dev.off()
