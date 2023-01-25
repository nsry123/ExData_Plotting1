#plot4
colNames = as.character(read.table("./household_power_consumption.txt",sep = ";",nrows=1))
data = read.table("./household_power_consumption.txt",sep = ";",skip=1)
df =data.frame(matrix(unlist(data),ncol = length(data)))
names(df) = colNames
dated = df[df[,1]=="1/2/2007"|df[,1]=="2/2/2007",]

png("./plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))
datetime = strptime(paste(dated[,1],dated[,2],sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,as.numeric(dated[,3]),type="l",xlab="",ylab = "Global Active Power (kilowatts)")
plot(datetime,as.numeric(dated[,5]),type="l",xlab="datetime",ylab = "Voltage")

plot(datetime,as.numeric(dated$Sub_metering_1),type="l",xlab="",ylab = "Energy sub metering")
lines(datetime,as.numeric(dated$Sub_metering_2),col="red")
lines(datetime,as.numeric(dated$Sub_metering_3),col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col = c("black","red","blue"))

plot(datetime, as.numeric(dated$Global_reactive_power),xlab="datetime",type="l",ylab = "Global_reactive_power")
dev.off()


