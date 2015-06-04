# Get headers of the dataset
h <- readLines("household_power_consumption.txt",n=1)
h <- strsplit(h,";")
h <- h[[1]]

# Read the needed data
data <- read.table("household_power_consumption.txt",sep=";",col.names=h,na.strings="?",skip=66637,nrows=2880)

# Set the first 2 columns as Date/Time types
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)

d <- as.Date(data$Date,format="%d/%m/%Y")
t <- paste(data$Date,data$Time)
t <- strptime(t, format="%d/%m/%Y %H:%M:%S")

data$Date <- d
data$Time <- t

# Open the png file
png(filename="ExData_Plotting1/plot2.png")

# Plot
with(data,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=""))

# Close device
dev.off()