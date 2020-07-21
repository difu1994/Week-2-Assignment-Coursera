#Write a function that reads a directory full of files
#Reports the number of completely observed cases in each data file
#Function should return a data frame 
#First column is the name of the file and second column is the number of complete cases.


directory <- c("specdata")
complete <- function(directory, id = 1:332) {
  
  output <- data.frame("Filename" = character(), "Values" = numeric())
  #create empty 'output' data frame with columns names of specific type of objects
  
  for (i in id){          #for each element in 'id' vector
    
    setwd(directory)        #enter directory with csv files
    
    x <- as.character(i)   #convert id from numeric to character
    
    if(i < 10) {                               #if single digit id, add 2 zeroes
      filename <- paste("00", x, ".csv", sep = "")
    } else if(i >= 10 && i <100) {            #if double digit id, add 1 zero
      filename <- paste("0", x, ".csv", sep = "")
    } else {                                    #if triple digit id, add no zeroes
      filename <- paste(x, ".csv", sep = "")
    }
    
    filedata <- read.csv(file = filename, header = TRUE) #read .csv file in specific directory
    
    setwd('..')             #move up one folder back to original directory
    
    newdata <- na.omit(filedata) #data ignoring rows containing NA in either columns
    
    output[i, ] <- list(filename, nrow(newdata))   #ith row of data frame
                                                   #Use list to keep numeric property
    
    finaloutput <- na.omit(output)
    finaloutput2 <- finaloutput
    rownames(finaloutput2) <- c(1:nrow(finaloutput2))
    
    filename <- ""          #clear filename for next iteration
  }  
  
  
  finaloutput2
  
  
}

    
dput(complete, file = "complete.R") #use file = "" to specify what to save as











