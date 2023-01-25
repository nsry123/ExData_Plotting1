#plot1
colNames = as.character(read.table("./household_power_consumption.txt",sep = ";",nrows=1))
data = read.table("./household_power_consumption.txt",sep = ";",skip=1)
df =data.frame(matrix(unlist(data),ncol = length(data)))
names(df) = colNames
dated = df[df[,1]=="1/2/2007"|df[,1]=="2/2/2007",]

png("./plot1.png",width = 480,height = 480)
hist(as.numeric(dated[,3]),xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
dev.off()


