pollutantmean <- function(directory, pollutant, id = 1:332) {
    #Set up an empty data frame with the correct column types,
    #depending on the first specified file
    fileName <- sprintf("%03d.csv", id[1])
    filePath <- file.path(directory, fileName)
    dataSet <- read.csv(filePath)
    dataSet <- dataSet[-c(1:length(row.names(dataSet))), ]
    
    #Now process all the files
    for (i in id) {
        fileName <- sprintf("%03d.csv", i)
        filePath <- file.path(directory, fileName)
        nextData <- read.csv(filePath)
        dataSet <- rbind(dataSet,nextData)
    }
    correctColumn <- names(dataSet)==pollutant
    meanValue = mean(dataSet[,correctColumn], na.rm=TRUE)
    meanValue
}