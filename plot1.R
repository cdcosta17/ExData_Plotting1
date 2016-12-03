# Downloading the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/power.zip", method = "curl")
unzip("./data/power.zip", list = TRUE)

# Storing the data in a variable and taking a subset of the required data
power <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
power$Date <- as.Date(power$Date,format = "%d/%m/%Y")
powerSub <- subset(power, power$Date=="2007-02-01" | power$Date=="2007-02-02")

# Creating the plot
hist(powerSub$Global_active_power, col = "red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")

# Copying the plot and saving in a png file
dev.copy(png,file = "plot1.png",height=480,width=480)
dev.off()