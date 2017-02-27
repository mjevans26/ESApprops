library(dplyr)
library(ecosscraper)
library(ggplot2)
library(plotly)
library(shinydashboard)
library(stringr)
library(tidyr)
library(viridis)

load("data/app_data.R")
data("TECP_domestic")

gerber2 <- group_by(gerber, O_U, change)%>%
  summarise( count = n())

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


spending <- as.data.frame(filter(expenditures, Status == "E"|Status == "T"|Status == "E*")%>%
  group_by(Year, scientific, Population)%>%
  summarise(FWS = first(FWS_tot),
            OFed = first(other_fed),
            State = first(State_tot),
            Total = first(Species_tot),
            Group = first(Group),
            Common = first(Common),
            Status = first(Status)))

new_FWS <- filter(df0714, Status == "E"|Status == "T"|Status == "E*")%>%
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

#create 'Fed' dataframe
Fed <- filter(spending, Status == "E"|Status == "T")%>%
  group_by(Year)%>%
  summarise(mn = mean(OFed),
            s = sd(OFed),
            U95 = quantile(OFed, .95),
            L95 = quantile(OFed, .05),
            minimum = min(OFed),
            maximum = max(OFed),
            top = mean(OFed[OFed > quantile(OFed, .95)]))

new_Fed <- filter(df0714, Status == "E"|Status == "T"|Status == "E*")%>%
  group_by(Year)%>%
  summarise(mn = mean(Other.Fed),
            s = sd(Other.Fed),
            U95 = quantile(Other.Fed, 0.95),
            L95 = quantile(Other.Fed, 0.05),
            minimum = min(Other.Fed),
            maximum = max(Other.Fed),
            top = mean(Other.Fed[Other.Fed > quantile(Other.Fed, .95)]))

Fed <- arrange(rbind(new_Fed, Fed), Year)

Fed$CF2016 <- funding$CF2016[funding$Year > 2003 & funding$Year < 2015]

#Create 'states' dataframe
states <- filter(expenditures, Status == "E"| Status == "T")%>%
  group_by(Year, scientific, STATE)%>%
  summarise(state = sum(state_per_cnty),
            fws = sum(fws_per_cnty))%>%
group_by(STATE)%>%
  summarise(species = n_distinct(scientific),
            state = mean(state),
            fws = mean(fws))

Years1 <- filter(expenditures, Status == "E"|Status == "T")%>%
  group_by(Year)%>%
  summarise(STATE = sum(state_per_cnty),
            FED = sum(fed_per_cnty))

Years2 <- filter(df0714, Status == "E"|Status == "T")%>%
  group_by(Year)%>%
  summarise(STATE = sum(States.Total),
            FED = sum(Fed.Total))

Years <- arrange(rbind(Years1, Years2), Year)
Years$CF2016 <- funding$CF2016[funding$Year > 2003 & funding$Year < 2015]


