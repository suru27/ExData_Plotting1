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
par(mfrow=c(2,2), mar=c(4,4,2,2))
with(power_subset, {
  plot(Global_active_power~date_with_time, type="l",xlab="",ylab="Global Active Power")
  plot(Voltage~date_with_time, type="l",xlab="datetime",ylab="Voltage")
  with(power_subset,
       {
         plot(Sub_metering_1~date_with_time, type="l", xlab="",ylab="Energy sub metering")
         lines(Sub_metering_2~date_with_time,col='Red')
         lines(Sub_metering_3~date_with_time,col='Blue')
         legend("topright", col=c("black", "red", "blue"), text.font = 1,cex=.8,bty="n",lty=1, lwd=2, 
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
         })
  
  plot(Global_reactive_power~date_with_time, type="l",xlab="datetime",ylab="Global_reactive_power")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
