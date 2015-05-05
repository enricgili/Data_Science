best <- function(state ='', outcome = '') {
        ## Read outcome data
        sourceFile <- 'rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv'
        data <- read.csv(sourceFile, colClasses = "character")
        
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
        
        #Look for the hospital
        
        subset <- data[data[,7]==state,]
        
        if (outcome=='heart attack'){                
                outcomeState <- (subset[,11])
        }else if(outcome=="heart failure"){
                outcomeState <- (subset[,17])
        } else {
                outcomeState <- (subset[,23])
        }
        
        ## Return hospital name in that state with lowest 30-day death
        
        min <- min(outcomeState, na.rm = TRUE)
        min_index <- which(outcomeState == min)
        hospital_name <- subset[min_index, 2]
        print(hospital_name)
        
        
        ## rate
        
        
        
        
}