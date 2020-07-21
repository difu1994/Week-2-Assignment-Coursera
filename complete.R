function (directory, id = 1:332) 
{
    output <- data.frame(Filename = character(), Values = numeric())
    for (i in id) {
        setwd(directory)
        x <- as.character(i)
        if (i < 10) {
            filename <- paste("00", x, ".csv", sep = "")
        }
        else if (i >= 10 && i < 100) {
            filename <- paste("0", x, ".csv", sep = "")
        }
        else {
            filename <- paste(x, ".csv", sep = "")
        }
        filedata <- read.csv(file = filename, header = TRUE)
        setwd("..")
        newdata <- na.omit(filedata)
        output[i, ] <- list(filename, nrow(newdata))
        finaloutput <- na.omit(output)
        finaloutput2 <- finaloutput
        rownames(finaloutput2) <- c(1:nrow(finaloutput2))
        filename <- ""
    }
    finaloutput2
}
