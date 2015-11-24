  rankall <- function(outcome, rankObj = "best") {
    ## Read outcome data
    fullFrame <- read.csv('outcome-of-care-measures.csv', stringsAsFactors=FALSE, na.strings="Not Available")
    suppressWarnings(fullFrame[, 11] <- as.numeric(fullFrame[, 11])) #heart attack
    suppressWarnings(fullFrame[, 17] <- as.numeric(fullFrame[, 17])) #heart failure
    suppressWarnings(fullFrame[, 23] <- as.numeric(fullFrame[, 23])) #pneumonia
    
    tableDfr <- data.frame(State = names(tapply(fullFrame$State, fullFrame$State, 
                                                length)), Freq = tapply(fullFrame$State, fullFrame$State, length))
    rownames(tableDfr) <- NULL
    
    inputDfr <- data.frame(Outcome = c("heart attack", "heart failure", "pneumonia"), 
                           Col = c(11, 17, 23))
    
    if (nrow(inputDfr[inputDfr$Outcome == outcome, ]) == 0) 
      stop("invalid outcome")
    
    nameChr <- character(0)
    
    for (stateChr in tableDfr$State) {
      stateDfr <- fullFrame[fullFrame$State == stateChr, ]
      colNum <- inputDfr[inputDfr$Outcome == outcome, 2]
      stateDfr <- stateDfr[complete.cases(stateDfr[, colNum]), ]
      stateDfr <- stateDfr[order(stateDfr[, colNum], stateDfr$Hospital.Name), 
                           ]
      
      if (rankObj == "best") 
        rankNum <- 1 else if (rankObj == "worst") 
          rankNum <- nrow(stateDfr) else suppressWarnings(rankNum <- as.numeric(rankObj))
      
      nameChr <- c(nameChr, stateDfr[rankNum, ]$Hospital.Name)
    }
    
    return(data.frame(hospital = nameChr, state = tableDfr$State))
  }