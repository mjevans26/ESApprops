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
   tabPanel(h4("Overview"),id = "summary", icon=icon("binoculars"), fluidPage(
    fluidRow(
     column(12, h2("Funding the ESA"),
      h4("Since 1973, the Endangered Species Act (ESA) has listed over 2,000 species as
        'Threatened' or 'Endangered'. The Fish and Wildlife Service (FWS) provides a",
        a(href = "http://www.fws.gov/endangered/what-we-do/listing-overview.html", " detailed
        description of the listing process."),  "Below, you can explore the number of domestic listed
        species by year as of", textOutput("yesterday", inline=TRUE))
     )
     ))),

   tabPanel(h4("Pie Chart"), is = "panel2", icon = icon("binoculars"), fluidPage(
    fluidRow(
     column(8, plotlyOutput("pie"), height = 450),
     column(4,
      h2("Starved to Death"),
      h4("Many species have failed to recover due to insufficient funding.", br(),
         "Data from Gerber (2016) shown here illustrates the shortchanging.",br(),
         "Only XXX% of species recieve the level of funding needed for recovery and delisting,", br(),
         "as identified by FWS when recovery plans are written.")
      )
    )
   )),

   tabPanel(h4("Budgeting"), is = "panel3", icon = icon("binoculars"), fluidPage(
     fluidRow(
       column(8, plotlyOutput("appropriation"), height = 450),
       column(4,
              h2("Starved to Death"),
              h4("The budget for ESA is divided into funding for different programs.", br(),
                 "Since 2010, there has been a sharp decrease in ESA budgeted funds across the board.",br())
       )
     )
   )),

   tabPanel(h4("Spending"), is = "panel4", icon = icon("binoculars"), fluidPage(
     fluidRow(
       column(8, plotlyOutput("spending"), height = 450),
       column(4,
              h2("Starved to Death"),
              h4("The amount spent on listed species has also declined since 2010.", br(),
                 "Show trends in the average amount spent per listed species by FWS
                 and other federal agencies, as well as changes in the average amount
                 spend on the top 5%.",br())
       )
     )
   )),

   tabPanel(h4("States"), is = "panel5", icon = icon("binoculars"), fluidPage(
     fluidRow(
       column(8, plotlyOutput("states"), height = 450),
       column(4,
              h2("Variation Among States"),
              h4("States spend less on listed species than federal agencies.", br(),
                 "However, the contribution varies among statescompared to a line depicting equal spending by states and FWS.",br())
              )
              )
       )),

   tabPanel(h4("State vs. Federal"), is = "panel6", icon = icon("binoculars"), fluidPage(
     fluidRow(
       column(8, plotlyOutput("years"), height = 450),
       column(4,
              h2("Variation Among States"),
              h4("States spend less on listed species than federal agencies.", br(),
                 "However, the contribution varies among statescompared to a line depicting equal spending by states and FWS.",br())
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

