global_df <- NULL

observeEvent(
  input$actionButton_1000,
  {
    con <- DBI::dbConnect(dbDriver("SQLite"),"EIS.sqlite")
    df_sql <- DBI::dbReadTable(con, "Material")
    DBI::dbDisconnect(con)
    
    output$dataTableOutput_1000 <- renderDataTable({
      df_sql
    },options = list(scrollX = TRUE))
    
    output$rpivotTableOutput_1000 <- renderRpivotTable(
      rpivotTable(data = df_sql, height = "100px")
    )
    global_df <<- df_sql
})
output$downloadButton_1000 <- downloadHandler(
  
  filename = function() {
    paste("Download","_",Sys.Date(),".xlsx", sep = "")
  },
  content = function(file) {
    write.xlsx(global_df, file, row.names = FALSE)
  }
)


