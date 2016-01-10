# Tim Turner
# Getting and Cleaning Data Coursera

# Create data object
data.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
data.filename <- 'Frestaurants.xml'

# Download data
download.file(data.url, data.filename, method='curl')

# Library for xml
library(XML)

# Parse XML
doc <- xmlTreeParse('Frestaurants.xml', useInternalNodes = TRUE)

#define root
root <- xmlRoot(doc)

# List zips
zipcode <- xpathSApply(root, "//zipcode", xmlValue)

# tabulate zips
print(table(zipcode)[['21231']])