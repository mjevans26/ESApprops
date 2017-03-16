
simple_graphs <- function(input, output, session){

output$pie <- renderPlotly({
  plot_ly()%>%
    add_pie( data = count(gerber, O_U), labels = c("Under (<0.90)", "Adequate", "Over (>2x)"), values = ~ n, name = "Funding",
             marker = list(colors = rev(substr(viridis(3),1,7))),
             textfont = list(size = 16), legendgroup = "Funding", textinfo = "percent", textposition = "outside",
             text = ~paste(n, " Species were<br>", c("Adequately funded", "Over funded", "Under funded"), sep = ""),
             hoverinfo = "text")%>%
#   add_pie(data = count(gerber, change), labels = ~ change, values = ~n, name = "Status",
#           textfont = list(size = 16), legendgroup = "Funding", textinfo = "percent", textposition = "outside",
#           marker = list(colors = c("red", substr(magma(2),1,7))), legendgroup = "Status",
#           text = ~paste(n, " species showed<br>", c("decreasing populations", "increasing populations", "no change in population"), sep = ""), hoverinfo = "text",
#           visible = F)%>%
    layout(hovermode = "closest", font = list(color = "black"),
           showlegend = FALSE,
           legend = list(x = 0.95, y = 0.95, bordercolor = "black", borderwidth = 1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
    )
})

output$bar <- renderPlotly({
  plot_ly()%>%
    add_trace(data = gerber2, x = ~change, y = ~ count, color = ~paste(O_U, "funded"), colors = ~color, type = "bar",
          marker = list(line = list(color = "black", width = 2)),
          text = ~paste(count, O_U, "funded species", change),hoverinfo = "text")%>%
    layout(hovermode = "closest", font = list(color = "black"), barmode = "stack",
           legend = list(x = 0.6, y = 0.95, bordercolor = "black", borderwidth = 1),
           yaxis = list(title = "Number of Species"),
           xaxis = list(title = "Recovery Status (1989 - 2011)", tickmode = "array", tickvals = list("Declined", "Did not Change", "Improved"), ticktext = list("Declined", "No Change", "Improved"), tickangle = 0)
)
})

output$states <- renderPlotly({
  plot_ly(states)%>%
    add_trace(x = ~fws, y = ~state, type = "scatter", mode = "markers", size = ~species,
              marker = list(title = "butt", line = list(color = "black"), sizemode = "diameter", colorbar = list(y = 0.5, x = 0.85, title = "Spending<br>  ratio<br>State:FWS")),
              sizes = c(5,15), color = ~ state/fws, name = "Per Species<br>Expenditures",
              text = ~paste(STATE,"<br>",round(state/fws,3), "<br>", species, "species"), hoverinfo = "text")%>%
    add_trace(x = ~c(0, max(fws)), y = ~c(0, max(fws)), type = "scatter", mode = "lines", name = "1:1 Line")%>%
    layout(hovermode = "closest", font = list(color = "black"),
           title = "Comparing Federal and State Expenditures per State",
           xaxis = list(title = "FWS Expenditures"),
           yaxis = list(title = "State Expenditures", range = c(0,200000)),
           legend = list(x = 0.10, y = 0.95, bordercolor = "black", borderwidth = 1))
})

output$years <- renderPlotly({
  plot_ly(Years, x = ~Year)%>%
    add_trace(y = ~FWS*CF2016, type = "bar", name = "FWS", marker = list(color = substr(viridis(3),1,7)[2]),
              text = ~paste("$",format(FWS*CF2016, big.mark = ",", big.interval = 3), " spent by FWS in ", Year, sep = ""), hoverinfo = "text")%>%
    add_trace(y = ~FED*CF2016, type = "bar", name = "Other Federal", marker = list(color = substr(viridis(3),1,7)[1]),
              text = ~paste("$",format(FED*CF2016, big.mark = ",", big.interval = 3), " spent by Other Federal agencies in", Year, sep = ""), hoverinfo = "text")%>%
    add_trace(y = ~STATE*CF2016, type = "bar", name = "All States", marker = list(color = substr(viridis(3),1,7)[3]),
              text = ~paste("$",format(STATE*CF2016, big.mark = ",", big.interval = 3), " spent by State agencies in", Year, sep = ""), hoverinfo = "text")%>%
        layout(hovermode = "closest", font = list(color = "black"),
           title = "Comparing Federal and State Spending on Listed Species",
           xaxis = list(title = "Fiscal Year"),
           yaxis = list(title = "Expenditures (2016 Dollars)"),
           legend = list(x = 0.05, y = 0.95, bordercolor = "black", borderwidth = 1))
})
}
