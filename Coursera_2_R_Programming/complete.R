complete <- function (directory = "specdata", id = 1:332) {
        fullframe <- data.frame(numeric(),numeric())
        for (i in seq(1,length(id))){
                filename <- paste(directory,"/",formatC(id[i], width=3, flag="0"),".csv",sep="")
                filedata <- read.csv(filename)
                ##sulfatecases <- filedata$sulfate[!is.na(filedata$sulfate)]
                ##nitratecases <- filedata$nitrate[!is.na(filedata$nitrate)]
                ok <- complete.cases(filedata$sulfate,filedata$nitrate)
                valid <- filedata[ok,]
                numcases = nrow(valid)
                fullframe <- rbind(fullframe,c(id[i],numcases))                
        }
        names(fullframe) <- c("id","nobs")
        ##print(fullframe)
}
