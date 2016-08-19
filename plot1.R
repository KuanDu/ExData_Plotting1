# install package
install.packages("sqldf")
library(sqldf);

# Read only needed data
householdPower <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

# Open device
png(filename="plot1.png")

# plot
hist(householdPower$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# close device
dev.off()