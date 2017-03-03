budget_graph <- function(input, output, session){
  output$appropriation <- renderPlotly({
  plot_ly(funding, x = ~Year)%>%
    add_trace(y = ~Species, type = "scatter", mode = "lines", name = "Listed Species", yaxis = "y2",
              text = ~paste(Species, "listed species in", Year), hoverinfo = "text",
              fill = "tozeroy", line = list(color = "grey"))%>%

    add_trace(y = ~Recovery*CF2016/Species, type = "scatter", mode = "lines",
              name = "Recovery", line = list(color = "red"),
              text = ~paste("$",format(Recovery*CF2016/Species, big.mark = ",", big.interval = 3),"per species budgeted for<br>Recovery in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(y = ~ConsultOld*CF2016/Species, type = "scatter", mode = "lines",
              name = "Consultation<br>(1985 - 2015)", line = list(color = "purple"),
              text = ~paste("$",format(ConsultOld*CF2016/Species, big.mark = ",", big.interval = 3),"per species budgeted for<br>Consultation in", Year, sep=" "), hoverinfo = "text")%>%

#    add_trace(y = ~ConsultNew*CF2016/Species, type = "scatter", mode = "lines",
#              name = "Consultation 2017", line = list(color = "orange"),
#              text = ~paste("$",format(ConsultNew*CF2016, big.mark = ",", big.interval = 3),"per species budgeted for<br>Consultation in", Year, sep=" "), hoverinfo = "text", visible = F)%>%

    add_trace(y = ~ESP*CF2016/Species, type = "scatter", mode = "lines",
              name = "Endangered Species<br>(1985 - 2015)", line = list(color = "blue"),
              text = ~paste("$",format(ESP*CF2016/Species, big.mark = ",", big.interval = 3),"per species budgeted for<br>Endangered Species Programs in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(y = ~ESOld*CF2016/Species, type = "scatter", mode = "lines", legendgroup = "2",
              text = ~paste("$", format(ESOld*CF2016/Species, big.mark = ",", big.interval = 3), "per species budgeted for <br> Ecolocial Services in", Year, sep = " "), hoverinfo = "text",
              name = "Ecological Services<br>(1985 - 2015)<br>(click to show)", visible = "legendonly")%>%

#    add_trace(y = ~ESNew*CF2016/Species, type = "scatter", mode = "lines", legendgroup = "2",
#              text = ~paste("$", format(ESNew*CF2016, big.mark = ",", big.interval = 3), "budgeted for <br> Ecolocial Services in", Year, sep = " "), hoverinfo = "text",
#              name = "Ecological Services (2017) <br>(click to show)", visible = F)%>%

      layout(hovermode = "compare", font = list(color = "black"),
           title = "Timeline of Endangered Species Act Appropriations",
           xaxis = list(title = "Year", range = c(1983, max(funding$Year))),
           yaxis = list(title = "Appropriations per Listed Species", rangemode = "tozero", overlaying = "y2"),
           yaxis2 = list(anchor = "x", side = "right", range = c(0, 2000), showticklabels = F),
           legend = list(bgcolor = "none", orientation = 'h', x = 0, tracegroupgap = 1))
})
}
