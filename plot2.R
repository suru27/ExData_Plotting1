# Extraxcting data from input file
power<-read.csv("household_power_consumption.txt",header = TRUE,sep=';',na.strings = "?")
str(power)

# Extract required dates from input data set
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
str(power_subset)
power_subset<-subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert into date format
power_subset$date_with_time <- as.POSIXct(paste(as.Date(power_subset$Date), power_subset$Time))

# Create required graphics
with(power_subset,plot(Global_active_power~date_with_time, type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Save the plot into ping type file and close active device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()



 

