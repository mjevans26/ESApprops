
simple_graphs <- function(input, output, session){

output$pie <- renderPlotly({
  p1<- plot_ly(data = count(gerber, O_U), labels = ~ O_U, values = ~ n, name = "",type = "pie",
             marker = list(colors = substr(viridis(3),1,7)))%>%
   layout(hovermode = "closest", font = list(color = "black"),
          legend = list(x = 0.00, y = 1, bordercolor = "black", borderwidth = 1),
          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  p2 <- plot_ly(data = count(gerber, change), labels = ~ change, values = ~n, name = "", type = "pie")%>%
    layout(hovermode = "closest", font = list(color = "black"),
           legend = list(x = 0.00, y = 1, bordercolor = "black", borderwidth = 1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  p3 <- plot_ly(data = gerber2, x = ~O_U, y = ~ count, color = ~change, type = "bar")%>%
    layout(hovermode = "closest", font = list(color = "black"),
         legend = list(x = 0.00, y = 1, bordercolor = "black", borderwidth = 1),
        xaxis = list(title = "Group"),
        yaxis = list(title = "Number of Species"))
subplot(p1, p2, p3, nrow = 2)
})

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
}
