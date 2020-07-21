#WEEK 2

#Write 3 functions that are meant to interact with the dataset 
#332 CSV files with data for (PM) air pollution at 332 locations in US
#Each file contains data from a single monitor
#ID number for each monitor is contained in the file name. 
#Each file contains three variables:

##Date: the date of the observation in YYYY-MM-DD format (year-month-day)
##sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
##nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)


directory <- c("specdata")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  output <- numeric()
  numberofrows <- integer()
  
  for (i in id) {
    
    setwd(directory)        #enter directory with csv files
    
    x <- as.character(i)   #convert id from numeric to character
    
    if(i < 10) {                               #if single digit id, add 2 zeroes
        filename <- paste("00", x, ".csv", sep = "")
    } else if(i >= 10 && i <100) {            #if double digit id, add 1 zero
        filename <- paste("0", x, ".csv", sep = "")
    } else {                                    #if triple digit id, add no zeroes
        filename <- paste(x, ".csv", sep = "")
    }
    
    filedata <- read.csv(file = filename, header = TRUE)    #read .csv file
    
    filename <- ""          #clear filename for next iteration
    
    setwd('..')             #move up one folder to original directory
    
    
    output[i] <- mean(filedata[ , pollutant], na.rm = TRUE)   #mean at ith location in output vector
    
    numberofrows[i] <- nrow(na.omit(filedata[pollutant]))    #rows of pollutant ignoring NA
    
  }
  
  totalsum <- sum(numberofrows, na.rm = TRUE) #ignore NA
  weigthedpercent <- numberofrows/totalsum    #to find weighted percentage of each id for overall mean
  
  final <- sum(output*weigthedpercent, na.rm = TRUE) #ignore NA
  
  print("The answer is")
  print(final)
  
}



dput(pollutantmean, file = "pollutantmean.R") #use file = "" to specify what to save as














