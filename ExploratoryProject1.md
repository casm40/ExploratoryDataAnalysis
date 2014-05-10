Exploratory Data Analysis Project 1
===================================
Introduction
------------
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

    Dataset: Electric power consumption [20Mb]

    Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

* Date: Date in format dd/mm/yyyy
* Time: time in format hh:mm:ss
* Global_active_power: household global minute-averaged active power (in kilowatt)
* Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
* Voltage: minute-averaged voltage (in volt)
* Global_intensity: household global minute-averaged current intensity (in ampere)
* Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
* Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
* Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

Loading the data
----------------

When loading the dataset into R, please consider the following:

The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).

We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

Note that in this dataset missing values are coded as ?.
Select the correct data
--------------------------

```r
library(lubridate)
setwd("~/Google Drive/Coursera/Data Analysis/Exploratory data analysis")
data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, 
    header = TRUE)
data$Date <- dmy(data$Date)  # converts to lubridate format
febdata <- data[data$Date > ymd(20070131) & data$Date < ymd(20070203), ]  # uses lubridate date filtering
febdata$datetime <- ymd_hms(paste(febdata$Date, febdata$Time))  # combines date and time into single variable
```


Making Plots
------------

Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

For each plot you should:
* Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
* Name each of the plot files as plot1.png, plot2.png, etc.
* Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.
* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files.

Plot 1
------
This is a histogram of Global Active Power (Column 3)


```r
hist(as.numeric(febdata$Global_active_power), col = "red", main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", ylab = "Frequency", breaks = 12, 
    cex.main = 0.9, cex.lab = 0.8, cex.axis = 0.8)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


Plot 2
------
This is a scatterplot of Global Active Power (Column 3) against time (Column 1)

```r
library(lubridate)
plot(as.numeric(febdata$Global_active_power) ~ febdata$datetime, type = "n", 
    ylab = "Global Active Power (kilowatts)", xlab = "", cex.axis = 0.8, cex.lab = 0.8)
lines(febdata$datetime, febdata$Global_active_power, type = "l")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


Plot 3
------
This is a scatterplot of Energy Sub Metering (Col 8,9,10) against time.

```r
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
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 

Plot 4
------
This plot consists of four line plots in a 2 x 2 grid.

```r
par(mfrow = c(2, 2), oma = c(3, 1, 1, 1), mar = c(2, 4, 3, 1))
```


### Top left
Plot 2, but kilowatts removed and smaller legends

```r
library(lubridate)
plot(as.numeric(febdata$Global_active_power) ~ febdata$datetime, type = "n", 
    ylab = "Global Active Power", xlab = "", cex.axis = 0.75, cex.lab = 0.75)
lines(febdata$datetime, febdata$Global_active_power, type = "l")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 


### Top right
Reduced legend and axis text size

```r
voltage <- as.numeric(febdata$Voltage)
time <- febdata$datetime
plot(voltage ~ time, type = "n", ylab = "Voltage", xlab = "datetime", cex.axis = 0.75, 
    cex.lab = 0.75)
lines(time, voltage)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 

### Bottom left
Plot 3, but with box around legend removed and smaller legend text.

```r
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
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 


### Bottom right
Reduced axis text size

```r
grp <- as.numeric(febdata$Global_reactive_power)
time <- febdata$datetime
plot(grp ~ time, type = "n", ylab = "Global_reactive_power", xlab = "datetime", 
    cex.axis = 0.75, cex.lab = 0.75)
lines(time, grp)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 

