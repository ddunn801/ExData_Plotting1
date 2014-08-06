setwd("C:\\Users\\ddunn\\Dropbox\\DD Cloud\\Courses\\Coursera - Exploratory Data Analysis\\Week 1\\ExData_Plotting1")

d0 <- read.table("household_power_consumption.txt",
                 header=TRUE,sep=";",stringsAsFactors=FALSE)
d1 <- d0
d1$Date <- strptime(d1$Date,format="%d/%m/%Y")
d1$Date <- as.Date(d1$Date)

d2 <- d1[d1$Date>="2007-02-01"&d1$Date<="2007-02-02",]
d2$DateTime <- as.POSIXct(paste(d2$Date,d2$Time),format="%Y-%m-%d %H:%M:%S")
d2$Global_active_power <- as.numeric(d2$Global_active_power)
d2$Global_reactive_power <- as.numeric(d2$Global_reactive_power)
d2$Voltage <- as.numeric(d2$Voltage)
d2$Global_intensity <- as.numeric(d2$Global_intensity)
d2$Sub_metering_1 <- as.numeric(d2$Sub_metering_1)
d2$Sub_metering_2 <- as.numeric(d2$Sub_metering_2)
d2$Sub_metering_3 <- as.numeric(d2$Sub_metering_3)

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(d2$DateTime,d2$Global_active_power,type="n",
     main="",xlab="",ylab="Global Active Power")
lines(d2$DateTime,d2$Global_active_power,type="l")

plot(d2$DateTime,d2$Voltage,type="n",
     main="",xlab="datetime",ylab="Voltage")
lines(d2$DateTime,d2$Voltage,type="l")

plot(d2$DateTime,d2$Sub_metering_1,type="n",
     main="",xlab="",ylab="Energy sub metering")
lines(d2$DateTime,d2$Sub_metering_1,type="l",col="black")
lines(d2$DateTime,d2$Sub_metering_2,type="l",col="red")
lines(d2$DateTime,d2$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),bty="n",lwd=c(2.5,2.5,2.5),
       pt.cex=0.8,col=c("black","red","blue"))

plot(d2$DateTime,d2$Global_reactive_power,type="n",
     main="",xlab="datetime",ylab="Global_reactive_power")
lines(d2$DateTime,d2$Global_reactive_power,type="l")

dev.off()

