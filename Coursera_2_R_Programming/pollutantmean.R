pollutantmean <- function (directory = "specdata", pollutant = "sulfate", id = 1:332) {
        pollutantlist <- vector('numeric')
        for (i in seq(1,length(id))){
                filename <- paste(directory,"/",formatC(id[i], width=3, flag="0"),".csv",sep="")
                filedata <- read.csv(filename)
                templist <- filedata[,pollutant]
                validValues <- templist[!is.na(templist)]
                pollutantlist <- c(pollutantlist,validValues)
        }
        print(mean(pollutantlist))
}