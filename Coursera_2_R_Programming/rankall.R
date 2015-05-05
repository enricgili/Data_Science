rankall <- function(outcome, num = "best") {
        ## Read outcome data
        sourceFile <- 'rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv'
        data <- read.csv(sourceFile, colClasses = "character")
        
        ## Check that outcome is valid
        outcomelist <- c("heart attack","heart failure","pneumonia")
        
        if (is.element(tolower(outcome), outcomelist)){
                #print('outcome exists')
        } else {
                stop("invalid outcome")
        }
        #get full list of states and order alphabetically
        statelist <- sort(unique(data[,7]))
        
        
        #initialize data frame
        #rh <- data.frame(hospital=character(),state=character())
        
        hospitals <- character()
        states <- character()
        
        #loop through the list of states
       
        if (num == "best") { ranknum <- 1} else {ranknum <- num}
        
        for(i in 1:length(statelist)){
        #for(i in 1:10){
                subset <- data[data[,7]==statelist[i],]
                subset <- subset[complete.cases(subset), ]
                #print(subset[,7])
                
                if (num == "worst"){
                        ranknum <- length(subset[,7])
                }
                
                stateHosp <- rankhospital(statelist[i], outcome, ranknum) 
                states[i] <- statelist[i]
                hospitals[i] <- stateHosp
                
        }
       
       data.frame(hospital=hospitals,state=states,row.names=states)
        
}