complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        files_full <- list.files(directory, full.names=TRUE) ##get all the files
        nobs <- data.frame()                              
        complete_data <- data.frame()                                    
        for (i in id){                                                   
          nobs <- sum(complete.cases(read.csv(files_full[i]))) ##get the number of complete items
          sub_set <- data.frame(id = i, nobs = nobs) ##set the data of this dataframe            
          complete_data = rbind(complete_data, sub_set) ##append the data to itself                             
        }
        return(complete_data) ##return dataset
}
