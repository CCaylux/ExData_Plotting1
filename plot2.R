## We use a shorter file for development purposes, you can access it in the git repo
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

##plotting
png("/Users/clementcaylux/Documents/Coursera Classes/Data_Science/ExploData/ExData_Plotting1/plot2.png",width=480, height=480, units="px", res=100)

plot(sub$datetime,sub$Global_active_power,"l",xlab='', ylab='Global Active Power (kilowatts)',xaxt="n")
axis(1, at=c(min(sub$datetime), min(sub$datetime)+86400,  min(sub$datetime)+2*86400),
     labels=c("Thu", "Fri", "Sat"))

dev.off()
