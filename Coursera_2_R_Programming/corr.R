corr <- function(directory = "specdata", threshold = 0) {
        corrvector <- numeric()
        listfiles = list.files(directory)
        for (i in seq(1,length(listfiles))){
        ##for (i in seq(1,1)){
                ##print(listfiles[i])
                filename <- paste(directory,"/",listfiles[i],sep="")
                filedata <- read.csv(filename)
                ok <- complete.cases(filedata$sulfate,filedata$nitrate)
                validrows <- filedata[ok,]
                ##print(validrows)
                if (nrow(validrows)>=threshold){
                        correlation <- cor(validrows$sulfate,validrows$nitrate)
                       ##print(nrow(validrows))
                        ##print(correlation)
                       corrvector <- c(corrvector,correlation)
                }
        }
        print(corrvector)
}