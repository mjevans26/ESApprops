plot_ly(data = funding, x = ~Year)%>%
  add_trace(y = ~ Recovery*CF2016 - lag(Recovery*CF2016), type = "scatter", mode = "lines", name = "Recovery",
            line = list(color = "red"),
            text = ~paste("Recovery funding changed<br>$",format(Recovery/CF2016 - lag(Recovery/CF2016), big.mark = ",", big.interval = 3),"in", Year, sep=" "), hoverinfo = "text")%>%

  add_trace(y = ~(Species - lag(Species))*100000, type = "scatter", mode = "lines", name = "Listed Species",
            text = ~paste(Species - lag(Species), "species listed in", Year), hoverinfo = "text", line = list(color = "grey"))%>%

  add_trace(y = ~ConsultOld*CF2016/Species, type = "scatter", mode = "lines",
            name = "Consultation<br>(1985 - 2015)", line = list(color = "purple"),
            text = ~paste("Consultation funding changed<br>$",format(ConsultOld*CF2016/Species, big.mark = ",", big.interval = 3),"in", Year, sep=" "), hoverinfo = "text")%>%

  #    add_trace(y = ~ConsultNew*CF2016/Species, type = "scatter", mode = "lines",
  #              name = "Consultation 2017", line = list(color = "orange"),
  #              text = ~paste("$",format(ConsultNew*CF2016, big.mark = ",", big.interval = 3),"per species budgeted for<br>Consultation in", Year, sep=" "), hoverinfo = "text", visible = F)%>%

  add_trace(y = ~ESP*CF2016 - lag(ESP*CF2016), type = "scatter", mode = "lines",
            name = "Endangered Species<br>(1985 - 2015)", line = list(color = "blue"),
            text = ~paste("Endangered Species Program funding changed<br>$",format(ESP*CF2016/Species, big.mark = ",", big.interval = 3),"in", Year, sep=" "), hoverinfo = "text")%>%

  add_trace(y = ~ESOld*CF2016 - lag(ESOld*CF2016), type = "scatter", mode = "lines", legendgroup = "2",
            text = ~paste("Ecological Services funding changed<br>$", format(ESOld*CF2016/Species, big.mark = ",", big.interval = 3), "in", Year, sep = " "), hoverinfo = "text",
            name = "Ecological Services<br>(1985 - 2015)<br>(click to show)", visible = "legendonly")%>%

  #    add_trace(y = ~ESNew*CF2016 - lag(ESNew*CF2016), type = "scatter", mode = "lines", legendgroup = "2",
  #              text = ~paste("Ecological Services funding changed<br>$", format(ESNew*CF2016, big.mark = ",", big.interval = 3), "in", Year, sep = " "), hoverinfo = "text",
  #              name = "Ecological Services (2017) <br>(click to show)", visible = F)%>%

  layout(hovermode = "compare", font = list(color = "black"),
         title = "Timeline of Endangered Species Act Appropriations",
         xaxis = list(title = "Year", range = c(1983, max(funding$Year))),
         yaxis = list(title = "Appropriations per Listed Species"),
         #yaxis2 = list(anchor = "yaxis", overlaying = "y", side = "right", showticklabels = T),
         legend = list(bgcolor = "none", orientation = 'h', x = 0, tracegroupgap = 1)
         )
