budget_graph <- function(input, output, session){
  output$appropriation <- renderPlotly({
  plot_ly(funding, x = ~Year, y = ~count)%>%
    add_trace(data = funding, x = ~Year, y = ~Recovery*CF2016/Species, type = "scatter", mode = "lines",
              name = "Recovery", line = list(color = "red"), text = ~paste("$",format(Recovery*CF2016, big.mark = ",", big.interval = 3),"budgeted for<br>Recovery in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(data = funding, x = ~Year, y = ~ConsultOld*CF2016/Species, type = "scatter", mode = "lines",
              name = "Consultation<br>(1985 - 2015)", line = list(color = "purple"), text = ~paste("$",format(ConsultOld*CF2016, big.mark = ",", big.interval = 3),"budgeted for<br>Consultation in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(data = funding, x = ~Year, y = ~ConsultNew*CF2016/Species, type = "scatter", mode = "lines",
              name = "Consultation 2017", line = list(color = "orange"), text = ~paste("$",format(ConsultNew*CF2016, big.mark = ",", big.interval = 3),"budgeted for<br>Consultation in", Year, sep=" "), hoverinfo = "text", visible = F)%>%

    add_trace(data = funding, x = ~Year, y = ~ESP*CF2016/Species, type = "scatter", mode = "lines",
              name = "Endangered Species<br>(1985 - 2015)", line = list(color = "blue"), text = ~paste("$",format(ESP*CF2016, big.mark = ",", big.interval = 3),"budgeted for<br>Endangered Species Programs in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(data = funding, x = ~Year, y = ~ESOld*CF2016/Species, text = ~paste("$", format(ESOld*CF2016, big.mark = ",", big.interval = 3), "budgeted for <br> Ecolocial Services in", Year, sep = " "), hoverinfo = "text",
              type = "scatter", mode = "lines", name = "Ecological Services<br>(1985 - 2015)<br>(click to show)", visible = "legendonly")%>%

    add_trace(data = funding, x = ~Year, y = ~ESNew*CF2016/Species, text = ~paste("$", format(ESNew*CF2016, big.mark = ",", big.interval = 3), "budgeted for <br> Ecolocial Services in", Year, sep = " "), hoverinfo = "text",
              type = "scatter", mode = "lines", name = "Ecological Services (2017) <br>(click to show)", visible = F)%>%

    layout(hovermode = "closest", font = list(color = "black"),
           xaxis = list(title = "Year", range = c(1983, max(funding$Year))),
           yaxis = list(title = "Appropriations per Listed Species", rangemode = "tozero"),
           legend = list(bgcolor = "none", orientation = 'h', x = -0.1, tracegroupgap = 1))
})
}
