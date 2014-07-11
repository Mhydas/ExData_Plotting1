
par(mfrow = c(2,2), mar = c(7,9,2,4))

plot(electric$Date,electric$Global_active_power, type = 'l',
     ylab = 'Global Active Power',xlab = '')

plot(electric$Date,electric$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')

#
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# 
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# 
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'))

plot(electric$Date, electric$Global_reactive_power, type = 'l',
     ylab = 'Global_reactive_power', xlab = 'datetime')

# Open PNG device and create image file with a size of 480x480 px.
png('plot4.png', width = 480, height = 480, units = 'px')

par(mfrow = c(2,2), mar = c(3,1,1,1))

plot(electric$Date,electric$Global_active_power, type = 'l',
     ylab = 'Global Active Power',xlab = '')

plot(electric$Date,electric$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')

#
plot(electric$Date,electric$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',xlab = '')

# 
lines(electric$Date,electric$Sub_metering_2, type = 'l', col = 'red')

# 
lines(electric$Date,electric$Sub_metering_3, type = 'l', col = 'blue')

legend('topright', legend = names(electric[7:9]),lwd = 1, col = c('black','red','blue'))

plot(electric$Date, electric$Global_reactive_power, type = 'l',
     ylab = 'Global_reactive_power', xlab = 'datetime')

# Close device and retrieve .png from working directory.
dev.off()
