# install package
#install.packages("sqldf")
library(sqldf);

# Read only needed data
householdPower <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

# Convert data type
householdPower$DT <- paste(householdPower$Date, householdPower$Time)

householdPower$DT <- strptime(householdPower$DT, format="%d/%m/%Y %H:%M:%S")

# Open device
png(filename="plot2.png")

# Plot
with(householdPower,plot(DT,Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=""))

# Close device
dev.off()