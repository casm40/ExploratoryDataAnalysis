## Plot 2: This is a scatterplot of Global Active Power (Column 3) against time (Column 1)

library(lubridate)
plot(as.numeric(febdata$Global_active_power) ~ febdata$datetime, type = "n",
    ylab = "Global Active Power (kilowatts)", xlab = "", cex.axis = 0.8, cex.lab = 0.8)
lines(febdata$datetime, febdata$Global_active_power, type = "l")
