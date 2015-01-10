plot4 <-function(directory){
    ##read the txt file from directory
    alldata<-read.table(file=directory,stringsAsFactors = FALSE,sep = ";",header = TRUE)
    ##select data of interst(1/2/2007 and 2/2/2007)
    dataoi <- alldata[alldata$Date=="1/2/2007"|alldata$Date=="2/2/2007",]
    

    ##change the format to numeric
    active_power1 <- as.numeric(dataoi$Global_active_power,sep = " ")
    voitage1 <- as.numeric(dataoi$Voltage,sep = " ")
   
   s1 <- as.numeric(dataoi$Sub_metering_1,sep = " ")
   s2 <- as.numeric(dataoi$Sub_metering_2,sep = " ")
   s3 <- as.numeric(dataoi$Sub_metering_3,sep = " ")
   
   
   reactive_power1 <- as.numeric(dataoi$Global_reactive_power,sep = " ")
    ##open the png device
    png("plot4.png")
    
    ##2*2layout
    par(mfrow = c(2,2))
    
    
    ##paint the plot1
    plot(active_power1,type = "l",xaxt = "n",ylab = "Global Active Power",xlab = " ")
    ##add axis_lab
    axis(side = 1,at = 0,labels = "Thu")
    axis(side = 1,at = 1440,labels = "Fri")
    axis(side = 1,at = 2880,labels = "Sat")
    
   ##paint the plot2
    plot(voitage1,type = "l",xaxt = "n",ylab = "Voltage",xlab = "datetime")
    ##add axis_lab
    axis(side = 1,at = 0,labels = "Thu")
    axis(side = 1,at = 1440,labels = "Fri")
    axis(side = 1,at = 2880,labels = "Sat")
    
    
    ##paint the plot3
    plot(s1,type = "l",bg =NULL, col = "grey",xaxt = "n",ylab = "Energy sub metering",xlab = " ")    ##add axis_lab
    lines(s2,col="red")
    lines(s3,col="blue")
    ##add legend
    legend("topright",bty = "n",lty = 1,col = c("grey","red","blue"),legend = c("Submetering_1","Submetering_2","Submetering_3"))
    ##add axis_labels
    axis(side = 1,at = 0,labels = "Thu")
    axis(side = 1,at = 1440,labels = "Fri")
    axis(side = 1,at = 2880,labels = "Sat")
    
    ##paint the plot4
    plot(reactive_power1,type = "l",xaxt = "n",ylab = "Global_reactive_power",xlab = "datetime")
    ##add axis_lab
    axis(side = 1,at = 0,labels = "Thu")
    axis(side = 1,at = 1440,labels = "Fri")
    axis(side = 1,at = 2880,labels = "Sat")
    
    
    ##close the png dev
    dev.set(4)
   
    dev.off()
}