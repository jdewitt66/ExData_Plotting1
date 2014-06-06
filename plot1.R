
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

#plot1
png(file='plot1.png',height=480, width=480, units='px')
hist(d.c$Global_active_power,xlab='Global Active Power (kilowatts)',
     main = 'Global Active Power', col = 'red')
dev.off()

