output$states <- renderPlotly({
  plot_ly(states)%>%
    add_trace(x = ~fws, y = ~state, type = "scatter", mode = "markers", size = ~species,
              marker = list(title = "butt", line = list(color = "black"), sizemode = "diameter", colorbar = list(y = 0.5, x = 0.85, title = "Spending<br>  ratio<br>State:FWS")),
              sizes = c(5,15), color = ~ state/fws, name = "Per Species<br>Expenditures",
              text = ~paste(STATE,"<br>",round(state/fws,3), "<br>", species, "species"), hoverinfo = "text")%>%
    add_trace(x = ~c(0, max(fws)), y = ~c(0, max(fws)), type = "scatter", mode = "lines", name = "1:1 Line")%>%
    layout(hovermode = "closest", font = list(color = "black"),
           xaxis = list(title = "FWS Expenditures"),
           yaxis = list(title = "State Expenditures", range = c(0,200000)),
           legend = list(x = 0.10, y = 0.95, bordercolor = "black", borderwidth = 1))
})
