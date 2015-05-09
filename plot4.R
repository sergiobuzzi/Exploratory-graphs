# plot4

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
dat <- household_power_consumption
dat$Date=as.Date(dat$Date,format="%d/%m/%Y",origin="16/12/2006")
dat=rbind(dat[dat$Date=="2007-02-01",],dat[dat$Date=="2007-02-02",])
DateTime=strptime(paste(dat$Date, dat$Time, sep=" "), format="%Y-%m-%d %H:%M:%S",tz="Europe/Paris")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(DateTime, dat$Global_active_power, type = "l", 
     ylab="Global Active Power", xlab= " " )

plot(DateTime, dat$Voltage, type="l", ylab= "Voltage",
     xlab="datetime")

plot(DateTime, dat$Sub_metering_1, type = "l", 
     ylab="Energy sub metering", xlab= " " )
lines(DateTime, dat$Sub_metering_2, type = "l", 
      xlab= " ", col="red")
lines(DateTime, dat$Sub_metering_3, type = "l", 
      xlab= " ", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"), lty=1)

plot(DateTime, dat$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()