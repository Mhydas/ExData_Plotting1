#
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# 
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# 
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'))

# Open PNG device and create image file with a size of 480x480 px.
png('plot3.png', width = 480, height = 480, units = 'px')

#
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# 
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# 
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'))

# Close device and retrieve .png from working directory.
dev.off()