#plot2
colNames = as.character(read.table("./household_power_consumption.txt",sep = ";",nrows=1))
data = read.table("./household_power_consumption.txt",sep = ";",skip=1)
df =data.frame(matrix(unlist(data),ncol = length(data)))
names(df) = colNames
dated = df[df[,1]=="1/2/2007"|df[,1]=="2/2/2007",]

png("./plot2.png",width = 480,height = 480)
datetime = strptime(paste(dated[,1],dated[,2],sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,as.numeric(dated[,3]),type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()