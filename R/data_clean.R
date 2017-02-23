library(stringr)
library(dplyr)
e07 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/2007_expenditures.pdf", pages = seq(7,46,1), guess = TRUE, method = "data.frame")
e07[40] <- NULL
e07[[33]]$States.Total <- "$0"
e04 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/2004ExpendituresReport.pdf", pages = seq(14,53,1), guess = TRUE, method = "data.frame")
e03 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/2003ExpenditureReport_Jan05.pdf", pages = seq(14,48,1), guess = TRUE, method = "data.frame")
e02 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/2002ExpenditureReport_Jan05.pdf", pages = seq(14,50,1), guess = TRUE, method = "data.frame")
e01 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/2001ExpenditureReport_Jan05.pdf", pages = seq(14,48,1), guess = TRUE, method = "data.frame")
e00 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/FY_2000.pdf", pages = seq(13,45,1), guess = TRUE, method = "data.frame")

e05 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/Expenditures_Report_FY05-06.pdf", pages = seq(10,63,1), guess = TRUE, method = "data.frame")
colnames(e05[[6]])<-c("Rank", "Species", "Status", "FWS.Total", "Other.Fed", "Fed.Total", "States.Total", "Species.Total")
colnames(e05[[26]])<-c("Rank", "Species", "Status", "FWS.Total", "Other.Fed", "Fed.Total", "States.Total", "Species.Total")
colnames(e05[[56]])<-c("Rank", "Species", "Status", "FWS.Total", "Other.Fed", "Fed.Total", "States.Total", "Species.Total")

e06 <- extract_tables("https://www.fws.gov/Endangered/esa-library/pdf/Expenditures_Report_FY05-06.pdf", pages = seq(64,117,1), guess = TRUE, method = "data.frame")
colnames(e06[[19]])<-c("Rank", "Species", "Status", "FWS.Total", "Other.Fed", "Fed.Total", "States.Total", "Species.Total")

e14[72]<- NULL

clean <- function(frame){
  frame <- frame[!is.na(frame$Rank), ]
  frame <- frame[,which(sapply(frame, class) != "logical")]
  cols <- grep("FWS.Total|Other.Fed|Fed.Total|States.Total", colnames(frame))
  for(i in cols){
    frame[,i]<- sapply(1:length(frame[,i]), function(x,y) if (y[x,i] == "" & y[x,i+1] != ""){
      y[x,i] <- y[x,i+1]}else{y[x,i] <- y[x,i]}, 
      y = frame, USE.NAMES = FALSE)
  }
  #frame <- frame[,-which(sapply(frame, function(x) "" %in% x))]
  columns <- grep("Status|FWS.Total|Other.Fed|Fed.Total|States.Total|Species.Total", colnames(frame))
  frame <- frame[ , columns]
  #colnames(frame) <- c("Status", "FWS_tot", "other_fed", "Fed_tot", "State_tot", "Species_tot" )
}

clean14 <- function(frame){
  frame <- frame[!is.na(frame$Rank), ]
  frame <- frame[,which(sapply(frame, class) != "logical")]
  cols <- grep("FWS.Total|Other.Fed|Federal.Total|States.Total", colnames(frame))
  for(i in cols){
    frame[,i]<- sapply(1:length(frame[,i]), function(x,y) if (y[x,i] == "" & y[x,i+1] != ""){
      y[x,i] <- y[x,i+1]}else{y[x,i] <- y[x,i]}, 
      y = frame, USE.NAMES = FALSE)
  }
  #frame <- frame[,-which(sapply(frame, function(x) "" %in% x))]
  columns <- grep("Status|FWS.Total|Other.Fed|Federal.Total|States.Total|Species.Total", colnames(frame))
  frame <- frame[ , columns]
  #colnames(frame) <- c("Status", "FWS_tot", "other_fed", "Fed_tot", "State_tot", "Species_tot" )
  for(i in frame)
}


df2007 <- as.data.frame(lapply(bind_rows(lapply(e07, clean)), trimws))
df2006 <- as.data.frame(lapply(bind_rows(lapply(e06, clean)), trimws))
df2005 <- as.data.frame(lapply(bind_rows(lapply(e05, clean)), trimws))
df2004 <- as.data.frame(lapply(bind_rows(lapply(e04, clean)), trimws))
df2014 <- as.data.frame(lapply(bind_rows(lapply(e14, clean14)), trimws))

df2014 <- as.data.frame(lapply(df2014, trimws))
df2014$Year <- 2014
df2014[,2:6] <- sapply(df2014[,2:6], function(x) as.numeric(gsub("\\$|,", "", x)))




as.numeric(gsub("\\$|,", "", i))
