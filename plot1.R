## Plot 1: This is a histogram of Global Active Power (Column 3)

hist(as.numeric(febdata$Global_active_power), col = "red", main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)", ylab = "Frequency", breaks = 12,
    cex.main = 0.9, cex.lab = 0.8, cex.axis = 0.8)
