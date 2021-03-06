# install package
#install.packages("sqldf")
library(sqldf);

# Read only needed data
householdPower <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

# Convert data type
householdPower$DT <- paste(householdPower$Date, householdPower$Time)

householdPower$DT <- strptime(householdPower$DT, format="%d/%m/%Y %H:%M:%S")

# Open the png file
png(filename="plot4.png")

par(mfrow=c(2,2))
with(householdPower,plot(DT,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
with(householdPower,plot(DT,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(householdPower,plot(DT,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(householdPower,lines(DT,Sub_metering_2,col="red"))
with(householdPower,lines(DT,Sub_metering_3,col="blue"))
legend("topright",lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), bty="n")
with(householdPower,plot(DT,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

# Close device
dev.off()