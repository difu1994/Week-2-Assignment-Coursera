function (directory, pollutant, id = 1:332) 
{
    output <- numeric()
    numberofrows <- integer()
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
        filename <- ""
        setwd("..")
        output[i] <- mean(filedata[, pollutant], na.rm = TRUE)
        numberofrows[i] <- nrow(na.omit(filedata[pollutant]))
    }
    totalsum <- sum(numberofrows, na.rm = TRUE)
    weigthedpercent <- numberofrows/totalsum
    final <- sum(output * weigthedpercent, na.rm = TRUE)
    print("The answer is")
    print(final)
}
