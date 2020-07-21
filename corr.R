function (directory, threshold = 0) 
{
    complete <- dget("complete.R")
    vector <- as.numeric()
    compileddata <- complete(directory, 1:332)
    criteria <- compileddata["Values"] > threshold
    compileddata2 <- compileddata[criteria, ]
    for (i in compileddata2[, "Filename"]) {
        setwd(directory)
        filedata <- read.csv(file = i, header = TRUE)
        setwd("..")
        newdata <- na.omit(filedata)
        x <- newdata["sulfate"]
        y <- newdata["nitrate"]
        correlation <- cor(x, y)
        vector <- append(vector, correlation)
    }
    vector
}
