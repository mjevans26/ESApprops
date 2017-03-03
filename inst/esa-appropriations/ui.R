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
     column(1,br()),
     column(10, h2("Funding the ESA"),
      h4("Since 1973, the Endangered Species Act (ESA) has been the most important U.S. law protecting
         plants and animals at risk of extinction, by prohibiting the take of species listed as either Endangered or Threatened.
         Additionally, the ESA is meant to
         facilitate the recovery of these listed species; returning them to a state in which they are
         no longer in danger of extinction.  This part of the ESA's mission has been largely impeded by
         a lack of funding needed to carry out the many activities needed to recover species.")
     ),
     column(1,br())
     ))),

   tabPanel(h4("Funding Needs"), id = "panel2", fluidPage(
    fluidRow(
     column(8, plotlyOutput("pie"), height = 600),
     column(4,
      h2("Starved to Death"),
      h4("Many species have failed to recover due to insufficient funding.
          Data from Gerber (2016) shown here illustrates this shortchanging.",br(),
         "From 1980 to 2014 the vast majorty of listed species received less than 90% of the funding
         needed for recovery, as identified by FWS when recovery plans are written.",br(),
         "Accordingly, only 15% of species showed increases in population sizes from 1989 - 2011.",br(),
         "Use the dropdown button to swith between charts showing funding, and status.")
      )
    )
   )),

   tabPanel(h4("Budgeting"), id = "panel3", fluidPage(
     fluidRow(
       column(8, plotlyOutput("appropriation"), height = 600),
       column(4,
              h2("Starved to Death"),
              h4("Funding for the ESA is appropriated annually by Congress, and is divided among different programs.", br(),
                 "As the number of listed species has continued to increase, the resources appropriated
                 to these programs has not kept pace.  Since 2010, there has been a sharp decrease
                 in ESA appropriated funds per listed species across all programs, due to consistent reductions
                 in the ESA budget.",br(), "Use the dropdown button to see the annual total appropriations.")
       )
     )
   )),

   tabPanel(h4("Spending"), id = "panel4", fluidPage(
     fluidRow(
       column(8, plotlyOutput("spending"), height = 600),
       column(4,
              h2("Trends in Spending"),
              h4("The amount spent on listed species has also declined since 2010.", br(),
                 "This graph shows trends in the average amount spent per listed species, and
                 the average amount spent on species in the top 5% of expenditures.",br(),
                 "You can switch the view to see expenditures reported by FWS, or other Federal agencies.")
       )
     )
   )),

   tabPanel(h4("State vs. Federal"), id = "panel5", fluidPage(
     fluidRow(
       column(8, plotlyOutput("years"), height = 600),
       column(4,
              h2("Federal vs. State Spending"),
              h4("The vast majority of funding for ESA activities comes from federal agencies,
                 a pattern that has persisted over time.", br(),
                 "The amount spent by states is inadequate to supplement already insufficient
                 federal funds, especially if they continue to decrease.")
              )
              )
       )),

   tabPanel(h4("States"), id = "panel6", fluidPage(
     fluidRow(
       column(8, plotlyOutput("states"), height = 600),
       column(4,
              h2("Variation Among States"),
              h4("While states spend less on listed species than federal agencies,
                 contributions vary among states.", br(),
                "This is due, in part, to variation in the number of species listed in
                a given state.  Shown here are the amounts spent on Endangered Species in each state,
                compared to a line depicting equal spending by states and FWS.")
       )
     )
   )), fluid=TRUE
  ),
  br(),
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
)

dashboardPage(header, sidebar, body, skin = "blue")

