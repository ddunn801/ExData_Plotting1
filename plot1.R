setwd("C:\\Users\\ddunn\\Dropbox\\DD Cloud\\Courses\\Coursera - Exploratory Data Analysis\\Week 1\\ExData_Plotting1")

d0 <- read.table("household_power_consumption.txt",
                 header=TRUE,sep=";",stringsAsFactors=FALSE)
d1 <- d0
d1$Date <- strptime(d1$Date,format="%d/%m/%Y")
d1$Date <- as.Date(d1$Date)

d2 <- d1[d1$Date>="2007-02-01"&d1$Date<="2007-02-02",]
d2$Time <- strptime(d2$Time,format="%H:%M:%S")
d2$Global_active_power <- as.numeric(d2$Global_active_power)
d2$Global_reactive_power <- as.numeric(d2$Global_reactive_power)
d2$Voltage <- as.numeric(d2$Voltage)
d2$Global_intensity <- as.numeric(d2$Global_intensity)
d2$Sub_metering_1 <- as.numeric(d2$Sub_metering_1)
d2$Sub_metering_2 <- as.numeric(d2$Sub_metering_2)
d2$Sub_metering_3 <- as.numeric(d2$Sub_metering_3)

png(file="plot1.png",width=480,height=480)
par(mfrow=c(1,1))
hist(d2$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

