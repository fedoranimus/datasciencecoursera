best <- function(state, outcome) {
  ## Read outcome data
  fullFrame <- read.csv('outcome-of-care-measures.csv', stringsAsFactors=FALSE, na.strings="Not Available")
  suppressWarnings(fullFrame[, 11] <- as.numeric(fullFrame[, 11])) #heart attack
  suppressWarnings(fullFrame[, 17] <- as.numeric(fullFrame[, 17])) #heart failure
  suppressWarnings(fullFrame[, 23] <- as.numeric(fullFrame[, 23])) #pneumonia
  
  #subset our data frame
  subsetDataFrame <- data.frame(State = names(tapply(fullFrame$State, fullFrame$State, 
                                              length)), Freq = tapply(fullFrame$State, fullFrame$State, length))
  #Change names of the subset data
  rownames(subsetDataFrame) <- NULL
  
  #get the columns we need for the outcome possibilities
  inputDfr <- data.frame(Outcome = c("heart attack", "heart failure", "pneumonia"), 
                         Col = c(11, 17, 23))
  
  #validate state and outcome input
  if (nrow(subsetDataFrame[subsetDataFrame$State == state, ]) == 0) 
    stop("invalid state")
  if (nrow(inputDfr[inputDfr$Outcome == outcome, ]) == 0) 
    stop("invalid outcome")
  
  ## Return hospital name in that state with lowest 30-day death rate
  stateDfr <- fullFrame[fullFrame$State == state, ]
  colNum <- inputDfr[inputDfr$Outcome == outcome, 2]
  rowNum <- which.min(stateDfr[, colNum])
  return(stateDfr[rowNum, ]$Hospital.Name)
}