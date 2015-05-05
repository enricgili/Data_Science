pollutantmean <- function (directory = "specdata", pollutant = "sulfate", id = 1:332) {

        ##mydata = read.csv(filename)
        ##print (id)
        pollutantlist <- c(0)
        ##print(pollutantlist)
        for (i in seq(1,length(id))){
                filename <- paste(directory,"/",formatC(i, width=3, flag="0"),".csv",sep="")
                filedata <- read.csv(filename)
                
                templist <- filedata[,2]
                validValues <- templist[!is.na(templist)]
                pollutantlist <- c(pollutantlist,validValues)
                ##print(validValues)
               
             ## print("DONE!! ************************************************************" )
              ##print(i)
        }
        
        print(mean(pollutantlist))
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
       ## for (i in seq(1,length(id),1)) {        
         ##       filepath = "directory + name + csv
           ##     mydata = read.csv(filepath)
            ##    of the pollutant column get the !NA values and get the mean
             ##   ## append list to full list
##        }
       
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
}