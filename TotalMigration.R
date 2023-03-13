library(tidyverse)
library(plotly)

# GENESIS-Tabelle: 12711-0001
# col_types = cols(.default = "c") <- this is needed so it shows all columns
(rawDataTotalMigration <- read_delim("data/TotalMigration.csv", col_types = cols(.default = "c")))

# GENESIS-Tabelle: 24911-0002
(rawDataSuspects <- read_delim("data/SuspectsGermany.csv", col_types = cols(.default = "c")))


fig <- plot_ly(
  x = rawDataTotalMigration$Year,
  y = as.integer(rawDataTotalMigration$`Arrivals Male`),
  type = 'bar',
  name = 'Arrivals Male')%>%
  
  layout(
    title = 'Total Migration to Germany',
    plot_bgcolor = '#e5ecf6',

    xaxis = list(
      title = 'Years',
      zerolinecolor = '#ffff',
      zerolinewidth = 2,
      gridcolor = 'ffff'
    ),
    
    yaxis = list(
      title = 'Arrivals',
      zerolinecolor = '#ffff',
      zerolinewidth = 2,
      gridcolor = 'ffff'
    ),
    
    showlegend = TRUE,
    width = 1100
  )

fig <- fig %>% add_trace(y = as.integer(rawDataTotalMigration$`Arrivals Female`), name = "Arrivals Female")

fig <- fig %>% add_trace(y = as.integer(rawDataSuspects$`Foreigners Male`), type = 'scatter', mode = 'lines', name = "Foreign Suspects Male")
fig <- fig %>% add_trace(y = as.integer(rawDataSuspects$`Foreigners Female`), type = 'scatter', mode = 'lines', name = "Foreign Suspects Female")

fig <- fig %>% add_trace(y = as.integer(rawDataSuspects$`Germans Male`), type = 'scatter', mode = 'lines', name = "German Suspects Male")
fig <- fig %>% add_trace(y = as.integer(rawDataSuspects$`Germans Female`), type = 'scatter', mode = 'lines', name = "German Suspects Female")


fig