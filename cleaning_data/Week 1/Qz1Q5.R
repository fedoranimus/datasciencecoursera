# Tim Turner
# Getting and Cleaning Data Coursera

# Create data object
data.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
data.filename <- 'ACS2.csv'

# Download data
download.file(data.url, data.filename, method='curl')

# Load Library
library(data.table)

# Read data
DT <- fread('ACS2.csv')

# Time
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])