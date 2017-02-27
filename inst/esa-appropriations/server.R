library(shiny)

source("budget_graph.R")
source("spending_graph.R")
source("simple_graphs.R")


shinyServer(function(input,output, session){
  spending_graph(input, output, session)
  simple_graphs(input, output, session)
  budget_graph(input, output, session)

  output$defenders <- renderImage({
    width <- session$clientData$output_defenders_width
    if (width > 100) {
      width <- 100
    }
    list(src = "01_DOW_LOGO_COLOR_300-01.png",
         contentType = "image/png",
         alt = "Defenders of Wildlife", br(), "Endangered Species Program",
         width=width)
  }, deleteFile=FALSE)

  output$yesterday <- renderText({
    paste0(as.character(format(Sys.Date()-1, "%m/%d/%Y")), ".")
  })
})
