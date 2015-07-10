# Code by PWKhor, exdata-030, July 2015 class

# Plot 4

# Read in the data for 1/2/2007 and 2/2/2007
newdata1=read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
newdata2=subset(newdata1,newdata1$Date=="1/2/2007")
newdata3=subset(newdata1,newdata1$Date=="2/2/2007")

newdata4=rbind(newdata2,newdata3)
newdata4$DateTime=as.POSIXct(paste(newdata4$Date,newdata4$Time),format="%d/%m/%Y %H:%M:%S")

# Change from character variable to numeric variable
newdata4$Global_active_power=as.numeric(newdata4$Global_active_power)
newdata4$Global_reactive_power=as.numeric(newdata4$Global_reactive_power)
newdata4$Voltage=as.numeric(newdata4$Voltage)
newdata4$Global_intensity=as.numeric(newdata4$Global_intensity)
newdata4$Sub_metering_1=as.numeric(newdata4$Sub_metering_1)
newdata4$Sub_metering_2=as.numeric(newdata4$Sub_metering_2)
newdata4$Sub_metering_3=as.numeric(newdata4$Sub_metering_3)

# Plot 2 rows by 2 columns, plots will go by row first
par(mfrow=c(2,2))

# Plot 4a == Plot 2
plot(newdata4$DateTime,newdata4$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.axis=0.8,cex.lab=0.8)

# Plot 4b
plot(newdata4$DateTime,newdata4$Voltage,type="l",xlab="datetime",ylab="Voltage",cex.axis=0.8,cex.lab=0.8)

# Plot 4c == Plot 3
plot(newdata4$DateTime,newdata4$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",cex.axis=0.8,cex.lab=0.8)
lines(newdata4$DateTime,newdata4$Sub_metering_2,col="red")
lines(newdata4$DateTime,newdata4$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),cex=0.8,bty="n")

# Plot 4d
plot(newdata4$DateTime,newdata4$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",cex.axis=0.8,cex.lab=0.8)

# Save plot to file
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()
