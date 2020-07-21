#Write a function that takes directory of data files w/ threshold for complete cases 
#Calculates the correlation between sulfate and nitrate for monitor locations 
#Condition: number of completely observed cases is greater than the threshold.
#Function should return a vector of correlations for the monitors that meet the threshold requirement
#If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0


directory <- c("specdata")


corr <- function(directory, threshold = 0) {
  
  complete <- dget("complete.R")
  
  vector <- as.numeric()                      #create empty output numeric vector
  
  compileddata <- complete(directory, 1:332)  #find number of complete entries for each .csv file
  
  criteria <- compileddata["Values"] > threshold #define criteria based on threshold
  
  #newdataframe <- data.frame(filedata["sulfate"], filedata["nitrate"]) to extract two columns
  
  compileddata2 <- compileddata[criteria, ] #.csv files that fulfill criteria 
  
  
  for (i in compileddata2[ , "Filename"]) {   # i is the name of selected .csv file
    
    setwd(directory)        #enter directory with csv files
    
    filedata <- read.csv(file = i, header = TRUE) #read .csv file in specific directory
    
    setwd('..')             #move up one folder back to original directory
    
    newdata <- na.omit(filedata) #data ignoring rows containing NA in either columns
    
    x <- newdata["sulfate"]
    y <- newdata["nitrate"]
    correlation <- cor(x, y)      #correlation between nitrate and sulfate
    
    vector <- append(vector, correlation)   #append adds new elements to initial vector
  }
  vector          #return vector value
}


dput(corr, file = "corr.R") #use file = "" to specify what to save as  
















