library(ggplot2)
library(plotly)
library(dplyr)
library(tidyr)
setwd("C:/Users/mevans/repos/ESApprops")

funding <- read.csv("funding.csv", header = TRUE, sep = ",")

#create 'years' dataframe
years <- mutate(TECP_domestic, Year = substr(First_Listed,9,12))%>%
  select(Year, Federal_Listing_Status, Lead_Region)%>%
  filter(Federal_Listing_Status == "Endangered"|Federal_Listing_Status == "Threatened")%>%
  filter(Lead_Region != "NMFS")

years$Status <- sapply(years$Federal_Listing_Status, function(x)
  if(x == "Proposed Endangered"|x == "Proposed Threatened"){
    "Proposed"}
  else{x})

years <- as.data.frame(group_by(years, Year, Federal_Listing_Status)%>%
  summarise(count = n())%>%
  spread(Federal_Listing_Status, count))

years$Year <- as.integer(years$Year)

impute <- data.frame(Year = seq(min(years$Year,na.rm=TRUE),
                                    max(years$Year,na.rm=TRUE),1))

years <- right_join(years, impute, by = c("Year"))
years$Endangered[is.na(years$Endangered)] <- 0
years$Threatened[is.na(years$Threatened)] <- 0
years$Total <- years$Endangered + years$Threatened

years <- mutate(years, cumm = cumsum(Total))

funding$Species <- years$cumm[years$Year > 1972]

expenditures <- read.csv("expenditures08_13.csv", header = TRUE, sep = ",")

spending <- filter(expenditures, Status == "E"|Status == "T")%>%
  group_by(Year, scientific)%>%
  summarise(FWS = first(FWS_tot),
            Fed = first(Fed_tot),
            State = first(State_tot),
            Total = first(Species_tot),
            Group = first(Group),
            Common = first(Common),
            Status = first(Status))

new_FWS <- filter(df0714, Status == "E"|Status == "T")%>%
  group_by(Year)%>%
  summarise(mn = mean(FWS.Total),
            s = sd(FWS.Total),
            U95 = quantile(FWS.Total, 0.95),
            L95 = quantile(FWS.Total, 0.05),
            minimum = min(FWS.Total),
            maximum = max(FWS.Total),
            top = mean(FWS.Total[FWS.Total > quantile(FWS.Total, .95)]))

FWS <- group_by(spending, Year)%>%
  summarise(mn = mean(FWS),
            s = sd(FWS),
            U95 = quantile(FWS, .95),
            L95 = quantile(FWS, .05),
            minimum = min(FWS),
            maximum = max(FWS),
            top = mean(FWS[FWS > quantile(FWS, .95)]))

FWS <- arrange(rbind(new_FWS, FWS), Year)

FWS$CF2016 <- funding$CF2016[funding$Year > 2003 & funding$Year < 2015]
