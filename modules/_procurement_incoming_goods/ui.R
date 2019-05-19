tabItem(
  tabName = "tab_procurement_incoming_goods",
  includeHTML("modules/_procurement_incoming_goods/description.html"),
  
  fluidRow(
    
    box(
      title = "Initialize database",
      width = 12,
      solidHeader = TRUE,
      status = "primary",
      fluidRow(column(
        12,
        align = "center",
        actionButton("actionButton_1000", "Initialize!")
      ))
    ),
    
  box(
    title = "Table",
    width = 12,
    align = "center",
    status = "primary",
    solidHeader = TRUE,
    collapsible = TRUE,
    collapsed = FALSE,
    dataTableOutput('dataTableOutput_1000')
  ),
  box(
    title = "Download Data",
    width = 12,
    align = "center",
    status = "primary",
    solidHeader = TRUE,
    collapsible = TRUE,
    collapsed = FALSE,
    downloadButton(
      "downloadButton_1000",
      "Download as xlsx"
    )
  ),
  
  box(
    title = "Pivot table",
    width = 12,
    align = "center",
    status = "primary",
    solidHeader = TRUE,
    collapsible = TRUE,
    collapsed = FALSE,
    tags$head(tags$style( type = 'text/css', '#rpivotTableOutput_1000{ overflow-x: scroll; }')),
    
    rpivotTableOutput('rpivotTableOutput_1000', width = "100%", height = "1000px")
  )
)
)