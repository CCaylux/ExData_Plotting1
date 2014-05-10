## We use a shorter file for development purposes, you can access it in the git repo
file<-("/Users/clementcaylux/Documents/Coursera Classes/Data_Science/ExploData/ExData_Plotting1/household_power_consumption_feb_2007.txt")

## read the data
data<-read.table(file,sep=";",header=TRUE)
## convert date in date format
data[,1]<-as.Date(data[,1],"%d/%m/%Y")


## reducing file to correct dates
sub<-subset(data, data$Date>=as.Date("1/2/2007","%d/%m/%Y") & Date<=as.Date("2/2/2007","%d/%m/%Y"))

# building the histogram
png("/Users/clementcaylux/Documents/Coursera Classes/Data_Science/ExploData/ExData_Plotting1/plot1.png",width=480, height=480, units="px", res=100)

hist(sub$Global_active_power,col='red',main='Global Active Power', xlab='Global Active Power (kilowatts)')

dev.off()
