library(shiny)
library(DT)
library(data.table)
library(reactable)
library(dplyr)
library(RODBC)

ui <- shiny::fluidPage(
  tableOutput("table") 
)

server <- function(input, output) {
  
  data <- reactive({
    
    
    #print(auth$user)
    
    
    ssql <- "SELECT * FROM INFORMATION_SCHEMA.TABLES"
    #where login = 'olanhaieva'"
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    con <- RODBC::odbcDriverConnect('driver={ODBC Driver 17 for SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=dskzhj3orbdvtav;uid=ull5ks6f0yft2ip;pwd=JAmp1yCnhCcl#IcdykLOq8Psj;')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=dl1xlqmw32xedun;uid=us1nj4boyvsubkt;pwd=oi#WOBSAHjqk4SkqXC?rsYyA$;')
    #data <- RODBC::sqlQuery(con, "SELECT * FROM mycredentials")
    #on.exit(RODBC::odbcClose(con))
    
    #con <- RODBC::odbcDriverConnect('driver={ODBC Driver 17 for SQL Server};server=DESKTOP-3D58FB2\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=DESKTOP-3D58FB2\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    data <- RODBC::sqlQuery(con, ssql)
    
    
    on.exit(RODBC::odbcClose(con))
    
    
    return(data)
    
  })
  
  
  output$table <- 
    renderTable(data()) 
}

shinyApp(ui = ui, server = server)