# Extraxcting data from input file
power<-read.csv("household_power_consumption.txt",header = TRUE,sep=';',na.strings = "?")
str(power)

# Convert into date format
power$Date<-as.Date(power$Date,format="%d/%m/%Y")

# Extract required dates from input data set
power_subset<-subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")

# Create required histogram
hist(power_subset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Save the plot into ping type file and close active device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
