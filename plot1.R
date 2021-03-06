hpc <- read.table("household_power_consumption.txt", sep = ";",header=TRUE, na.strings="?")
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
hpcp<-subset(hpc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

hist(hpcp$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()