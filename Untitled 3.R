directory <- c("specdata")
id <- 10
threshold <- 400



compileddata <- complete(directory, 1:332)


criteria <- compileddata[ , "Values"] >= threshold


compileddata2 <- compileddata[criteria, ]
vector <- as.numeric()

for (i in compileddata2[ , "Filename"]) {
  
  setwd(directory)        #enter directory with csv files
  
  filedata <- read.csv(file = i, header = TRUE) #read .csv file in specific directory
  
  setwd('..')             #move up one folder back to original directory
  
  newdata <- na.omit(filedata) #data ignoring rows containing NA in either columns
  
  x <- newdata["sulfate"]
  y <- newdata["nitrate"]
  correlation <- cor(x, y)
  
  vector <- append(vector, correlation)
  
  

}  

