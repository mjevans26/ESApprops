spending_graph <- function(input, output, session){
output$spending <- renderPlotly({

plot_ly(type = "scatter", mode = "lines", line = list(color = "blue"))%>%
  add_trace(data = FWS, x = ~Year, y = ~ top*CF2016, line = list(color = "orange", dash = "dash"), name = "Mean of top 5%<br>(click to show)",
              text = ~paste("Mean spending on the top 5% of species<br>was $", format(top*CF2016, big.mark = ",", big.interval = 3), " in ", Year, sep = ""), hoverinfo = "text", visible = "legendonly")%>%
  #add_trace(data = FWS, x = ~Year, y = ~U95*CF2016, fill = "none", name = "95%")%>%
  add_trace(data = FWS, x = ~Year, y = ~mn*CF2016, name = "FWS",
            text = ~paste("FWS spent $", format(mn*CF2016, big.mark = ",", big.interval = 3), "<br>per species in ", Year, sep = ""), hoverinfo = "text")%>%

  #add_trace(data = Fed, x = ~Year, y = ~U95*CF2016, name = "95%", fill = "none", visible = F)%>%
  add_trace(data = Fed, x = ~Year, y = ~ top*CF2016, type = "scatter", name = "Mean of top 5%<br>(click to show)", line = list(color = "orange", dash = "dash"),
            text = ~paste("Mean spending on the top 5% of speicies was $", format(top*CF2016, big.mark = ",", big.interval = 3), " in ", Year, sep = ""), hoverinfo = "text", visible = F)%>%

  add_trace(data = Fed, x = ~Year, y = ~mn*CF2016, name = "Other Fed",
          text = ~paste("Other federal agencies spent<br>$", format(mn*CF2016, big.mark = ",", big.interval = 3), " per species in ", Year, sep = ""), hoverinfo = "text", visible = F)%>%

  layout(hovermode = "closest", font = list(color = "black"),
         title = "Federal Expenditures on ESA Listed Species",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Spending per Listed Species", rangemode = "tozero"),
         legend = list(x = 0.8, y = 0.15, bordercolor = "black", borderwidth = 1),
         updatemenus = list(
           list(type = "buttons",
                title = "butt",
                y = 0.95,
                x = 1,
                buttons = list(
                  list(method = "update",
                       args = list("visible", list(F,"legendonly",T,F,F)),
                       label = "FWS"),
                  list(method = "update",
                       args = list("visible", list(F,F,F,"legendonly",T)),
                       label = "Other Fed")
                )
           )
         ))

})
}



