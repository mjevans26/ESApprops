output$years <- renderPlotly({
  plot_ly(Years, x = ~Year)%>%
    add_trace(y = ~FED*CF2016, type = "bar", name = "Federal Expenditures", marker = list(color = substr(viridis(4),1,7)[1]),
              text = ~paste("$",format(FED*CF2016, big.mark = ",", big.interval = 3), " spent by Federal agencies in", Year, sep = ""), hoverinfo = "text")%>%
    add_trace(y = ~STATE*CF2016, type = "bar", name = "State Expenditures", marker = list(color = substr(viridis(4),1,7)[4]),
              text = ~paste("$",format(STATE*CF2016, big.mark = ",", big.interval = 3), " spent by State agencies in", Year, sep = ""), hoverinfo = "text")%>%
    layout(hovermode = "closest", font = list(color = "black"),
           xaxis = list(title = "Fiscal Year"),
           yaxis = list(title = "Expenditures (adjusted to 2016 Dollars)"),
           legend = list(x = 0.10, y = 0.95, bordercolor = "black", borderwidth = 1))
})
