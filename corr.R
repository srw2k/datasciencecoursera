corr <- function(directory, threshold = 0) {
    completeOut <- complete(directory)
    cors = vector("numeric", length = 0)
    
    for (i in completeOut[ ,"id"]) {
        #print(completeOut[i,"nobs"])
        if (completeOut[i,"nobs"] > threshold) {
            fileName <- sprintf("%03d.csv", i)
            filePath <- file.path(directory, fileName)
            dataSet <- read.csv(filePath)
            cors <- append(cors,
                           cor(dataSet[ , "sulfate"],
                               dataSet[ , "nitrate"],
                               "pairwise.complete.obs"))
        }
    }
    cors
}