plot1 <-function(directory){
    ##read the txt file from directory
    alldata<-read.table(file=directory,stringsAsFactors = FALSE,sep = ";",header = TRUE)
    ##select data of interst(1/2/2007 and 2/2/2007)
    dataoi <- alldata[alldata$Date=="1/2/2007"|alldata$Date=="2/2/2007",]
    ##change the format to numeric
    x <- as.numeric(dataoi$Global_active_power,sep = " ")
    ##open the png device
    png("plot1.png")
    ##paint the hist pictrue
    hist(x,freq = TRUE,breaks = 12,xlim = c(0,6),ylim = c(0,1200),xlab = "Global Active Power(kilowatts)",main = "Global Active Power",col = "red")
    ##close the png dev
    dev.set(4)
    dev.off()
}