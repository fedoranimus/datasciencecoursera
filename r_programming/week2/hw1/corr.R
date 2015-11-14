corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  files_full <- list.files(directory, full.names=TRUE) ##get all the files
  correlations <- c() ##initialize a vector of correlations
  for (i in files_full){ ##loop through all files
    file <-  read.csv(i) ##read in the file
    complete_cases <- file[complete.cases(file), ] ##get all complete cases
    if(nrow(complete_cases) > threshold) { ##if the number of complete rows is > threshold
      correlations <- c(correlations,cor(complete_cases$sulfate, complete_cases$nitrate)) ##compute the variance and correlation between sulfate and nitrate
    }
  }
  return(correlations) ##return correlations
  
  
}
