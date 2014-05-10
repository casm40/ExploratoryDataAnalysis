## Plot 3: This is a scatterplot of Energy Sub Metering (Col 8,9,10) against time.

sub1 <- as.numeric(febdata$Sub_metering_1)
sub2 <- as.numeric(febdata$Sub_metering_2)
sub3 <- as.numeric(febdata$Sub_metering_3)
time <- febdata$datetime
plot(sub1 ~ time, type = "n", ylab = "Energy sub metering", xlab = "", cex.lab = 0.8,
    cex.axis = 0.8)
lines(time, sub1, type = "l", col = "black")
lines(time, sub2, type = "l", col = "red")
lines(time, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"), lwd = 1, horiz = FALSE, cex = 0.8)
