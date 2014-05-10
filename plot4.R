file<-"/Users/clementcaylux/Documents/Coursera Classes/Data_Science/ExploData/ExData_Plotting1/household_power_consumption.txt"

## possibility to use a shorter file for development purposes, please comment 
##the following line if you want to use the whole data
file<-("/Users/clementcaylux/Documents/Coursera Classes/Data_Science/ExploData/ExData_Plotting1/household_power_consumption_feb_2007.txt")

## read the data
data<-read.table(file,sep=";",header=TRUE)

## add the dateTime column to use later in plot
datetime<-strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S')

## convert date in date format
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data<-cbind(data,datetime)


## reducing file to correct dates
sub<-subset(data, data$Date>=as.Date("1/2/2007","%d/%m/%Y") & Date<=as.Date("2/2/2007","%d/%m/%Y"))

## plotting options
png("/Users/clementcaylux/Documents/Coursera Classes/Data_Science/ExploData/ExData_Plotting1/plot4.png",width=480, height=480, units="px", res=100)
par(mfrow=c(2,2))

## set first plot row 1 col 1
plot(sub$datetime,sub$Global_active_power,"l",xlab='', ylab='Global Active Power',xaxt="n",cex.lab=0.6)
axis(1, at=c(min(sub$datetime), min(sub$datetime)+86400,  min(sub$datetime)+2*86400),
     labels=c("Thu", "Fri", "Sat"))


## set second plot row 1 col 2
plot(sub$datetime,sub$Voltage,"l",xlab='datetime', ylab='Voltage',xaxt="n",xaxp=c(234,246,2))
axis(1, at=c(min(sub$datetime), min(sub$datetime)+86400,  min(sub$datetime)+2*86400),
     labels=c("Thu", "Fri", "Sat"))

## set third plot row 2 col 1
plot(sub$datetime,sub$Sub_metering_1,type="l",xlab='', ylab='Energy sub metering',xaxt="n",cex.lab=0.6)
axis(1, at=c(min(sub$datetime), min(sub$datetime)+86400,  min(sub$datetime)+2*86400),labels=c("Thu", "Fri", "Sat"))
legend("topright",cex=0.6,bty="n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(sub$datetime,sub$Sub_metering_2,col="red")
lines(sub$datetime,sub$Sub_metering_3,col="blue")

## set fourth plot row 2 col 2
plot(sub$datetime,sub$Global_reactive_power,"l",xlab='datetime', ylab='Global_reactive_power',xaxt="n",cex.lab=0.6)
axis(1, at=c(min(sub$datetime), min(sub$datetime)+86400,  min(sub$datetime)+2*86400),
     labels=c("Thu", "Fri", "Sat"))


##adding requested data
##save in png file
dev.off()