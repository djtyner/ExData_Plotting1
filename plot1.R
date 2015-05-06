## This file is part of Project #1 for the Exploratory Data Analysis course.
##   This is the first of 4 files that will be written, plot1.R, Plot2.R, etc.,
##   which will each read in the data about an individual household's 
##   electrical power consumption.  All R programs are to extract the data ONLY
##   for the days 2007-02-01 and 2007-02-02.  The program code in this file, in
##   particular, will use the data to create a histogram of Global Active Power.
##
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
## Draw a histogram of the data for the Global Active Power.
title <- "Global Active Power"
xlabel <- "Global Active Power (kilowatts)"
png(filename = "plot1.png")
hist(data2$Global_active_power, col = "red", main = title, xlab = xlabel)
dev.off()