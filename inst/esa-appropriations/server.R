library(shiny)

source("budget_graph.R")
source("spending_graph.R")
source("simple_graphs.R")
source("budget_change.R")

shinyServer(function(input,output, session){
  spending_graph(input, output, session)
  simple_graphs(input, output, session)
  budget_graph(input, output, session)
  tree_graph(input, output, session)

  output$defenders <- renderImage({
    height <- session$clientData$output_defenders_height
    if (height > 80) {
      height <- 80
    }
    list(src = "01_DOW_LOGO_COLOR_300-01.png",
         contentType = "image/png",
         alt = "Defenders of Wildlife", br(), "Endangered Species Program",
         height = height)
  }, deleteFile=FALSE)

  output$foxes <- renderImage({
    width <- session$clientData$output_foxes_width
    height <- session$clientData$output_foxes_height
    list(src = "Island_Fox.jpg",
         contentType = "image/jpg",
         height = height,
         alt = "Channel Island Fox")
  }, deleteFile = FALSE)

  output$yesterday <- renderText({
    paste0(as.character(format(Sys.Date()-1, "%m/%d/%Y")), ".")
  })
})
