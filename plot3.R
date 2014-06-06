
setwd("~/ExData_Plotting1")

d<- read.table("household_power_consumption.txt",
               sep=';',header=TRUE,stringsAsFactors = FALSE)

d$dateTime <- paste(d$Date,d$Time)
d$Date1 <- as.Date(d$Date, "%d/%m/%Y")
d.a <- d[d$Date1 == '2007-02-01',]
d.b <- d[d$Date1 == '2007-02-02',]
d.c <- rbind(d.a,d.b)
d.c$dateTime <- strptime(d.c$dateTime,format = '%d/%m/%Y %H:%M:%S')

d.c$Time <- strptime(d.c$Time,format = '%H:%M:%S')

d.c$Global_active_power <- as.numeric(d.c$Global_active_power)
d.c$Global_reactive_power <- as.numeric(d.c$Global_reactive_power)
d.c$Voltage <- as.numeric(d.c$Voltage)
d.c$Global_active_power <- as.numeric(d.c$Global_active_power)
d.c$Global_intensity <- as.numeric(d.c$Global_intensity)
d.c$Sub_metering_1 <- as.numeric(d.c$Sub_metering_1)
d.c$Sub_metering_2 <- as.numeric(d.c$Sub_metering_2)
d.c$Sub_metering_3 <- as.numeric(d.c$Sub_metering_3)



#plot3
png('plot3.png',height=480, width=480, units='px')
plot(d.c$dateTime,d.c$Sub_metering_1,type='l',ylab='Energy sub metering',xlab = '')
lines(d.c$dateTime,d.c$Sub_metering_2,col='red')
lines(d.c$dateTime,d.c$Sub_metering_3,col='blue')
legend('topright', lwd=1,col = c('black','red','blue'),
c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()

