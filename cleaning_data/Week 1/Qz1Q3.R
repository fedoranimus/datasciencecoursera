# Tim Turner
# Getting and Cleaning Data Coursera

# Create data object
data.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
data.filename <- 'NGAP.xlsx'

# Download data
download.file(data.url, data.filename, method='curl')

# Library for Excel
library(xlsx)

# import rows and columns
rowIdx = 18:23
colIdx = 7:15

# Read data
NGAP <- read.xlsx('NGAP.xlsx', sheetIndex=1, rowIndex = rowIdx, colIndex = colIdx)

# Find the value of 
print(sum(NGAP$Zip*NGAP$Ext,na.rm=T))
