
output$spending <- renderPlotly({
  plot_ly(arrange(FWS, Year))%>%
    add_trace(x = ~Year, y = ~mn*CF2016, type = "scatter", mode = "lines",
              name = "FWS", line = list(color = "red"), text = ~paste("$",round(mn, 2),"spent per species <br>in", Year, sep=" "), hoverinfo = "text")%>%
    add_trace(x = ~Year, y = ~ top*CF2016, type = "scatter", mode = "lines", name = "Lower 95%")%>%
    #add_trace(x = ~Year, y = ~ U95*CF2016, type = "scatter", mode = "lines", name = "Upper 95%")%>%
    layout(hovermode = "closest", font = list(color = "black"),
           xaxis = list(title = "Year"),
           yaxis = list(title = "Spending per Listed Species"),
           legend = list(x = 0.05, y = 0.95, bordercolor = "black", borderwidth = 1))
})

plot_ly(data = FWS, x = ~Year, y = ~U95*CF2016, name = "95%", type = "scatter", mode = "lines", fill = "tozeroy", fillcolor = "yellow", line = list(color = "black"))%>%
  add_trace(y = ~mn*CF2016, name = "50%", fillcolor = "purple", line = list(color = "black"))%>%
  add_trace(y = ~L95, name = "25%", fillcolor = "red", line = list(color = "black"))%>%
  layout(hovermode = "closest", font = list(color = "black"),
         xaxis = list(title = "Year"),
         yaxis = list(title = "Spending per Listed Species"),
         legend = list(x = 0.05, y = 0.95, bordercolor = "black", borderwidth = 1))
