#Azen Koc R Plot 1
library(data.table)
png("plot1.png")
alldata<-fread("household_power_consumption.txt")
alldata$Date<-as.Date(alldata$Date,"%d/%m/%Y")
t1<-as.Date("2007-02-01","%Y-%m-%d")
t2<-as.Date("2007-02-02","%Y-%m-%d")
data<-alldata[alldata$Date>=t1&alldata$Date<=t2]
x<-as.numeric(data$Global_active_power)

hist(x,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()
