
directory <- "specdata"
id <- 10:15
pollutant <- "nitrate"

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
    
  output[i] <- mean(filedata[ , pollutant], na.rm = TRUE)
  numberofrows[i] <- nrow(na.omit(filedata[pollutant]))    #rows of pollutant ignoring NA

}

totalsum <- sum(numberofrows, na.rm = TRUE)
weigthedpercent <- numberofrows/totalsum

final <- sum(output*weigthedpercent)
