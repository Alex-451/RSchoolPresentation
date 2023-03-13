library(tidyverse)


# GENESIS-Tabelle: 73421-0002
# col_types = cols(.default = "c") <- this is needed so it shows all columns
(rawData <- read_delim("data/SalesOfBeer.csv", col_types = cols(.default = "c")))

fig <- plot_ly(
  x = rawData$Year,
  y = as.integer(rawData$`Sales of beer`),
  type = 'scatter',
  mode = 'lines',
  name = 'Beer sales')%>%
  
  layout(
    plot_bgcolor = '#e5ecf6',
    
    xaxis = list(
      title = 'Years',
      zerolinecolor = '#ffff',
      zerolinewidth = 2,
      gridcolor = 'ffff'
    ),
    
    yaxis = list(
      title = 'Sales',
      zerolinecolor = '#ffff',
      zerolinewidth = 2,
      gridcolor = 'ffff'
    ),
    
    showlegend = TRUE,
    width = 1100
  )

fig <- fig %>% add_trace(y = as.integer(rawData$`Consumption of beer`), name = "Consumption of beer")
fig <- fig %>% add_trace(y = as.integer(rawData$`Beer sales on which tax was paid`), name = "Beer sales on which tax was paid")
fig <- fig %>% add_trace(y = as.integer(rawData$`Tax-exempt beer sales`), name = "Tax-exempt beer sales")


fig