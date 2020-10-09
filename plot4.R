#Azen Koc plot 4
library(data.table)
png("plot4.png")
#subsetting required time interval DATA
alldata<-fread("household_power_consumption.txt")
alldata$Date<-as.Date(alldata$Date,"%d/%m/%Y")
t1<-as.Date("2007-02-01","%Y-%m-%d")
t2<-as.Date("2007-02-02","%Y-%m-%d")
data<-alldata[alldata$Date>=t1&alldata$Date<=t2]
#data to be plotted
timeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
gActPow<-as.numeric(data$Global_active_power)
voltage<-as.numeric(data$Voltage)
gReacPow<-as.numeric(data$Global_reactive_power)
Sub_metering_1<-as.numeric(data$Sub_metering_1)
Sub_metering_2<-as.numeric(data$Sub_metering_2)
Sub_metering_3<-as.numeric(data$Sub_metering_3)
par(mfrow=c(2,2))

plot(timeDate,gActPow,ylab = "Global Active Power (kilowatts)",type = "l",xlab = " Week Days (In Turkish)")

plot(timeDate,voltage,ylab = "Voltage",xlab = " Week Days (In Turkish)",type = "l")

plot(timeDate,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "Weekdays (In Turkish)")
lines(timeDate, Sub_metering_2,type = "l",col="red")
lines(timeDate, Sub_metering_3, type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"),bty = "n")

plot(timeDate,gReacPow,ylab = "Global_reactive_power",xlab = " Week Days (In Turkish)",type = "l")

dev.off()