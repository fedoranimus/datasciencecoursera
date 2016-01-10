# Tim Turner
# Getting and Cleaning Data Coursera

# Create data object
data.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
data.filename <- 'ACS.csv'

# Download data
download.file(data.url, data.filename, method='curl')

# Read data
ACS <- read.csv('ACS.csv')

# Tabulate value (VAL)
table(ACS$VAL)

# Get values above 1,000,000
print(table(ACS$VAL)[[24]])