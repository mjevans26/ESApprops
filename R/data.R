#' Data.frame containing appropriated funds for Endangered Species programs 1984 - 2016
#'
#' @format A data frame with 44 rows and 10 variables
#' \itemize{
#'   \item{Year}{Fiscal Year of reporting}
#'   \item{Species}{Number of species listed as Threatened or Endangered}
#'   \item{CPI}{}
#'   \item{CF2016}{Coversion factor to 2016 dollars}
#'   \item{ESNew}{Amount appropriated for Ecological Services}
#'   \item{ESOld}{Amount appropriated for Ecological Services}
#'   \item{ESP}{Amount appropriated for Endangered Species Program}
#'   \item{Recovery}{Amount appropriated for recovery}
#'   \item{ConsultOld}{Amount appropriated for consultation}
#'   \item{ConsultNew}{Amount appropriated for consultation}
#' }
#' @source \link{http://ecos.fws.gov/tess_public}
"funding"

#' Data.frame containing reported expenditures for listed species for FY 2008 - 2013
#'
#' @format A data frame with 173601 rows and 22 variables
#' \itemize{
#'   \item{Year}{Fiscal Year of reporting}
#'   \item{Group}{Taxonomic group of species, as recorded in ECOS}
#'   \item{Rank}{Species relative expenditures within fiscal year}
#'   \item{scientific}{Scientific name of species, as recorded in ECOS}
#'   \item{Common}{Common name of species, as recorded in ECOS}
#'   \item{Population}{FWS region responsible for recovery}
#'   \item{Status}{Listing status at time of report}
#'   \item{FWS_tot}{Expenditures reported by FWS in fiscal year}
#'   \item{other_fed}{Expenditures repored by other federal agencies in fiscal year}
#'   \item{Fed_tot}{All federal expenditures in fiscal year}
#'   \item{State_tot}{State expenditures in fiscal year}
#'   \item{Species_tot}{Total expenditures per species in fiscal year}
#'   \item{STATEFP}{The two-digit state FIPS code}
#'   \item{COUNTYFP}{The three-digit county FIPS code}
#'   \item{NAME}{State name}
#'   \item{GEOID}{The 6- to 7-digit county NS code}}
#'   \item{grand_per_cnty}{Total expenditures divided by number of counties in which species is listed, as recorded in ECOS}
#'   \item{fws_per_cnty}{FWS expenditures divided by number of counties in which species is listed, as recorded in ECOS}
#'   \item{other_per_cnty}{Expenditures reported by other federal agencies divided by number of counties in which species is listed, as recorded in ECOS}
#'   \item{fed_per_cnty}{Total federal expenditures divided by number of counties in which species is listed, as recorded in ECOS}
#'   \item{state_per_cnty}{Total state expenditures divided by number of counties in which species is listed, as recorded in ECOS}
#' }
#' @source \link{http://www.fws.gov/Endangered/esa-library}
"expenditures"

#'Data.frame containing reported expenditures for listed species for FY 2004 - 2007 and 2014.
#'
#'Description
#'
#'@format A TopoJSON characer vector
#'@source \url{}
"county_topo"

#' County-level occurrence of ESA-listed species
#'
#' The most-refined occurrence data available from the Fish and Wildlife Service
#' (FWS) for most species listed under the US Endangered Species Act (ESA) is
#' county-level data. This data was scraped from FWS's \href{http://ecos.fws.gov}{ECOS website}
#' and curated (checked, completed) by referencing other sources such as
#' \href{gbif.org}{GBIF} and \href{www.natureserve.org}{NatureServe}.
#'
#' @format A data frame with 6821 rows and 7 variables
#' \describe{
#' \item{\code{Status}}{Listing status at time of report}
#' \item{\code{FWS.Total}}{Expenditures reported by FWS in fiscal year}
#' \item{\code{Other.Fed}}{Expenditures repored by other federal agencies in fiscal year}
#' \item{\code{Fed.Total}}{All federal expenditures in fiscal year}
#' \item{\code{States.Total}}{State expenditures in fiscal year}
#' \item{\code{Species.Total}}{Total expenditures per species in fiscal year}
#' \item{\code{Year}}{Fiscal Year of reporting}
#' }
#' @source Scraped from \href{http://www.fws.gov/Endangered/esa-libray}{FWS's ESA Library}.
"df0714"
