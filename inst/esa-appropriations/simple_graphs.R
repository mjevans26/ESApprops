
simple_graphs <- function(input, output, session){

output$pie <- renderPlotly({
  plot_ly()%>%
    add_pie( data = count(gerber, O_U), labels = ~ O_U, values = ~ n, name = "Funding",
             marker = list(colors = rev(substr(viridis(3),1,7))),
             textfont = list(size = 16), legendgroup = "Funding", textinfo = "percent", textposition = "outside",
             text = ~paste(n, " species were<br>",c("adequately funded", "over funded", "under funded"), sep = ""),
             hoverinfo = "text")%>%
   add_pie(data = count(gerber, change), labels = ~ change, values = ~n, name = "Status",
           textfont = list(size = 16), legendgroup = "Funding", textinfo = "percent", textposition = "outside",
           marker = list(colors = c("red", substr(magma(2),1,7))), legendgroup = "Status",
           text = ~paste(n, " species showed<br>", c("decreasing populations", "increasing populations", "no change in population"), sep = ""), hoverinfo = "text",
           visible = F)%>%
    layout(hovermode = "closest", font = list(color = "black"),
           legend = list(x = 0.95, y = 0, bordercolor = "black", borderwidth = 1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           updatemenus = list(
             list(type = "buttons",
                  y = 0.95,
                  x = 1.1,
                  buttons = list(
                    list(method = list("update"),
                         args = list("visible", list(T,F)),
                         label = "Funding"),
                    list(method = list("update"),
                         args = list("visible", list(F,T)),
                         label = "Status")
                  )
             )#,
             #list(type = "buttons",
             #     y=0,
             #     x=1.1,
             #     buttons = list(
             #       list(method = "restyle",
             #            args = list("visible", list(T,F)),
             #            label = "Funding"),
              #      list(method = "restyle",
             #            args = list("visible", list(F,T)),
              #           label = "Status")
              #    ))
           )
    )
})

output$bar <- renderPlotly({
  plot_ly(data = gerber2, x = ~O_U, y = ~ count, color = ~change, type = "bar",
          marker = list(line = list(color = rev(substr(viridis(3),1,7)), width = 2),
                        color = rep(c("red", "white", "black"),3)),
          text = ~paste(count, "funded species"),hoverinfo = "text")%>%
    layout(hovermode = "closest", font = list(color = "black"), barmode = "stack",
           yaxis = list(title = "Number of Species"),
           xaxis = list(title = "Recovery Funding", tickmode = "array", tickangle = 0, tickvals = c("Ad", "Over", "Under"), ticktext = c("Adequate", "Over", "Under")))

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
    add_trace(y = ~FED*CF2016, type = "bar", name = "Federal Expenditures", marker = list(color = substr(viridis(4),1,7)[1]),
              text = ~paste("$",format(FED*CF2016, big.mark = ",", big.interval = 3), " spent by Federal agencies in", Year, sep = ""), hoverinfo = "text")%>%
    add_trace(y = ~STATE*CF2016, type = "bar", name = "State Expenditures", marker = list(color = substr(viridis(4),1,7)[4]),
              text = ~paste("$",format(STATE*CF2016, big.mark = ",", big.interval = 3), " spent by State agencies in", Year, sep = ""), hoverinfo = "text")%>%
    layout(hovermode = "closest", font = list(color = "black"),
           title = "Timeline of Total Federal and state Expenditures<br>on Listed Species",
           xaxis = list(title = "Fiscal Year"),
           yaxis = list(title = "Expenditures (adjusted to 2016 Dollars)"),
           legend = list(x = 0.10, y = 0.95, bordercolor = "black", borderwidth = 1))
})
}
