
output$spending <- renderPlotly({

plot_ly(type = "scatter", mode = "lines",fill = "tozeroy", fillcolor = "yellow", line = list(color = "black"))%>%
  add_trace(data = FWS, x = ~Year, y = ~U95*CF2016, name = "95%")%>%
  add_trace(data = FWS, x = ~Year, y = ~mn*CF2016, name = "Mean", fill = "none", line = list(color = "black"),
            text = ~paste("$", format(mn*CF2016, big.mark = ",", big.interval = 3), "in ", Year), hoverinfo = "text")%>%
  add_trace(data = FWS, x = ~Year, y = ~ top*CF2016, type = "scatter", mode = "lines", fill = "none", name = "Top 5%<br>click to show",
            text = ~paste("Mean of the top 5%<br>was $", format(top*CF2016, big.mark = ",", big.interval = 3), " in ", Year, sep = ""), hoverinfo = "text", visible = "legendonly")%>%

  add_trace(data = Fed, x = ~Year, y = ~U95*CF2016, name = "95%", visible = F)%>%
  add_trace(data = Fed, x = ~Year, y = ~mn*CF2016, name = "Mean", fill = "none", line = list(color = "black"),
            text = ~paste("$", format(mn*CF2016, big.mark = ",", big.interval = 3), "in ", Year), hoverinfo = "text", visible = F)%>%
  add_trace(data = Fed, x = ~Year, y = ~ top*CF2016, type = "scatter", mode = "lines", fill = "none", name = "Top 5%<br>click to show",
            text = ~paste("Mean of the top 5%<br>was $", format(top*CF2016, big.mark = ",", big.interval = 3), " in ", Year, sep = ""), hoverinfo = "text", visible = F)%>%

  layout(hovermode = "closest", font = list(color = "black"),
         xaxis = list(title = "Year"),
         yaxis = list(title = "Spending per Listed Species"),
         legend = list(x = 0.75, y = 0.95, bordercolor = "black", borderwidth = 1),
         updatemenus = list(
           list(type = "buttons",
                y = 0.85,
                x = 0.6,
                buttons = list(
                  list(method = "update",
                       args = list("visible", list(F,T,T,"legendonly",F,F,F)),
                       label = "FWS"),
                  list(method = "update",
                       args = list("visible", list(F,F,F,F,T,T,"legendonly")),
                       label = "Other Fed")
                )
           )
         ))

})



method = "update"
