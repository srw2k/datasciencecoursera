complete <- function(directory, id = 1:332) {
    nObs = vector("numeric", length = 0)
    
    for (i in id) {
        fileName <- sprintf("%03d.csv", i)
        filePath <- file.path(directory, fileName)
        dataSet <- read.csv(filePath)
        nComplete <- sum(as.numeric(complete.cases(dataSet)))
        nObs <- append(nObs, nComplete)
    }
    data.frame(id = id, nobs = nObs)
}