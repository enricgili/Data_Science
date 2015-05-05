rankhospital <- function(state ='', outcome ='', num = "best") {
        ## Read outcome data
        sourceFile <- 'rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv'
        data <- read.csv(sourceFile, colClasses = "character")
        
        ## Check that state and outcome are valid
        statelist <- unique(data[,7])
        outcomelist <- c("heart attack","heart failure","pneumonia")
        
        ## Check that state and outcome are valid
        if (is.element(toupper(state), statelist)){
                #print('state exists')
        } else {
                stop("invalid state")
        }
        
        if (is.element(tolower(outcome), outcomelist)){
                #print('outcome exists')
        } else {
                stop("invalid outcome")
        }
        
        # convert data into numbers
        data[, 11] <- as.numeric(data[, 11]) # heart attack
        data[, 17] <- as.numeric(data[, 17]) # heart failure
        data[, 23] <- as.numeric(data[, 23]) # pneumonia
        
        #create subste of rows that match the state
        subset <- data[data[,7]==state,]
        #print(nrow(subset))
        #subset <- subset[complete.cases(subset), ] #removes the NA rows
       
        
        
        if (num == "best") {
                num <- 1
        } else if (num == "worst"){
                num <- nrow(subset)
        } else if (is.numeric(x=num)){
                if(num<1 || num > nrow(subset)) {
                return(NA)
                }
        } else {
                stop('invalid num')
        }
        
        #print(num)
        
        if (outcome=='heart attack'){                
                subset <- subset[order(subset[,11],subset$Hospital.Name),]
        }else if(outcome=="heart failure"){
                subset <- subset[order(subset[,17],subset$Hospital.Name),]
        } else if(outcome=="pneumonia"){
                subset <- subset[order(subset[,23],subset$Hospital.Name),]
        }
        
        #print(subset[,2])

        hospitalname <- subset[num,]$Hospital.Name
        #print(hospitalname)
        return(hospitalname)
       
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
}