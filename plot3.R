hpc <- read.table("household_power_consumption.txt", sep = ";",header=TRUE, na.strings="?")
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
hpcp<-subset(hpc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
hpcp$DateTime=as.POSIXct(paste(hpcp$Date,hpcp$Time))
Sys.setlocale("LC_TIME", "C")

png("plot3.png", width=480, height=480)
plot(hpcp$Sub_metering_1~hpcp$DateTime,type="n", xlab="", ylab="Energy sub metering")
points(hpcp$Sub_metering_1~hpcp$DateTime, col="black", type="l")
points(hpcp$Sub_metering_2~hpcp$DateTime, col="red", type="l")
points(hpcp$Sub_metering_3~hpcp$DateTime, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

dev.off()