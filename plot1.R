#load data
power_consuption <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
#using data from the dates 2007-02-01 and 2007-02-02
power_consuption <-subset(power_consuption, Date=="1/2/2007" | Date=="2/2/2007")
#removing dataset missing values coded as ?
power_consuption <- subset(power_consuption, Global_active_power != "?")
#Global_active_power has to be numeric
power_consuption$Global_active_power <- as.numeric(power_consuption$Global_active_power)
#create a png file called plot1
png(file = "plot1.png")
#create the histogram
hist(power_consuption$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
#close the device
dev.off()