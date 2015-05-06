## This file is part of Project #1 for the Exploratory Data Analysis course.
##   This is the fourth of 4 files that will be written, plot1.R, Plot2.R, etc.,
##   which will each read in the data about an individual household's 
##   electrical power consumption.  All R programs are to extract the data ONLY
##   for the days 2007-02-01 and 2007-02-02.  The program code in this file, in
##   particular, will use the data to create a four plots on the same page in a 
##   2x2 configuration.  All plots will use the day(date) on the x-axis and
##   clockwise from the top left will have Global Active Power, Voltage,
##   Energy sub metering, and Global_reactive_power on the y-axis.
##   Plots 1 and 4 have already been created for other portions of this 
##   project, so that program code will be "re-used" in this file.
##
## Begin by reading in the first 100 rows (plus the header row) of the data file.
file <- "household_power_consumption.txt"
data_1 <- read.table(file, header = TRUE, sep = ";", nrows = 100)
##
## "Determine" the class of each column of the data set.
classes <- sapply(data_1, class)
##
## Read in ALL the data from the file and assign the columns to have the classes
##   as determined by the "sapply()" function.  Ensure that the "?" is replaced
##   by NA in the data.
data1 <- read.table(file, header = TRUE, sep = ";", colClasses = classes, na.strings = "?")
##
## Convert the class of the "Date" column from "factor" to "date".
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
##
##
## Subset the data so that we are only holding onto data that was collected
##   on February 1st and 2nd of 2007.
data2 <- data1[data1$Date == "2007-02-01" | data1$Date == "2007-02-02",]
##
## Create dates/times of class POSIXlt.
temp <- paste(as.character(data2$Date), as.character(data2$Time))
date_time <- as.POSIXlt(temp)
##
##
## Create the desired plot (note - NOT scatterplot) of the Global Active Power
##   versus the day. 
##   NOTE:  the "day" labels on the x-axis tick marks are a result of the 
##          POSIXlt class for date_time.
##   NOTE:  in the plot function, type = "l" implies a "line" plot.
##   NOTE:  in the legend function, bty = "n" implies NO box around the legend
xlabel1_1 <- ""
xlabel1_2 <- "datetime"
xlabel2_1 <- xlabel1_1
xlabel2_2 <- xlabel1_2
ylabel1_1 <- "Global Active Power"
ylabel1_2 <- "Voltage"
ylabel2_1 <- "Energy sub metering"
ylabel2_2 <- "Global_reactive_power"
png(filename = "plot4.png")
par(mfrow = c(2,2) )
plot(date_time, data2$Global_active_power, xlab = xlabel1_1, ylab = ylabel1_1, type = "l")
plot(date_time, data2$Voltage, xlab = xlabel1_2, ylab = ylabel1_2, type = "l")
plot(date_time, data2$Sub_metering_1, xlab = xlabel2_1, ylab = ylabel2_1, type = "l")
points(date_time, data2$Sub_metering_2, col = "red", type = "l")
points(date_time, data2$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(date_time, data2$Global_reactive_power, xlab = xlabel2_2, ylab = ylabel2_2, type = "l")
dev.off()