#load data
power_consuption <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
#using data from the dates 2007-02-01 and 2007-02-02
power_consuption <-subset(power_consuption, Date=="1/2/2007" | Date=="2/2/2007")
#removing dataset missing values coded as ?
power_consuption <- subset(power_consuption, Global_active_power != "?")
#Global_active_power has to be numeric, changing the scale to fit with the desired output
power_consuption$Global_active_power <- as.numeric(power_consuption$Global_active_power)
power_consuption$Global_active_power <-power_consuption$Global_active_power*2/1000
#Adds a new column concatenating the date and time and transforming it to a posix
power_consuption$dateTime <- paste(power_consuption$Date, power_consuption$Time, sep=',')
power_consuption$dateTime <- strptime(power_consuption$dateTime, "%d/%m/%Y,%H:%M:%S")
#create a png file called plot1
png(file = "plot2.png")
#create the histogram

plot(power_consuption$dateTime, power_consuption$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
#close the device
dev.off()