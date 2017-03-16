#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
header <-  dashboardHeader(disable = TRUE)

sidebar <-  dashboardSidebar(disable = TRUE)

body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom_styles.css")),

  navbarPage(div(column(4,tags$a(href = "http://www.defenders.org", tags$img(src = "01_DOW_LOGO_COLOR_300-01.png", height = "80px"))), column(8, h4("Defenders of Widlife", br(), "Center for Conservation Innovation"))),
   tabPanel(h4("Overview"),id = "summary", fluidPage(
    fluidRow(
     column(2,br()),
     column(8, h2("The Importance of Properly Funding the ESA"),
      h4("Since 1973, the Endangered Species Act (ESA) has been the most important U.S. law protecting
         plants and animals at risk of extinction. The ESA conserves species by regulating activities that may harm species and by
         facilitating species recovery. The U.S. Fish and Wildlife Service (FWS) is responsible for conserving the majority of
         listed species under the ESA, a function that has been impeded by inadequate funding from Congress."),
      br(),
      imageOutput("foxes"),
      h6("Photo courtesy of National Park Service"),
      br(),
      h4("Several fox species", tags$em(" (Urocyon littoralis) "), "of the Channel Islands were recovered and delisted in 2016.  Success stories such as these highlight
         the importance of properly funding the ESA.")
     ),
     column(2,br())
     ),br(),
    fluidRow(column(2),
             column(4, div(HTML('<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
                                <img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
                                <br />
                                This <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" rel="dct:type">work</span>
                                by <a xmlns:cc="http://creativecommons.org/ns" href="http://defenders.org" property="cc:attributionName" rel="cc:attributionURL">Defenders of Wildlife</a>
                                is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
                                <br />'),
                           style = "text-align: center")),
             column(1),
             column(2, div(HTML('<br /> Email questions or comments to <a href = "mailto:esa@defender.org"> esa@defenders.org </a>'), style = "text-align: center"))
             )
    )),

   tabPanel(h4("Funding Needs"), id = "panel2", fluidPage(
    fluidRow(column(3, br()), column(9, h4("Species Recovery Funding and Status"))),
    fluidRow(
     column(4, plotlyOutput("pie"), height = 600),
     column(4, plotlyOutput("bar"), height = 600),
     column(4,
      h2("Species Recovery Has Been",br(),"Chronically Underfunded"),
      h4("Congress has provided only a small fraction of the funds needed for recovery.
          Data from Gerber (2016) shown here illustrate this shortchanging.
         From 1980 to 2014, the vast majority of listed species with recovery plans were underfunded - receiving
         less than 90% of the amount needed for recovery.  Because funding is correlated with
         improvement in species status, only 15% of species improved in status from 1989 - 2011."),
      br(),
      h6("Source: ", a(href = "http://www.pnas.org/content/113/13/3563.full?tab=ds", "Gerber, LR (2016). PNAS 113(13): 3563-3566"))
      )
    )
   )),

   tabPanel(h4("Funding Trends"), id = "panel3", fluidPage(
     fluidRow(
       column(8, plotlyOutput("appropriation"), height = 600),
       column(4,
              h2("Funding Has Not Kept Pace",br(),"with Species Listings"),
              h4("Not only has Congress underfunded recovery for decades, but the average dollar per species has decreased since 2010.
                 This drop has occurred across all endangered species programs at FWS.
                 This decline is the result of the ESA budget consistently decreasing, combined with the continued increase in the number of listed species.",
                 br(),br(), "Use the dropdown button to see total annual appropriations."),
              br(),
              h6("Source: ", a(href = "https://www.fws.gov/budget/", "FWS Budget Justification"))
       )
     )
   )),

   tabPanel(h4("Spending Trends"), id = "panel4", fluidPage(
     fluidRow(
       column(8, plotlyOutput("spending"), height = 600),
       column(4,
              h2("Federal Agencies Have Been Spending Less on Listed Species"),
              h4("So far we have focused on how much Congress has appropriated to FWS.  Here, we show how much
                 federal agencies report spending on listed species.  Like appropriations, spending has declined in recent years -
                 since 2011 for FWS, and 2012 for all other federal agencies combined.
                 This graph shows trends in the average spending per species, and
                 the average spending on species in the top 5% of expenditures.  As you can see, spending on the top 5% is roughly
                 10x higher than for the average species.",br(),br(),
                 "You can switch the view to see expenditures reported by FWS, or other Federal agencies."),
              br(),
              h6("Source: ", a(href = "https://www.fws.gov/Endangered/esa-library/index.html", "FWS Expenditure Reports"))
       )
     )
   )),

   tabPanel(h4("State Spending"), id = "panel5", fluidPage(
     fluidRow(
       column(8, plotlyOutput("years"), height = 600),
       column(4,
              h2("Most Spending for ESA Activities",br(),"Comes From Federal Agencies"),
              h4("On average, states spend 26% as much as FWS, and 4% as much as other federal agencies. This pattern has persisted over time.
                 The amount states spend is highly relevant to current discussions about their role in implementing the ESA."),
              br(),
              h6("Source: ", a(href = "https://www.fws.gov/Endangered/esa-library/index.html", "FWS Expenditure Reports"))
              )
              )
       )), fluid=TRUE
  )
)

dashboardPage(header, sidebar, body, skin = "blue")

