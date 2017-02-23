output$appropriation <- renderPlotly({
  plot_ly(funding, x = ~Year, y = ~count)%>%
    add_trace(data = funding, x = ~Year, y = ~Recovery*CF2016/Species, type = "scatter", mode = "lines",
              name = "Recovery", line = list(color = "red"), text = ~paste("$",Recovery,"budgeted for <br> Recovery in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(data = funding, x = ~Year, y = ~ConsultOld*CF2016/Species, type = "scatter", mode = "lines",
              name = "Consultation 2014", line = list(color = "purple"), text = ~paste("$",ConsultOld,"budgeted for <br> Recovery in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(data = funding, x = ~Year, y = ~ConsultNew*CF2016/Species, type = "scatter", mode = "lines",
              name = "Consultation 2017", line = list(color = "orange"), text = ~paste("$",ConsultNew,"budgeted for <br> Recovery in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(data = funding, x = ~Year, y = ~ESP*CF2016/Species, type = "scatter", mode = "lines",
              name = "Endangeres Species 2017", line = list(color = "blue"), text = ~paste("$",ESP,"budgeted for <br> Recovery in", Year, sep=" "), hoverinfo = "text")%>%

    add_trace(data = funding, x = ~Year, y = ~ESOld*CF2016/Species, text = ~paste("$", ESOld, "budgeted for <br> Ecolocial Services in", Year, sep = " "), hoverinfo = "text",
              type = "scatter", mode = "lines", name = "Ecological Services (2014) <br>(click to show)", visible = "legendonly")%>%

    add_trace(data = funding, x = ~Year, y = ~ESNew*CF2016/Species, text = ~paste("$", ESNew, "budgeted for <br> Ecolocial Services in", Year, sep = " "), hoverinfo = "text",
              type = "scatter", mode = "lines", name = "Ecological Services (2017) <br>(click to show)", visible = "legendonly")%>%

    layout(hovermode = "closest", font = list(color = "black"),
           xaxis = list(title = "Year"),
           yaxis = list(title = "Appropriations per Listed Species"),
           legend = list(x = 0.05, y = 0.95, bordercolor = "black", borderwidth = 1))
})
