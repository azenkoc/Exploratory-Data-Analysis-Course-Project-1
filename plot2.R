#Azen Koc plot 2
png("plot2.png")
alldata<-fread("household_power_consumption.txt")
alldata$Date<-as.Date(alldata$Date,"%d/%m/%Y")
t1<-as.Date("2007-02-01","%Y-%m-%d")
t2<-as.Date("2007-02-02","%Y-%m-%d")
data<-alldata[alldata$Date>=t1&alldata$Date<=t2]
timeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
y<-as.numeric(data$Global_active_power)
#IMPORTANT
#System language is Turkish so it gives turkish weekdays
plot(timeDate,y,ylab = "Global Active Power (kilowatts)",type = "l",xlab = " Week Days (In Turkish)")
dev.off()