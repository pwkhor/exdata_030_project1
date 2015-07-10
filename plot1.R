# Code by PWKhor, exdata-030, July 2015 class

# Plot 1

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

# Plot only 1 graph
par(bg="white")
par(mfrow=c(1,1))

# Plot 1
hist(newdata4$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

# Save plot to file
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()
