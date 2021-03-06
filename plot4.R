## Plot 4: This plot consists of four line plots in a 2 x 2 grid.

## Set up grid with appropriate margins

par(mfrow = c(2, 2), oma = c(3, 1, 1, 1), mar = c(2, 4, 3, 1))

## Top Left plot: Plot 2, but kilowatts removed and smaller legends

library(lubridate)
plot(as.numeric(febdata$Global_active_power) ~ febdata$datetime, type = "n",
    ylab = "Global Active Power", xlab = "", cex.axis = 0.75, cex.lab = 0.75)
lines(febdata$datetime, febdata$Global_active_power, type = "l")

## Top right:

voltage <- as.numeric(febdata$Voltage)
time <- febdata$datetime
plot(voltage ~ time, type = "n", ylab = "Voltage", xlab = "datetime", cex.axis = 0.75,
    cex.lab = 0.75)
lines(time, voltage)

## Bottom left: Plot 3, but with box around legend removed and smaller legend text.

sub1 <- as.numeric(febdata$Sub_metering_1)
sub2 <- as.numeric(febdata$Sub_metering_2)
sub3 <- as.numeric(febdata$Sub_metering_3)
time <- febdata$datetime
plot(sub1 ~ time, type = "n", ylab = "Energy sub metering", xlab = "", cex.lab = 0.75,
    cex.axis = 0.75)
lines(time, sub1, type = "l", col = "black")
lines(time, sub2, type = "l", col = "red")
lines(time, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"), lwd = 1, horiz = FALSE, cex = 0.6, box.lwd = 0)
    
## Bottom right:

grp <- as.numeric(febdata$Global_reactive_power)
time <- febdata$datetime
plot(grp ~ time, type = "n", ylab = "Global_reactive_power", xlab = "datetime",
    cex.axis = 0.75, cex.lab = 0.75)
lines(time, grp)
