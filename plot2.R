plot2 <-function(directory){
    ##read the txt file from directory
    alldata<-read.table(file=directory,stringsAsFactors = FALSE,sep = ";",header = TRUE)
    ##select data of interst(1/2/2007 and 2/2/2007)
    dataoi <- alldata[alldata$Date=="1/2/2007"|alldata$Date=="2/2/2007",]
    ##change the format to numeric
    y <- as.numeric(dataoi$Global_active_power,sep = " ")
    ##open the png device
    png("plot2.png")
    ##paint the pictrue
    plot(y,type = "l",xaxt = "n",ylab = "Global Active Power (kilowatts)",xlab = " ")
    ##add axis_lab
    axis(side = 1,at = 0,labels = "Thu")
    axis(side = 1,at = 1440,labels = "Fri")
    axis(side = 1,at = 2880,labels = "Sat")
    ##close the png dev
    dev.set(4)
    dev.off()
}