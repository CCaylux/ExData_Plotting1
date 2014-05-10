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

## plotting
## set first plot
##png("/Users/clementcaylux/Documents/Coursera Classes/Data_Science/ExploData/ExData_Plotting1/plot3.png",width=480, height=480, units="px", res=100)
plot(sub$datetime,sub$Sub_metering_1,type="l",xlab='', ylab='Energy sub metering',xaxt="n")
## set axis properties
axis(1, at=c(min(sub$datetime), min(sub$datetime)+86400,  min(sub$datetime)+2*86400),labels=c("Thu", "Fri", "Sat"))

## set legend properties
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##adding requested data
lines(sub$datetime,sub$Sub_metering_2,col="red")
lines(sub$datetime,sub$Sub_metering_3,col="blue")

##close device
##dev.off()