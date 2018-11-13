#load data
power_consuption <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
#using data from the dates 2007-02-01 and 2007-02-02
power_consuption <-subset(power_consuption, Date=="1/2/2007" | Date=="2/2/2007")
#removing dataset missing values coded as ?
power_consuption <- subset(power_consuption, Sub_metering_1 != "?")
power_consuption <- subset(power_consuption, Sub_metering_2 != "?")
power_consuption <- subset(power_consuption, Sub_metering_3 != "?")
#converting the values to numeric
power_consuption$Sub_metering_1 <- as.numeric(power_consuption$Sub_metering_1)
power_consuption$Sub_metering_2 <- as.numeric(power_consuption$Sub_metering_2)
power_consuption$Sub_metering_3 <- as.numeric(power_consuption$Sub_metering_3)
#Adds a new column concatenating the date and time and transforming it to a posix
power_consuption$dateTime <- paste(power_consuption$Date, power_consuption$Time, sep=',')
power_consuption$dateTime <- strptime(power_consuption$dateTime, "%d/%m/%Y,%H:%M:%S")
#create a png file called plot1
png(file = "plot3.png", width = 480, height = 480)
#create the histogram
plot(power_consuption$dateTime, power_consuption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_consuption$dateTime,power_consuption$Sub_metering_2, col="red", type="l")
lines(power_consuption$dateTime,power_consuption$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
#close the device
dev.off()