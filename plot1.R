# plot1

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
dat <- household_power_consumption

dat$Date=as.Date(dat$Date,format="%d/%m/%Y",origin="16/12/2006")
dat=rbind(dat[dat$Date=="2007-02-01",],dat[dat$Date=="2007-02-02",])

DateTime=strptime(paste(dat$Date, dat$Time, sep=" "), format="%Y-%m-%d %H:%M:%S",tz="Europe/Paris")


png(filename = "plot1.png", width = 480, height = 480)
hist(dat$Global_active_power,col="red", 
main ="Global Active Power", xlab="Global Active Power (kilowatts)" )
dev.off()

