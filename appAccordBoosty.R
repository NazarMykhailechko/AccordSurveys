#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

 #options(mysql = list(
#   "host" = "127.0.0.1",
#   "port" = 3306,
#   "user" = "root",
#   "password" = "WIN72007@NAZAr"
# ))
# databaseName <- "crmsystem"

# options(mysql = list(
#   "host" = "eu-cluster-west-01.k8s.cleardb.net",
#   "port" = 3306,
#   "user" = "bc6a3dad916b4a",
#   "password" = "0c7f407f"
# ))
# databaseName <- "heroku_623d565686a87a4"
 
 # options(mysql = list(
 #   "host" = "eu-cluster-west-01.k8s.cleardb.net",
 #   "port" = 3306,
 #   "user" = "bc6a3dad916b4a",
 #   "password" = "0c7f407f"
 # ))
 # databaseName <- "heroku_623d565686a87a4"

 pool <- pool::dbPool(
   drv = RMySQL::MySQL(),
   dbname = "a9pt7elh5dx2d96q",
   host = "fojvtycq53b2f2kx.chr7pe7iynqr.eu-west-1.rds.amazonaws.com",
   username = "azpnhhninzjx64pg",
   password = "uh8bfx0wuu4c44e5"
 )
 
#pool <- pool::dbPool(
#  drv = RMySQL::MySQL(),
#  dbname = "crmsystem",
#  host = "127.0.0.1",
#  username = "root",
#  password = "WIN72007@NAZAr"
#)

onStop(function() {
  print("POOL CLOSED!!!!!!!!!!!!!")
  poolClose(pool)
})




#table <- "clients"

css <- HTML("@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro:200');
            
            body  {
            
            overflow: hidden;
              background-image: url('https://w0.peakpx.com/wallpaper/738/166/HD-wallpaper-blue-digital-background-technology-digital-technology-coding-concepts-blue-technology-background.jpg');
              background-size:cover;
              
              -webkit-animation: slidein 100s;
              animation: slidein 100s;
              
              -webkit-animation-fill-mode: forwards;
              animation-fill-mode: forwards;
              
              -webkit-animation-iteration-count: infinite;
              animation-iteration-count: infinite;
              
              -webkit-animation-direction: alternate;
              animation-direction: alternate;              
            }
            
            @-webkit-keyframes slidein {
              from {background-position: top; background-size:1300px; }
              to {background-position: -100px 0px;background-size:2750px;}
            }
            
            @keyframes slidein {
              from {background-position: top;background-size:1300px; }
              to {background-position: -100px 0px;background-size:2750px;}
              
            }
            
            
            
            .center
            {
              display: flex;
              align-items: center;
              justify-content: center;
              position: absolute;
              margin: auto;
              top: 0;
              right: 0;
              bottom: 0;
              left: 0;
              background: rgba(75, 75, 250, 0.3);
              border-radius: 3px;
            }
            .center h1{
              text-align:center;
              color:white;
              font-family: 'Source Code Pro', monospace;
              text-transform:uppercase;
            }
            
            
#auth-auth-mod {
overflow: hidden;

}


#auth-shinymanager-auth-head{
font-size:20px;font-family: system-ui, sans-serif;
}

div p{
font-size:11px;font-family: system-ui, sans-serif;
}

#auth-user_id{
background-color:white;color:black;border-color:white;
}

#auth-user_pwd{
background-color:white;color:black;border-color:white;
}

#auth-go_auth:hover{
background-color: #FF5733;
}


            
            ")

tags$div(tags$style('.btn.btn-default.shiny-download-link.shiny-bound-output {font-size:12px}'))


# my_custom_check_creds <- function() {
#   
#   # finally one function of user and password
#   function(user, password) {
#     
#     #datauser$login <- user
#     
#     con <- odbcDriverConnect('driver={SQL Server};server=LAPTOP-0915C010\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
# 
#     #ssql <- sprintf("SELECT * FROM mycredentials WHERE [user] = '%s' AND [password] = '%s'", user, password)
#     ssql <- paste0("SELECT * FROM mycredentials WHERE [user] = '", user, "' AND [password] = '", password, "'")
#     data <- sqlQuery(con, ssql)
#     on.exit(RODBC::odbcClose(con))
#     
#     #Sys.sleep(3)
#     #print(nrow(data))
# 
# 
#     
#     
#     
#     if (nrow(data) > 0) {
#       list(result = TRUE, user_info = list(user = user, something = 123))
#       #print(list(result = TRUE, user_info = list(user = user, something = 123)))
#     } else {
#       list(result = FALSE)
#       
#     }
#     
#   }
# }


get_credencials <- function() {

    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data <- RODBC::sqlQuery(con, "SELECT * FROM mycredentials")
    #on.exit(RODBC::odbcClose(con))
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    # data <- DBI::dbGetQuery(con,   "SELECT * FROM mycredentials")
    # on.exit(DBI::dbDisconnect(con))
    
    data <- DBI::dbGetQuery(pool,   "SELECT * FROM mycredentials")
    #poolClose(pool)

   return(data)
}


# user_base <- data.frame(
#          user = c("tops",   "risks",   "olanhaieva", "dzhereliuk", "borovyk"), # mandatory
#      password = c("accord", "finzvit", "12345",      "11111",      "22222"), # mandatory
#   #permissions = c("admin",  "standard","standard",   "standard",   "standard"),
#   #name = c("User One", "User Two"),
#   stringsAsFactors = FALSE,
#   row.names = NULL
# )

user_base <- get_credencials()



library(shiny)
library(shinyBS)
library(shinythemes)
library(shinydashboard)
library(shinyauthr)
library(shinyjs)
library(shinyWidgets)
library(shinyFeedback)
#library(shinymanager)
library(shinycssloaders)
library(dplyr)
library(tidyr)
library(openxlsx)
library(data.table)
#library(RODBC)
#library(yum)
#library(odbc)
library(RMySQL)
library(DBI)
library(pool)
library(DT)
library(reactable)
library(htmltools)
library(gtrendsR)
library(highcharter)
library(lubridate)

#library(jsonlite)
#library(reshape2)
#library(RMySQL)
#library(XML)
#library(xml2)
#library(formattable)
#library(reactable.extras)
#library(V8)
#library(fontawesome)


# Define UI for application that draws a histogram

title <- tags$div(tags$img(src="accordbank.svg", height = 25, width = 25), "AccordBoosty")



ui <- fillPage(

  #includeCSS("www/status.css"),
  uiOutput("testUI", style = "position: absolute; top: 5px; right: 5px; z-index:10000;"),
  
  # actionButton("logout", "Log Out", icon = icon("user"),
  #              style = "position: absolute; top: 5px; right: 5px; z-index:10000;"),

div( id = "display_content", navbarPage (id = "nbpage", title = title, collapsible = FALSE, header = NULL,  windowTitle = "AccordBoosty",

              
              
             fluid = TRUE, footer = NULL,selected = "Клієнти для опрацювання",inverse = FALSE,
             
             
             
             tabPanel("Клієнти для опрацювання", 
                      
                      tags$div(HTML("<div id='managerselect' style='background-color:#2b3e50;font-size:10px;margin-bottom:5px;font-family: system-ui, sans-serif;'><select id='managers' style='background-color:#2b3e50;color:white; border:none;outline: none;border:0px;font-family: system-ui, sans-serif;' name=\"pets\" id=\"pet-select\">
                                  <option value=\"arkhipov\">arkhipov</option>
                                  <option value=\"borovyk\">borovyk</option>
                                  <option value=\"dzhereliuk\">dzhereliuk</option>
                                  <option value=\"huzar\">huzar</option>
                                  <option value=\"myroniukv\">myroniukv</option>
                                  <option selected value=\"olanhaieva\">olanhaieva</option>
                                  <option value=\"surzhenko\">surzhenko</option>
                                  <option value=\"zaikav\">zaikav</option>
                              </select></div>")),
                      
                      

                      
                      shinycssloaders::withSpinner( reactableOutput ("new_clients"), color = "white"),icon = icon("user-group"),

                      
                      

                      bsModal("modalExample", title = div(textOutput("company")), "finzvitt", size = "large",
                              
                              
                              div(style="display:flex;",  dropdown(
                                
                                sliderTextInput("slide", "Приріст між датами", choices = c("01.01.2025", "01.01.2024", "01.01.2023", "01.01.2022","01.01.2021","01.01.2020"), selected=c("01.01.2025","01.01.2024"), grid = T),
                                
                                style = "minimal", icon = icon("gear"),size = "sm",
                                status = "default", width = "300px",
                                animate = animateOptions(
                                  enter = animations$fading_entrances$fadeInLeftBig,
                                  #exit = animations$fading_exits$fadeOutRightBig
                                ),label = "змінити прирости"
                              ),
                              
                              downloadButton('downloadData1', 'Зберегти в .xlsx')),
                              
                              tabsetPanel(type = "tab", id = "mytabs2",
                                          
                                          tabPanel("Баланс", tableOutput("balance2")),
                                          tabPanel("Звіт про фінансові результати", tableOutput("finrez2"))
                                          
                                          # tabPanel("Інфо", verbatimTextOutput("companyinfo2")),
                                          # tabPanel("Упр.звіт", verbatimTextOutput("manrep")),
                                          # tabPanel("Власники", tableOutput("founders2"))),
                                          # tableOutput("distTable")
                              ))
                      
                      ),
             tabPanel("Результати роботи", shinycssloaders::withSpinner( reactableOutput("status_results"), color = "white"), icon = icon("chart-line")),
             tabPanel("Звіт по доходах і об'ємах операцій", shinycssloaders::withSpinner( reactableOutput("income_results",), color = "white" ), icon = icon("sack-dollar")),
             tabPanel("Фінансова звітність", icon = icon("list-check"), div(style="display:inline-block;left:calc(25%);", textInput("okpo", "")), 
                      div(style="display:inline-block;left:calc(25%);", actionButton("act","Знайти",icon = icon("search", class = "normal"))),

                      
                      
                      useShinyjs(),
                      textOutput("company4"), div(id = "fzvt", reactableOutput("finzvit")) %>% shinyjs::hidden(), 
                      
                      bsModal("modalExample3", title = div(textOutput("company3")), "finzvitt3", size = "large",
                              
                              
                              div(style="display:flex;",  dropdown(
                                
                                sliderTextInput("slide3", "Приріст між датами", choices = c("01.01.2025", "01.01.2024", "01.01.2023", "01.01.2022","01.01.2021","01.01.2020"), selected=c("01.01.2025","01.01.2024"), grid = T),
                                
                                style = "minimal", icon = icon("gear"),size = "sm",
                                status = "default", width = "300px",
                                animate = animateOptions(
                                  enter = animations$fading_entrances$fadeInLeftBig,
                                  #exit = animations$fading_exits$fadeOutRightBig
                                ),label = "змінити прирости"
                              ),
                              
                              downloadButton('downloadData', 'Зберегти в .xlsx')),
                              
                              tabsetPanel(type = "tab", id = "mytabs3",
                                          
                                          tabPanel("Баланс", tableOutput("balance3")),
                                          tabPanel("Звіт про фінансові результати", tableOutput("finrez3"))
                                          
                                          # tabPanel("Інфо", verbatimTextOutput("companyinfo2")),
                                          # tabPanel("Упр.звіт", verbatimTextOutput("manrep")),
                                          # tabPanel("Власники", tableOutput("founders2"))),
                                          # tableOutput("distTable")
                              ))
                      
                      ),
             
             # actionLink("signing", "", icon = icon("sign-in-alt"),
             #            style = "position: absolute; right: 20px; top: -3px"),
             
             
             
             #<link rel="shortcut icon" sizes="16x16" href="accordbank.svg">
             
             tags$head(
               HTML("
                     <meta name='viewport' content= 'width=device-width, initial-scale=1.0'>
                     <link rel='shortcut icon' sizes='16x16' href='accordbank.svg'>
                 ")
             ),
             
             
             
             theme = shinytheme("superhero"),
             #tags$div(tags$style('.navbar.navbar-default.navbar-fixed-top.navbar-inverse {font-size:12px;background-color:black}')),
             
             #222d32
             
             # tags$style("div {
             #             color: white;
             #            
             #             }"),
             
             
             
             tags$span(tags$style('.navbar-brand {font-size:14px;}')),
             #tags$div(tags$style('#new_clients {opacity:0.5;}')),

             #tags$div(tags$style('.selectize-input.items.full.has-options.has-items {background-color: #4e5d6c;color:white;border-radius:0px}')),
             #tags$div(tags$style('.selectize-dropdown-content {background-color: #4e5d6c;color:white;border-radius:0px}')),
              
             tags$div(tags$style('.dropdown-menu.inner {border-color:white;font-size:9px;background-color:#485563;}')),
             
             tags$div(tags$style('.navbar.navbar-default.navbar-static-top {margin-bottom:15px;}')),
             
             tags$div(tags$style('.rt-table {height: 78vh;}',
                                 '#status_results div.Reactable {height: 90vh;}',
                                 '#income_results div.Reactable {height: 90vh;}',
                                 '#fzvt div.rt-table {height: 9vh;}'
                                 )
                               ),

             
             # tags$div(tags$style('.datepicker-days {background-color:#2b3e50;}')),
             # tags$div(tags$style('.shiny-input-text.form-control.shiny-bound-input {background-color:#2b3e50;color:white;border-color:white;font-size:10px}')),
             # tags$div(tags$style('.form-control {background-color:#4e5d6c;color:white;border-color:white;font-size:12px}')),
             # tags$div(tags$style('.modal-title {color:magenta;font-size:12px}')),
             # tags$div(tags$style('.action-button.bttn.bttn-minimal.bttn-sm.bttn-default.bttn-no-outline.shiny-bound-input {font-size:12px}')),
             # tags$div(tags$style('.btn.btn-default.shiny-download-link.shiny-bound-output {font-size:12px}')),
             
             tags$div(tags$style('.datepicker-days {background-color:#2b3e50;}',
                                 '.shiny-input-text.form-control.shiny-bound-input {background-color:#2b3e50;color:white;border-color:white;font-size:10px}',
                                 '.form-control {background-color:#4e5d6c;color:white;border-color:white;font-size:12px}',
                                 '.modal-title {color:magenta;font-size:12px}',
                                 '.action-button.bttn.bttn-minimal.bttn-sm.bttn-default.bttn-no-outline.shiny-bound-input {font-size:12px}',
                                 '.btn.btn-default.shiny-download-link.shiny-bound-output {font-size:12px}')),
             
             tags$body(tags$style('#history {font-weight: bold;font-size:10px;background-color: #4e5d6c;color:white;border-color:white}')),
             
             tags$body(tags$style('#work {font-weight: bold;font-size:10px;background-color: #4e5d6c;color:white;border-color:white}')),
             
             tags$table(tags$style('.table.shiny-table.table-hover.spacing-xs {font-size:10px;font-family: system-ui, sans-serif;display: block;z-index: 1;overflow: auto;margin: 0 auto;padding: 1rem;height:67vh;word-wrap : break-word;}')),
             tags$table(tags$style('.table.shiny-table.table-hover.spacing-xs thead {position: sticky; top: 0;background: #4e5d6c;overflow: auto;white-space: nowrap;}')),
             tags$table(tags$style('.table.shiny-table.table-hover.spacing-xs th {position: sticky; top: 0;white-space: nowrap;}')),
             tags$div(tags$style('#balance3 .table.shiny-table.table-hover.spacing-xs tr:nth-child(6) {background-color:magenta;font-size: 15px;font-weight: bold;}')),
             
             tags$body(tags$style('.sw-dropdown-content.animated.sw-show {color:lightgrey;background-color:black;font-size:12px;}')),
             tags$body(tags$style('.sw-dropdown-in {color:lightgrey;background-color:black;font-size:15px;}')),
             
             tags$head(tags$style("#modalExample .modal-footer{display:none}")),

             tags$head(tags$style("#modalExample3 .modal-footer{display:none}")),
             tags$div(tags$style(".shiny-text-output.shiny-bound-output {color:magenta;font-size:12px;}")),
             
             
             
             
  )
  
)%>% shinyjs::hidden(),

# must turn shinyjs on
shinyjs::useShinyjs(),
# add logout button UI 
# div(class = "pull-right", logoutUI(id = "logout", label="Вийти", 
#                                    icon = icon("angle-right",
#                                                class = "normal"))),

# add login panel UI function
div(id = "loginpage", loginUI(id = "login", title = tags$div(tags$img(src="accordbank.svg", height = 50, width = 50),tags$br("AccordBoosty")), 
                              user_title = "Логін",
                              pass_title = "Пароль",
                              error_message = "Невірний логін або пароль!",
                              login_title = "Увійти", additional_ui =  tags$hr(tags$div(id = "myfooter",
                                     tags$p(
                                       "З питань роботи AccordBoosty пишіть ",
                                       tags$a(
                                         href = "mailto:mykhailechko@accordbank.com.ua?Subject=AccordBoosty",
                                         target="_top", "адміністратору"
                                       )
                                     )
                                    )
                                   )
                                  
                                 
                              )),

# setup table output to show user info after login
#tableOutput("user_table"),


tags$head(
  # Note the wrapping of the string in HTML()
  tags$style(HTML("@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro:200');

body  {
    background-image: url('https://w0.peakpx.com/wallpaper/738/166/HD-wallpaper-blue-digital-background-technology-digital-technology-coding-concepts-blue-technology-background.jpg');
  background-size:cover;
        -webkit-animation: slidein 100s;
        animation: slidein 100s;

        -webkit-animation-fill-mode: forwards;
        animation-fill-mode: forwards;

        -webkit-animation-iteration-count: infinite;
        animation-iteration-count: infinite;

        -webkit-animation-direction: alternate;
        animation-direction: alternate;              
}

@-webkit-keyframes slidein {
from {background-position: top; background-size:1300px; }
to {background-position: -100px 0px;background-size:2750px;}
}

@keyframes slidein {
from {background-position: top;background-size:1300px; }
to {background-position: -100px 0px;background-size:2750px;}

}



.center
{
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: rgba(75, 75, 250, 0.3);
  border-radius: 3px;
}
.center h1{
  text-align:center;
  color:white;
  font-family: 'Source Code Pro', monospace;
  text-transform:uppercase;
}

#login-user_name{
background-color:white;color:black;border-color:white;
}

#login-password{
background-color:white;color:black;border-color:white;
}

#login-button{
width: 100%;
}

#login-button:hover{
background-color: #FF5733;
}

h2 div{
font-size:20px;font-family: system-ui, sans-serif;
//vertical-align: middle;
}


.well {
    left      : 50%;
    top       : 50%;
    position  : absolute;
    transform : translate(-50%, -50%);
        width: 500px;
    height: 450px;
}

#myfooter{
font-size:10px;font-family: system-ui, sans-serif;
}

#testUI{
font-size:10px;font-family: system-ui, sans-serif;margin-top:10px;margin-right:15px;color:#df691a;font-weight: bolder;
}


.rt-tr-highlight-sticky:hover {
background-color:#4e5d6c;
}


"))
),



tags$head(
  HTML(
    "
          <script>
          var socket_timeout_interval
          var n = 0
          $(document).on('shiny:connected', function(event) {
          socket_timeout_interval = setInterval(function(){
          Shiny.onInputChange('count', n++)
          }, 15000)
          });
          $(document).on('shiny:disconnected', function(event) {
          clearInterval(socket_timeout_interval)
          });
          </script>
          
          "
  )
),



# tags$head(
#   HTML(sprintf(
#     "
#           <script>
# 
#                 $('html').change(function() {
# setTimeout(function() {
#                       $('.rt-pagination-nav button:nth-child(4)').trigger('click');
# }, 3000);
# });
#           </script>
#           ",pages$page + 1,pages$page + 1)
#   )
# ),

# tags$head(
#   HTML(
#     "
#           <script>
# 
#                             function elementLoaded(el, cb) {
#                                 if ($(el).length) {
#                                   // Element is now loaded.
#                                   cb($(el));
#                                 } else {
#                                   // Repeat every 500ms.
#                                   setTimeout(function() {
#                                     elementLoaded(el, cb)
#                                   }, 500);
#                                 }
#                               };
# 
#                     elementLoaded('button.rt-page-button', function(el) {
# 
#                         el.click(function() {
#                           var page = $(this).text();
#                             Shiny.onInputChange('page',page);
#                             //alert(page);Shiny.onInputChange('page',page);
#                         });
# 
#                     });
# 
# 
#           </script>
#           "
#   )
# ),
# 
# tags$head(
#   HTML("<script>
#                       $('.rt-page-button').pagination({
#     items: totalItmes,
#     itemsOnPage: perPageItem,
#     cssStyle: 'light-theme',
#     currentPage : currentPageNumber,        
#     onPageClick : function(){
#             showProjectPage(currentPageNumber);
#             alert('wwevewvwevwe!!!!!!!!!!!!!!!!!!!!!');
#           }
# });
#                 </script>"
# )),

# runjs(sprintf(
#   "
#     
#                            function elementLoaded(el, cb) {
#       if ($(el).length) {
#         // Element is now loaded.
#         cb($(el));
#       } else {
#         // Repeat every 500ms.
#         setTimeout(function() {
#           elementLoaded(el, cb)
#         }, 500);
#       }
#     };
#     
#     
#     elementLoaded('.rt-pagination-nav button:nth-child(%s)', function(el) {
#       
#       //el.click(function() {
#         // alert('You just clicked a dynamically inserted element');
#         //});
#       
#       $('.rt-pagination-nav button:nth-child(%s)').trigger('click');
#     });
#     
#   })
# 
#           ",pages$page + 1,pages$page + 1))



tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-from, .js-irs-0 .irs-to, .js-irs-0 .irs-bar {background: RebeccaPurple}")),
tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-from, .js-irs-1 .irs-to, .js-irs-1 .irs-bar {background: RebeccaPurple}")),


div(id = "kp", textOutput("keepAlive")) %>% shinyjs::hidden(),
div(id = "ip", textOutput("chekipadress")) %>% shinyjs::hidden(),

theme = shinytheme("superhero"),

)


# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  # session$onSessionEnded(function(){
  #   print("CLEAR CONNECTIONS!!!!!!!!!!!!!!!!!!!!!!!")
  #   # cons<-dbListConnections(RMySQL::MySQL())
  #   # for(con in cons) {
  #   #   print(con)
  #   #   dbDisconnect(con)
  #   # }
  #   poolClose(pool)
  # })

  shinyjs::useShinyjs()
  #session$allowReconnect(TRUE)
  
  #shinyjs::hide(id = "loginpage")
  shinyjs::show(id = "loginpage")
 

  
  # observe({
  #   print(input$page)
  #   runjs(sprintf(
  #         "
  # 
  #                     $('html').change(function() {
  #                         setTimeout(function() {
  #                               $('.rt-pagination-nav button:nth-child(%s)').trigger('click');
  #                         }, 5000);
  #                     });
  #               ", as.numeric(input$page)+1))
  # })
  
  # observe(
  # runjs(sprintf(
  #     "
  # 
  # 
  #               $('html').change(function() {
  #                    setTimeout(function() {
  #                     $('.rt-pagination-nav button:nth-child(%s)').trigger('click');
  #                     }, 4000);
  #                     });
  # 
  #         ",pages$page + 1)
  #   )
  # )

# runjs('$(document).ready(function() {
#   $("button").click(function(){
#       var text = $(this).text();
#       alert(text);
# });   
# });')
  
  runjs('$.getJSON("https://api.ipify.org/?format=json", function(data) {
  var1 = JSON.stringify(data, null, 2);Shiny.setInputValue("var1", var1);
});')
  
  ipaddress <- reactive({
    if(length(input$var1) > 0){
      x <- fromJSON(input$var1)$ip
    }
  })
  
  
  output$keepAlive <- renderText({
    req(input$count)
    paste("keep alive ", input$count)
  })
  
  
  # call the logout module with reactive trigger to hide/show
  logout_init <- shinyauthr::logoutServer(
    id = "logout",
    active = reactive(credentials()$user_auth)
  )
  
  
  
  # call login module supplying data frame, user and password cols
  # and reactive trigger
  credentials <- shinyauthr::loginServer(
    id = "login",
    data = user_base,
    user_col = user,
    pwd_col = password,
    #sodium_hashed = TRUE,
    log_out = reactive(logout_init())
  )
  
  # pulls out the user information returned from login module
  user_data <- reactive({credentials()$info})
  
  shiny::observe({
    req(credentials()$user_auth)
    shinyjs::show(id = "display_content")
  })
  
  shiny::observe({
    req(!credentials()$user_auth)
    shinyjs::hide(id = "display_content")
  })
  
   
#   runjs('$("#login-button").on("click", function() {
#     var $this = $(this);
#     $this.button("loading");
# 
#     setTimeout(function() {
#        $this.button("reset");
#    }, 5000);
# });')

  
  
  shiny::observe({
    req(credentials()$user_auth)
    # if (user_data()$user == "admin")
      
          if(isTruthy(user_data()$user) && user_data()$user == 'tops'){


            shinyjs::enable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Клієнти для опрацювання"')
            shinyjs::enable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Результати роботи"')
            shinyjs::enable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Звіт по доходах і об\'ємах операцій"')
            shinyjs::enable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Фінансова звітність"')
            runjs('$("#nbpage li:first a").trigger("click");')
            
            
          }else if(isTruthy(user_data()$user) && user_data()$user == 'risks'){
            #shinyjs::useShinyjs()
            shinyjs::disable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Клієнти для опрацювання"')
            shinyjs::disable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Результати роботи"')
            shinyjs::disable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Звіт по доходах і об\'ємах операцій"')
            shinyjs::enable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Фінансова звітність"')
            runjs('$("#nbpage li:nth-child(1) i").removeClass("fas fa-user-group fa-fw").addClass("fa-sharp fa-solid fa-lock").css("color", "#df691a");')
            runjs('$("#nbpage li:nth-child(2) i").removeClass("fas fa-chart-line fa-fw").addClass("fa-sharp fa-solid fa-lock").css("color", "#df691a");')
            runjs('$("#nbpage li:nth-child(3) i").removeClass("fas fa-sack-dollar fa-fw").addClass("fa-sharp fa-solid fa-lock").css("color", "#df691a");')
            runjs('$("#nbpage li:nth-child(4) a").trigger("click");')

          }else{
            #shinyjs::useShinyjs()
            shinyjs::enable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Клієнти для опрацювання"')
            shinyjs::disable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Результати роботи"')
            shinyjs::disable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Звіт по доходах і об\'ємах операцій"')
            shinyjs::disable(selector = '.nav.navbar-nav.shiny-tab-input.shiny-bound-input a[data-value="Фінансова звітність"')
            runjs('$("#nbpage li:nth-child(2) i").removeClass("fas fa-chart-line fa-fw").addClass("fa-sharp fa-solid fa-lock").css("color", "#df691a");')
            runjs('$("#nbpage li:nth-child(3) i").removeClass("fas fa-sack-dollar fa-fw").addClass("fa-sharp fa-solid fa-lock").css("color", "#df691a");')
            runjs('$("#nbpage li:nth-child(4) i").removeClass("fas fa-list-check fa-fw").addClass("fa-sharp fa-solid fa-lock").css("color", "#df691a");')
            runjs('$("#nbpage li:first a").trigger("click");')
            runjs(sprintf('$("#managers").val("%s").change();',user_data()$user))
            runjs('$("#managerselect").hide();')
            

          }
    

  })
  
  
  
  #shinyjs::disable(selector = '.nav.nav-tabs a[data-value="Управлінські звіти"')
  
  
  observeEvent(input$managers,{
    print(paste("MANAGERS - ", input$managers))
  })
  

  
  
  data <- reactive({

    shinyjs::useShinyjs()  

    #print(auth$user)

    
 #     ssql <- "SELECT top 1000 pr
 #       ,iif([client_name_short] is NULL or [client_name_short] = '',[client_name],[client_name_short]) as cl
 # 	  	  ,[dbo].[status_icons].[icon]
 # 	  ,[dbo].[database].[status]
 # 	  ,[last_client_result]
 #     ,[employee_num] as emp
 # 	  ,[forex_per_year_usd]
 #       ,[loan_value_uah]
 #       ,[passive_value_uah]
 # 	  ,[revenue_uah]
 # 	  ,[tender_num]
 #       ,[tender_sum]
 #       ,[sek]
 #       ,[kved]
 #       ,[kved_name]
 #       ,[person_details]
 #       ,[phone]
 #       ,[full_address]
 #       ,[kobl]
 #       ,[login]
 #     --,FORMAT ([last_date_contact], 'd', 'hy-AM') as [last_date_contact]
 # 	  ,[client_history]
 # 	  --,[comments]
 # 
 #   FROM [dbo].[database] INNER JOIN
 #                   [dbo].[status_icons] ON [database].status = [status_icons].status
 #   where login = '"
     
     #where login = 'olanhaieva'"
     
     ssql <-    "SELECT pr,

CASE
WHEN client_name_short is NULL or client_name_short = '' THEN client_name
ELSE client_name_short
END AS cl
 	  	  ,status_icons.icon
 	  ,`database`.status
 	  ,last_client_result
     ,employee_num as emp
 	  ,forex_per_year_usd
       ,loan_value_uah
       ,passive_value_uah
 	  ,revenue_uah
 	  ,tender_num
       ,tender_sum
       ,sek
       ,kved
       ,kved_name
       ,person_details
       ,phone
       ,full_address
       ,kobl
       ,login
 	  ,client_history

   FROM `database`  INNER JOIN
                   status_icons ON `database`.status = status_icons.status 
where login = '"

     


     #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
     
     #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
     
     #data <- RODBC::sqlQuery(con, paste0(ssql,input$managers, "'"))
     
     # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
     #                 port = options()$mysql$port, user = options()$mysql$user,
     #                 password = options()$mysql$password)
     
     
     
     data <- DBI::dbGetQuery(pool,  paste0(ssql,input$managers, "'order by pr LIMIT 1000"))
     

     #mutate(data, pr = sprintf("%008d", pr)) -> data

     
     #data <- sqlQuery(con, paste0(ssql,isTruthy(auth$user), "'"))
     #on.exit(RODBC::odbcClose(con))
     
     #on.exit(DBI::dbDisconnect(con))
     #poolClose(pool)


     # on click function

     edit_onclick = sprintf(
       "Shiny.setInputValue(\"edit\", \"%s\", {priority: \"event\"})",
       data$pr
     )

     finzvit_onclick = sprintf(
       "Shiny.setInputValue(\"finzvit\", \"%s\", {priority: \"event\"})",
       data$pr
     )

     # button with onClick function
     button_edit <- sprintf(
       "<a title='внести зміни' class='btn btn-primary btn-sm' style='margin-left:5px; margin-right:0px' onClick='%s'><i class='fas fa-edit'></i></a>",
       edit_onclick
     )

     # button with onClick function
     button_finzvit <- sprintf(
       "<a id='finzvitt' title='фінансова звітність' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#modalExample' style='margin-left:0px; background-color: #e95420; border-color: #c34113' onClick='%s'><i class='fa-regular fa-file-lines'></i></a>",
       finzvit_onclick
     )

     buttons <- paste0(
       '<div class="btn-group" style="width: 75px;" role="group" aria-label="Basic example">',
       button_finzvit,
       button_edit,
       '</div>'
     )
     


     # data <- data %>%
     #
     # mutate(status = case_when (status == "відмова" ~ paste0("<img src=\"","cancel.png","\" style=\"vertical-align: middle\"", "\" height=\"35\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"", "статус", "\"></img>", " ", status),
     #                            status == "запланована зустріч" ~ paste0("<img src=\"","chat.png", "\" height=\"35\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"", "статус", "\"></img>", " ", status),
     #                           status == "запланований повторний дзвінок" ~ paste0("<img src=\"","phone.png", "\" height=\"35\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"", "статус", "\"></img>", " ", status),
     #                          status == "відкритий рахунок/продана послуга" ~ paste0("<img src=\"","accordbank.svg", "\" height=\"35\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"", "статус", "\"></img>", " ", status),
     #                         status == "не був оброблений" ~ paste0("<img src=\"","question.png","\" style=\"vertical-align: middle", "\" height=\"35\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"", "статус", "\"></img>", " ", status)))
     #


     # add button to data.frame
     #data$button <- button

     #data <- data %>% relocate(button, .before = "pr")

     # Set the Action Buttons row to the first column of the `data` table

     data <- cbind(
     #tibble(" " = buttons),
       tibble("finzvit" = buttons),
       data
     )

    # data <- cbind(
    #   #tibble(" "= NA),
    #   #tibble("edit" = NA),
    #   data
    # )

     #input$save
     #input$edit
    
    # shinyjs::useShinyjs()
    # 
    #runjs('alert("vwevwev")')



    return(data)

  })



  # data <- reactiveValues(
  #   
  #   df = data
  #   
  # )
  
  
  # datafinzvit <- reactive({
  #   
  #   ssql <- "SELECT top 1000 [TIN]
  #     ,[FIRM_NAME]
  #     ,[FIRM_ADR]
  #     ,[FIRM_BUH]
  #     ,[FIRM_KVED]
  #     ,[FIRM_KVEDNM]
  #     ,[FIRM_OPFCD]
  #     ,[FIRM_RUK]
  #     ,[FIRM_TELORG]
  #     ,[S_CH]
  #    FROM [crmsystem].[dbo].[datafinzvit]
  #   where TIN = '40963434'"
  #   
  #   
  #   con <- odbcDriverConnect('driver={SQL Server};server=LAPTOP-0915C010\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
  #   dataf <- sqlQuery(con, ssql)
  #   on.exit(RODBC::odbcClose(con))
  #   
  #   
  #   # on click function
  #   
  #   # edit_onclick = sprintf(
  #   #   "Shiny.setInputValue(\"edit\", \"%s\", {priority: \"event\"})", 
  #   #   dataf$TIN
  #   # )
  #   
  #   finzvit_onclick = sprintf(
  #     "Shiny.setInputValue(\"finzvit\", \"%s\", {priority: \"event\"})", 
  #     dataf$TIN
  #   )
  #   
  #   # button with onClick function
  #   # button_edit <- sprintf(
  #   #   "<a title='внести зміни' class='btn btn-primary btn-sm' style='margin-left:5px; margin-right:0px' onClick='%s'><i class='fas fa-edit'></i></a>",
  #   #   edit_onclick
  #   # )
  #   # 
  #   # button with onClick function
  #   button_finzvit <- sprintf(
  #     "<a id='finzvitt' title='фінансова звітність' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#modalExample' style='margin-left:0px; background-color: #e95420; border-color: #c34113' onClick='%s'><i class='fa-regular fa-file-lines'></i></a>",
  #     finzvit_onclick
  #   )
  #   
  #   buttons <- paste0(
  #     '<div class="btn-group" style="width: 75px;" role="group" aria-label="Basic example">',
  #     button_finzvit,
  #     # button_edit,
  #     '</div>'
  #   )
  #   
  #   dataf <- cbind(
  #     tibble(" " = buttons),
  #     dataf
  #   )
  #   
  #   dataf <- cbind(
  #     tibble(" "= NA),
  #     dataf
  #   )
  #   
  #   # input$save
  #   # input$edit
  #   return(dataf)
  # })
  
  
  
  
  
  client<- reactiveValues(name = "")
  company<- reactiveValues(name = "")
  

  
  observeEvent(input$act,{
    #shinyjs::useShinyjs()
    
    shiny::observe({
      shinyjs::hide(id = "fzvt")
    })
    

    output$company4 <- renderText("")
    

    
    # ssql <- "SELECT [TIN]
    #   ,[FIRM_NAME]
    #   ,[S_CH]
    #   ,[FIRM_RUK]
    #   ,[FIRM_BUH]
    #   ,[FIRM_ADR]
    #   ,[FIRM_TELORG]
    #   ,[FIRM_KVED]
    #   ,[FIRM_KVEDNM]
    #   --,[FIRM_OPFCD]
    # 
    #  FROM [dbo].[finzvitdata]
    # where TIN = '"
    
    ssql <-   "SELECT TIN
      ,FIRM_NAME
      ,S_CH
      ,FIRM_RUK
      ,FIRM_BUH
      ,FIRM_ADR
      ,FIRM_TELORG
      ,FIRM_KVED
      ,FIRM_KVEDNM

     FROM a9pt7elh5dx2d96q.finzvitdata
    where TIN = '"
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #dataf <- RODBC::sqlQuery(con, paste0(ssql,input$okpo,"'"))
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    dataf <- DBI::dbGetQuery(pool,  paste0(ssql,input$okpo,"'"))
    #on.exit(DBI::dbDisconnect(con))
    #poolClose(pool)
    
    #mutate(dataf, TIN = sprintf("%008d", TIN)) -> dataf
    #on.exit(RODBC::odbcClose(con))
    
    
    if (nrow(dataf) == 0) {
      output$company4 <- renderText("Дані відсутні!")
      shiny::observe({
        shinyjs::hide(id = "fzvt")
      })
      return()
    }
    
    shiny::observe({
      shinyjs::show(id = "fzvt")
    })
    output$company4 <- renderText("")
   
    
    finzvit_onclick = sprintf(
      "Shiny.setInputValue(\"finzvit3\", \"%s\", {priority: \"event\"})", 
      dataf$TIN
    )
    
    button_finzvit <- sprintf(
      "<a id='finzvitt3' title='фінансова звітність' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#modalExample3' style='margin-left:0px; background-color: #e95420; border-color: #c34113' onClick='%s'><i class='fa-regular fa-file-lines'></i></a>",
      finzvit_onclick
    )
    
    buttons <- paste0(
      '<div class="btn-group" style="width: 75px;" role="group" aria-label="Basic example">',
      button_finzvit,
      '</div>'
    )
    
    dataf <- cbind(
      tibble("finzvit" = buttons),
      dataf
    )
    
  
    
    
    # founders <- UOjsondata[UOjsondata$TIN == input$okpo,]
    # 
    # if (nrow(founders) == 0){
    #   founders <- "Не має даних"
    # }else{
    #   founders<-founders[[2]][[1]]
    #   
    #   names(founders)[1] <- ""
    #   names(founders)[2] <- ""
    #   names(founders)[3] <- ""
    #   founders <- format(founders, justify = "left")
    # }
    # 
    
    
    #------------------------------------------------------------
    
    
    
    #finrez[is.na(finrez)] <- 0
    #38324809
    
  
    
    # proxy <- dataTableProxy("finzvit")
    # observe({
    #   replaceData(proxy, dataf, resetPaging = FALSE, rownames = FALSE)
    # })
    
    output$finzvit <- renderReactable({
      
      
      reactable(
        
        dataf,
        style = list(fontSize = '9px'),
        searchable = FALSE,
        highlight = TRUE,
        borderless = FALSE,
        striped = FALSE,
        compact = TRUE,
        wrap = FALSE,
        resizable = TRUE,
        showSortable = TRUE,
        #height = 300,
        showPageSizeOptions = TRUE,
        pageSizeOptions = c(10, 25, 50, 100),
        defaultPageSize = 1,
        
        defaultColDef = colDef(
          #header = function(value) gsub(".", " ", value, fixed = TRUE),
          #cell = function(value) format(value, nsmall = 1),
          #minWidth = 70,
          #style = list(position = "sticky", left = 0, zIndex = 1),
          vAlign = "center",
          headerVAlign = "bottom",
          #headerStyle = list(position = "sticky", left = 0, zIndex = 1,align = "center"),
        ),
        
        columns = list(
         
          finzvit = colDef(
            name = "",
            sortable = FALSE,
            maxWidth = 40,
            html = TRUE
          ),
          TIN = colDef(name = "єдрпоу", maxWidth = 60, na = "-",align = "left", sortable = FALSE, sticky = "left"),
          FIRM_NAME = colDef(name = "назва компанії", minWidth = 200, sortable = FALSE),
          FIRM_ADR = colDef(name = "адреса", minWidth = 300, na = "-", sortable = FALSE),
          FIRM_BUH = colDef(name = "бухгалтер", minWidth = 150, na = "-", sortable = FALSE),
          FIRM_KVED = colDef(name = "квед", maxWidth = 60, na = "-", sortable = FALSE),
          FIRM_KVEDNM = colDef(name = "назва квед", minWidth = 200, na = "-", sortable = FALSE),
          #FIRM_OPFCD = colDef(name = "opfcd", maxWidth = 60, na = "-"),
          FIRM_RUK = colDef(name = "керівник", minWidth = 150, na = "-", sortable = FALSE),
          FIRM_TELORG = colDef(name = "телефон", maxWidth = 80, na = "-", sortable = FALSE),
          S_CH = colDef(name = "к-ть прац", maxWidth = 80, na = "-", sortable = FALSE)
          
        ),

        
        #2b3e50
        theme = reactableTheme(
          color = "hsl(233, 9%, 87%)",
          backgroundColor = "#2b3e50",
          borderColor = "#2b3e50",
          stripedColor = "hsl(233, 12%, 22%)",
          highlightColor = "hsl(233, 12%, 24%)",
          inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
          selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
          pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
          pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
          style = list(
            fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"
          ),
          searchInputStyle = list(width = "100%",backgroundColor = "#2b3e50")
        ),
        
        language = reactableLang(
          searchPlaceholder = "Пошук...",
          noData = "Даних не знайдено",
          pageInfo = "{rowStart} до {rowEnd} з {rows} записів",
          pageSizeOptions = "Показати {rows}",
          pagePrevious = "Попередня",
          pageNext = "Наступна",
          # Accessible labels for assistive technologies such as screen readers.
          # These are already set by default, but don't forget to update them when
          # changing visible text.
          pagePreviousLabel = "Попередня",
          pageNextLabel = "Наступна"
        )

        
      )
      
  
      
    })    
    
    # output$founders <- renderTable({
    #   #print(founders, row.names=FALSE)
    #   founders
    #   #print(actual_date)
    #   #actual_date
    #   #cat("\n")
    #   #print(content(res1))
    #   #cat("\n")
    #   #print("-----------------------Засновники--------------------------")
    #   #print(founders)
    #   #cat("\n")
    #   #print("-----------------------Бенефіціари-------------------------")
    #   #print(beneficiaries)
    #   #cat("\n")
    # }) 
    # 
    
    
    
    # if (user_data()$user == "admin"){
    #   
    #   
    #   options(mysql = list(
    #     "host" = "nuepp3ddzwtnggom.chr7pe7iynqr.eu-west-1.rds.amazonaws.com",
    #     "port" = 3306,
    #     "user" = "ftgqrah1iipvc2dl",
    #     "password" = "honjdx189jnetqyi"
    #   ))
    #   databaseName <- "e2y37zog3x0r8b3l"
    #   table <- "logger"
    #   
    #   db <- dbConnect(MySQL(), dbname = databaseName, host = options()$mysql$host, 
    #                   port = options()$mysql$port, user = options()$mysql$user, 
    #                   password = options()$mysql$password)
    #   
    #   
    #   # Construct the fetching query
    #   query <- sprintf("SELECT * FROM %s order by ts desc", "logger")
    #   # Submit the fetch query and disconnect
    #   data <- dbGetQuery(db, query)
    #   dbDisconnect(db)
    #   #print(data)
    #   
    #   
    #   output$secret <- renderTable({
    #   
    #     
    #     data
    #     
    #   })}
    
    
    #output$downloadData <- downloadHandler(
    
    # filename = function() {paste0(companyName, ".xlsx")},
    #  content = function(file) {write_xlsx(balance, path = file)}
    
    #)
    
    # output$downloadData <- downloadHandler(
    #   
    #   filename = function() {paste0(input$okpo,"-",companyName, ".xlsx")},
    #   content = function(file) {
    #     
    #     
    #     wb <- createWorkbook()
    #     addWorksheet(wb, "Balance")
    #     writeData(wb, "Balance", balance, rowNames = FALSE)
    #     setColWidths(wb, "Balance", cols = c(1, 2, 3, 4, 5, 6, 7), widths = c("auto", 70, 10, "auto", "auto", "auto", "auto"))
    #     addWorksheet(wb, "Finrez")
    #     writeData(wb, "Finrez", finrez, rowNames = FALSE)
    #     setColWidths(wb, "Finrez", cols = c(1, 2, 3, 4, 5, 6, 7), widths = c("auto", 70, 10, "auto", "auto", "auto", "auto"))
    #     # addWorksheet(wb, "CompanyInfo")
    #     # writeData(wb, "CompanyInfo", companyInfo, rowNames = TRUE)
    #     # setColWidths(wb, "CompanyInfo", cols = c(1, 2), widths = c("auto", "auto"))
    #     # addWorksheet(wb, "Founders")
    #     # writeData(wb, "Founders", founders, rowNames = TRUE)
    #     # setColWidths(wb, "Founders", cols = c(1, 2), widths = c("auto", "auto"))
    #     #addWorksheet(wb, "Beneficiaries")
    #     #writeData(wb, "Beneficiaries", beneficiaries, rowNames = TRUE)
    #     #setColWidths(wb, "Beneficiaries", cols = c(1, 2), widths = c("auto", "auto"))
    #     saveWorkbook(wb, file, overwrite = TRUE)
    #     
    #     
    #   }
    #   
    # )
    
    output$company3 <- renderText({
      company$name
    })
    
  })
  
  
  
  
  
  
  
  
  # output$finzvit <- renderDataTable({
  #   
  #   datatable(
  #     datafinzvit(),
  #     #data.frame(),
  #     escape = FALSE, 
  #     selection = "none", 
  #     rownames = FALSE, 
  #     #colnames = c('','єдрпоу', 'Are', 'Some', 'New', 'Names'),
  #     # colnames = c('єдрпоу'='pr', 'назва клієнта'='cl', 'статус' = 'status',
  #     #              'результат роботи' = 'last_client_result', 'к-ть прац.' = 'emp', 'адреса' = 'full_address',
  #     #              'код обл.'='kobl', 'квед' = 'kved', 'назва квед' = 'kved_name', 'виручка'='revenue_uah', 'сектор'='sek',
  #     #              'особисті дані'='person_details', 'телефон'='phone', 'історія роботи з клієнтом'='client_history',
  #     #              'форекс usd'='forex_per_year_usd','пасиви'='passive_value_uah','кредити'='loan_value_uah',
  #     #              'к-ть тендерів'='tender_num', 'сума тендерів'='tender_sum', 'логін'='login'),
  #     
  #     extensions = c("FixedColumns", 'FixedHeader', 'Buttons', 'KeyTable', 'RowReorder','Responsive'),
  #     #style = "bootstrap",extensions = c('Buttons'),
  #     options = list(
  #       language = list(search = 'Пошук:', lengthMenu = "_MENU_", info = "Показано від _START_ до _END_ з _TOTAL_ клієнтів",
  #                       paginate = list("previous" = "Попередня", "next" = "Наступна", "first" = "Перша", "last" = "Остання"),
  #                       emptyTable = "Не має даних",
  #                       zeroRecords = "Інформацію не знайдено",
  #                       loadingRecords = "Йде завантаження...",
  #                       processing = ""),
  #       
  #       #         {
  #       #     "decimal":        "",
  #       #     "emptyTable":     "No data available in table",
  #       #     "info":           "Showing _START_ to _END_ of _TOTAL_ entries",
  #       #     "infoEmpty":      "Showing 0 to 0 of 0 entries",
  #       #     "infoFiltered":   "(filtered from _MAX_ total entries)",
  #       #     "infoPostFix":    "",
  #       #     "thousands":      ",",
  #       #     "lengthMenu":     "Show _MENU_ entries",
  #       #     "loadingRecords": "Loading...",
  #       #     "processing":     "",
  #       #     "search":         "Search:",
  #       #     "zeroRecords":    "No matching records found",
  #       #     "paginate": {
  #       #         "first":      "First",
  #       #         "last":       "Last",
  #       #         "next":       "Next",
  #       #         "previous":   "Previous"
  #       #     },
  #       #     "aria": {
  #       #         "orderable":  "Order by this column",
  #       #         "orderableReverse": "Reverse order this column"
  #       #     }
  #       # }
  #       
  #       Responsive = TRUE,
  #       fixedHeader = TRUE,
  #       RowReorder = TRUE,
  #       keys = FALSE,
  #       scroller = TRUE,
  #       pageLength = 1, #-1 to show all elements
  #       deferRender = TRUE,
  #       scrollY = 480,
  #       dom = 'Prtip',
  #       processing = TRUE,
  #       #B - Buttons
  #       #l - Length changing input control
  #       #f - Filtering input
  #       #r - pRocessing display element
  #       #t - Table
  #       #i - Table information summary
  #       #p - Pagination control
  #       
  #       #lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
  #       #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
  #       #buttons = c('excel'),
  #       paging = FALSE, 
  #       #searching = TRUE, 
  #       info = FALSE,
  #       sort = FALSE, 
  #       scrollX = TRUE
  #       #fixedColumns = list(leftColumns = 4, rightColumns = 1)
  #       
  #       #autoWidth = TRUE
  #       # columnDefs = list((list(targets = c(2), visible = TRUE, width = "1px")),
  #       #                   (list(targets = c(3), visible = TRUE, width = "500px%")),
  #       #                   (list(targets = c(5), visible = TRUE, width = "200px%")))
  #       #columnDefs = list(list(width = '50%', targets = c(5, 6)))
  #       
  #       #columnDefs = list(list(width = '1px', targets = "_all"))
  #       #columnDefs = list(list(width = '100%', targets = list(2,3,4)))
  #     ),
  #     #add the fillContainer=T before or after options.
  #     fillContainer = F,
  #     class = list("display",stripe = FALSE),
  #     #filter = 'top',
  #   ) #%>%
  #     #formatStyle(
  #     # 'employee_num',
  #     # background = styleColorBar(data$employee_num, 'yellow'),
  #     # backgroundSize = '100% 90%',
  #     #  backgroundRepeat = 'no-repeat',
  #     #backgroundPosition = 'center'
  #     #) %>%
  #     #formatStyle(
  #     #  'forex_per_year_usd',
  #     #  background = styleColorBar(data$forex_per_year_usd, 'green'),
  #     #  backgroundSize = '100% 90%',
  #   #  backgroundRepeat = 'no-repeat',
  #   #backgroundPosition = 'center'
  #   #) %>%
  #   #formatRound(c('форекс usd', 'кредити','пасиви', 'виручка', 'к-ть тендерів', 'сума тендерів'), 0, mark = " ") #%>% formatStyle(1:30,color='white')
  #   #%>% 
  #   #formatStyle(c("forex_per_year_usd", "passive_value_uah"), backgroundColor = styleInterval(seq(5, 320000, 1000), colorRampPalette(c("white", "#6baed6"))(length(seq(5, 320000, 1000)) + 1)))
  #   #formatStyle(columns = c("sek"), width='10px')
  # })
  
  
  # proxy <- dataTableProxy("finzvit")
  # observe({
  #   replaceData(proxy, datafinzvit(), resetPaging = FALSE, rownames = FALSE)
  # })

# 
#   reactable_extras_server(
#   
#     "new_clients",
#     data = dataR,
#                   style = list(fontSize = '9px'),
#                   searchable = TRUE,
#                   highlight = TRUE,
#                   borderless = FALSE,
#                   striped = FALSE,
#                   compact = TRUE,
#                   wrap = FALSE,
#                   resizable = TRUE,
#                   showSortable = TRUE,
#                   height = 624,
#                   total_pages = 10,
#                    showPageSizeOptions = TRUE,
#                    pageSizeOptions = c(10, 25, 50, 100),
#                    defaultPageSize = 25,
# 
#                   defaultColDef = colDef(
#                     #header = function(value) gsub(".", " ", value, fixed = TRUE),
#                     #cell = function(value) format(value, nsmall = 1),
#                     #minWidth = 70,
#                     #style = list(position = "sticky", left = 0, zIndex = 1),
#                     vAlign = "center",
#                     headerVAlign = "bottom",
#                     #headerStyle = list(position = "sticky", left = 0, zIndex = 1,align = "center"),
#                   ),
# 
#                    columns = list(
# 
#                      finzvit = colDef(
#                        name = "",
#                        sortable = FALSE,
#                        maxWidth = 85,
#                        cell = function(value, rowIndex, colName){
#                          as.character(tags$div(
#                            
#                            tags$button(
#                              onclick =
#                                sprintf(
#                                  'Shiny.setInputValue("finzvit", %d, {priority: "event"})',
#                                  dataR$pr[rowIndex]
#                                ),
#                              
#                              id='finzvitt',
#                              'data-toggle'='modal',
#                              'data-target'='#modalExample',
#                              title='фінансова звітність',
#                              class='btn btn-primary btn-sm',
#                              style='margin-left:5px; margin-right:0px',
#                              tags$i(class='fa-regular fa-file-lines')
#                            ),
#                            tags$button(
#                              #"edit",
#                              #"<a title='внести зміни' class='btn btn-primary btn-sm' style='margin-left:5px; margin-right:0px' onClick='%s'><i class='fas fa-edit'></i></a>",
#                              onclick =
#                                sprintf(
#                                  'Shiny.setInputValue("edit", %d, {priority: "event"})',
#                                  dataR$pr[rowIndex]
#                                ),
# 
#                              title='внести зміни',
#                              class='btn btn-primary btn-sm',
#                              style='margin-left:5px; margin-right:0px',
#                              tags$i(class='fas fa-edit')
#                            )
#                          ))
#                        },
# 
#                        html = TRUE
#                      ),
# 
#                      cl = colDef(minWidth = 200,
# 
#                                  #sticky = "left",
#                                  #style = list(borderRight = "1px solid #eee"),
#                                  #headerStyle = list(borderRight = "1px solid #eee")
#                                  ),   # 50% width, 200px minimum
#                      status = colDef(minWidth = 130),   # 25% width, 100px minimum
#                      last_client_result = colDef(minWidth = 120),  # 25% width, 100px minimum
#                      emp = colDef(maxWidth = 40),  # 25% width, 100px minimum
#                      pr = colDef(maxWidth = 60),  # 25% width, 100px minimum
# 
# 
# 
#                      icon = colDef(maxWidth = 40,cell = function(value) {
#                        image <- img(src = value, style = "height: 25px;", alt = value)
# 
#                        tagList(
#                          div(style = "display: inline-block; width: 45px;", image),
#                        )
# 
# 
#                      }),
# 
#                       client_history = colDef(show = FALSE)
# 
#                    ),
#                  
# 
#                    theme = reactableTheme(
#                      color = "hsl(233, 9%, 87%)",
#                      backgroundColor = "hsl(233, 9%, 19%)",
#                      borderColor = "hsl(233, 9%, 22%)",
#                      stripedColor = "hsl(233, 12%, 22%)",
#                      highlightColor = "hsl(233, 12%, 24%)",
#                      inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
#                      selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
#                      pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
#                      pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
#                      style = list(fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
#                      searchInputStyle = list(width = "100%")
#                    )
# 
#   )

  # observeEvent(input$edit, {
  #   # Select rows
  #   print("UPDATE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  #   updateReactable("new_clients")
  # })
  # 

#   observeEvent(input$save, {
#     # Select rows
#     print("SAVE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
#     # print(input$edit)
#     # print(data()[data()$pr == input$edit,])
#     #data()[data()$pr == input$edit,]$status <-
# 
#     #data$df[data$df$pr == input$edit,]$status <- as.character(input$status)
#     #updateReactable("new_clients",data = data$df)
#     
#     ssql <- "SELECT top 1000 pr
#        ,iif([client_name_short] is NULL or [client_name_short] = '',[client_name],[client_name_short]) as cl
#  	  	  ,[dbo].[status_icons].[icon]
#  	  ,[dbo].[database].[status]
#  	  ,[last_client_result]
#      ,[employee_num] as emp
#  	  ,[forex_per_year_usd]
#        ,[loan_value_uah]
#        ,[passive_value_uah]
#  	  ,[revenue_uah]
#  	  ,[tender_num]
#        ,[tender_sum]
#        ,[sek]
#        ,[kved]
#        ,[kved_name]
#        ,[person_details]
#        ,[phone]
#        ,[full_address]
#        ,[kobl]
#        ,[login]
#      --,FORMAT ([last_date_contact], 'd', 'hy-AM') as [last_date_contact]
#  	  ,[client_history]
#  	  --,[comments]
# 
#    FROM [crmsystem].[dbo].[database] INNER JOIN
#                    [crmsystem].[dbo].[status_icons] ON [database].status = [status_icons].status
#    where login = '"
#     #where login = 'olanhaieva'"
#     
#     
#     con <- odbcDriverConnect('driver={SQL Server};server=LAPTOP-0915C010\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
#     data <- sqlQuery(con, paste0(ssql,input$managers, "'"))
#     
#     
#     #data <- sqlQuery(con, paste0(ssql,isTruthy(auth$user), "'"))
#   
# 
# proxy <- dataTableProxy("new_clients")
# 
#   replaceData(proxy, data, resetPaging = FALSE, rownames = FALSE,clearSelection = TRUE)
#   on.exit(RODBC::odbcClose(con))
# 
#   })
#   
  
  
  output$new_clients <- renderReactable({
    
    status_badge <- function(color = "#aaa", width = "0.55rem", height = width) {
      span(style = list(
        display = "inline-block",
        marginRight = "0.5rem",
        width = width,
        height = height,
        backgroundColor = color,
        borderRadius = "50%"
      ))
    }
    
    is.Date <- function(date) {
      if (sapply(date, function(x)
        ! all(is.na(as.Date(
          as.character(x),
          format = c("%d.%m.%Y", "%d-%m-%Y", "%Y/%m/%d", "%Y-%m-%d")
        ))))) {
        return(TRUE)
      } else{
        return(FALSE)
      }
    }

    bar_style <- function(width = 1, fill = "#e6e6e6", height = "75%",
                          align = c("left", "right"), color = NULL) {
      align <- match.arg(align)
      if (align == "left") {
        position <- paste0(width * 100, "%")
        image <- sprintf("linear-gradient(90deg, %1$s %2$s, transparent %2$s)", fill, position)
      } else {
        position <- paste0(100 - width * 100, "%")
        image <- sprintf("linear-gradient(90deg, transparent %1$s, %2$s %1$s)", position, fill)
      }
      list(
        backgroundImage = image,
        backgroundSize = paste("100%", height),
        backgroundRepeat = "no-repeat",
        backgroundPosition = "center",
        color = color
      )
    }
    
    
    tbl <- reactable(
      

      data(),
              style = list(fontSize = '9px'),
              searchable = TRUE,
              highlight = TRUE,
              borderless = FALSE,
              striped = FALSE,
              compact = TRUE,
              wrap = FALSE,
              resizable = TRUE,
              showSortable = TRUE,
              #height = 610, #624
               showPageSizeOptions = TRUE,
               pageSizeOptions = c(10, 25, 50, 100),
               defaultPageSize = 100,
              

              defaultColDef = colDef(
                #header = function(value) gsub(".", " ", value, fixed = TRUE),
                #cell = function(value) format(value, nsmall = 1),
                #minWidth = 70,
                #style = list(position = "sticky", left = 0, zIndex = 1),
                vAlign = "center",
                headerVAlign = "bottom",
                #headerStyle = list(position = "sticky", left = 0, zIndex = 1,align = "center"),
              ),
      
      

               columns = list(

                 finzvit = colDef(
                   name = "",
                   sortable = FALSE,
                   maxWidth = 75,
                   # cell = function(value, rowIndex, colName){
                   #   as.character(tags$div(
                   #     tags$button(
                   #       #"finzvit",
                   #       #"<a id='finzvitt' title='фінансова звітність' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#modalExample' style='margin-left:0px; background-color: #e95420; border-color: #c34113' onClick='%s'><i class='fa-regular fa-file-lines'></i></a>",
                   # 
                   #       onclick =
                   #         sprintf(
                   #           'Shiny.setInputValue("finzvit", %d, {priority: "event"})',
                   #           data()$pr[rowIndex]
                   #         ),
                   #       id='finzvitt',
                   #       'data-toggle'='modal',
                   #       'data-target'='#modalExample',
                   #       title='фінансова звітність',
                   #       class='btn btn-primary btn-sm',
                   #       style='margin-left:5px; margin-right:0px',
                   #       tags$i(class='fa-regular fa-file-lines')
                   #     ),
                   #     tags$button(
                   #       #"edit",
                   #       #"<a title='внести зміни' class='btn btn-primary btn-sm' style='margin-left:5px; margin-right:0px' onClick='%s'><i class='fas fa-edit'></i></a>",
                   #       onclick =
                   #         sprintf(
                   #           'Shiny.setInputValue("edit", %d, {priority: "event"})',
                   #           data()$pr[rowIndex]
                   #         ),
                   # 
                   #       title='внести зміни',
                   #       class='btn btn-primary btn-sm',
                   #       style='margin-left:5px; margin-right:0px',
                   #       tags$i(class='fas fa-edit')
                   #     )
                   #   ))
                   # },
                   
                   #sticky = "left",
                   #style = sticky_style,
                   #headerStyle = sticky_style,
                  
                   html = TRUE,
                   sticky = "left"
                 ),
                 
                 

                 cl = colDef(name = "назва клієнта", minWidth = 200,sticky = "left"

                             #sticky = "left",
                             #style = list(borderRight = "1px solid #eee"),
                             #headerStyle = list(borderRight = "1px solid #eee")
                             ),   # 50% width, 200px minimum
                 status = colDef(name = "статус", minWidth = 130,sticky = "left"
                                 
                                
                                 
                                 # cell = function(value) {
                                 #   color <- switch(
                                 #     value,
                                 #     'запланований повторний дзвінок' = "lightgreen",
                                 #     'запланована зустріч' = "cyan",
                                 #     'відмова' = "red",
                                 #     'продана послуга' = "magenta",
                                 #     'не був оброблений' = "orange"
                                 #   )
                                 #   badge <- status_badge(color = color)
                                 #   tagList(badge, value)
                                 # }
                                 
                                 
                                 ),  
                 last_client_result = colDef(name = "останній результат по клієнту", minWidth = 120, na = "–", sticky = "left",
                                             
                                             style = function(value) {

                                               if (is.Date(value)){


                                                     if (dmy(value) >= Sys.Date()) {
                                                       color <- "lightgreen"
                                                     } else {
                                                       color <- "red"
                                                     }
                                                     list(color = color, fontWeight = "bold")

                                                 }

                                             }
                                             
                                             ),  
                 emp = colDef(name = "к-ть прац",maxWidth = 70, na = "-", format = colFormat(separators = TRUE, digits = 0)),  
                 pr = colDef(name = "єдрпоу", maxWidth = 60,sticky = "left",align = "center"),  
                 forex_per_year_usd = colDef(name = "форекс за рік, дол", minWidth = 100,
                                             format = colFormat(prefix = "$", separators = TRUE, digits = 0),
                                             
                                             style = function(value) {
                                               bar_style(width = value / max(data()$forex_per_year_usd[data()$login == input$managers]), fill = "#2c5e77", color = "#fff")
                                             },
                                             
                                             ),
                 loan_value_uah = colDef(name = "кредити, грн", maxWidth = 80,
                                         format = colFormat(separators = TRUE, digits = 0),
                                         
                                         style = function(value) {
                                           bar_style(width = value / max(data()$loan_value_uah[data()$login == input$managers]), fill = "magenta", color = "#fff")
                                         },
                                         
                                         ),  
                 passive_value_uah = colDef(name = "пасиви, грн", maxWidth = 80,
                                            format = colFormat(separators = TRUE, digits = 0),
                                            
                                            style = function(value) {
                                              bar_style(width = value / max(data()$passive_value_uah[data()$login == input$managers]), fill = "#df691a", color = "#fff")
                                            },
                                            
                                            
                                            ),  
                 revenue_uah = colDef(name = "виручка, грн", maxWidth = 80,
                                      format = colFormat(separators = TRUE, digits = 0),
                                      
                                      style = function(value) {
                                        bar_style(width = value / max(data()$revenue_uah[data()$login == input$managers]), fill = "darkred", color = "#fff")
                                      },
                                      
                                      ),  
                 tender_num = colDef(name = "к-ть тендерів", maxWidth = 80, 
                                     format = colFormat(separators = TRUE, digits = 0)),  
                 tender_sum = colDef(name = "сума тендерів", maxWidth = 90,
                                     format = colFormat(separators = TRUE, digits = 0),
                                     
                                     style = function(value) {
                                       bar_style(width = value / max(data()$tender_sum[data()$login == input$managers]), fill = "#0E6655", color = "#fff")
                                     },
                                     
                                     ), 
                 sek = colDef(name = "сектор", maxWidth = 50),  
                 person_details = colDef(name = "керівник", minWidth = 200),  
                 phone = colDef(name = "телефон", minWidth = 100),  
                 login = colDef(name = "логін", minWidth = 60), 
                 full_address = colDef(name = "повна адреса", minWidth = 200),  
                 kobl = colDef(name = "код обл", maxWidth = 60),  
                 kved = colDef(name = "квед", maxWidth = 50),  
                 kved_name = colDef(name = "назва квед", minWidth = 200), 



                 icon = colDef(
                   name = "",
                   maxWidth = 40,
                   sortable = FALSE,
                   html = TRUE,
                   sticky = "left"
                 #   
                 #   cell = function(value,rowIndex) {
                 #   image <- img(src = value, style = "height: 25px;", alt = value, id=data$df$pr[rowIndex])
                 # 
                 #   tagList(
                 #     div(style = "display: inline-block; width: 45px;", image),
                 #   )
                 #   #document.getElementById('205096').src='chat.png'
                 # 
                 # 
                 # }
#<img src="question.png" style="height: 25px;" alt="question.png" id="2717802"/>
                # cell =  JS(
                #    "function(rowInfo) {
                #                 if (rowInfo.values['status'] == 'запланована зустріч') {
                #                   return { <img src='question.png' style='height: 25px;' alt='question.png'/>}
                #                 } else if (rowInfo.values['status'] == 'відмова') {
                #                   return { backgroundColor: 'blue', color: 'white', fontWeight: 600 }
                #                 } else {
                #                   return { backgroundColor: 'grey', color: 'black', fontWeight: 600 }
                #                 }
                #               }"
                #  )
                 
                 ),
                 

               #  sek = colDef(show = FALSE),
              #   kved = colDef(show = FALSE),
              #   kved_name = colDef(show = FALSE),
                  client_history = colDef(show = FALSE)
              #   person_details= colDef(show = FALSE),
              #   phone = colDef(show = FALSE),
              #   login = colDef(show = FALSE),
              #   full_address = colDef(show = FALSE),
              #   kobl = colDef(show = FALSE)
               ),
              #
              # # if there exists a comment, make row expandable
              # details = function(index) {
              #
              #   #selectize-input items full has-options has-items
              #   data_details <- data() %>% select(pr, sek, kved,kved_name, person_details, phone, full_address, kobl, client_history, login)
              #
              #
              #   sales <- filter(data_details, pr == data()$pr[index]) %>% select(-pr)
              #   tbl <- reactable(sales, outlined = TRUE, highlight = TRUE, fullWidth = FALSE,
              #
              #                    theme = reactableTheme(
              #                      color = "hsl(233, 9%, 87%)",
              #                      backgroundColor = "hsl(233, 9%, 19%)",
              #                      borderColor = "hsl(233, 9%, 22%)",
              #                      stripedColor = "hsl(233, 12%, 22%)",
              #                      highlightColor = "hsl(233, 12%, 24%)",
              #                      inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
              #                      selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
              #                      pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
              #                      pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
              #                      style = list(
              #                        fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"
              #                      ),
              #                      searchInputStyle = list(width = "100%")
              #                    )
              #
              #                    )
                 #htmltools::div(style = list(margin = "12px 45px"), tbl)

                 # html <- function(x, inline = FALSE) {
                 #   container <- if (inline) htmltools::span else htmltools::div
                 #   container(dangerouslySetInnerHTML = list("__html" = x))
                 # }
                 #
                 # if(data()$kved_name[index] != "") {
                 #   htmltools::tagList(
                 #     html("kved_name"),
                 #     html(data()$kved_name[index]),
                 #     html("kved"),
                 #     html(data()$kved[index]),
                 #     html("client_history"),
                 #     html(data()$client_history[index])
                 #   )
                 #
                 # }



               #},

#2b3e50
               theme = reactableTheme(
                 color = "hsl(233, 9%, 87%)",
                 backgroundColor = "#2b3e50",
                 borderColor = "#2b3e50",
                 stripedColor = "hsl(233, 12%, 22%)",
                 highlightColor = "hsl(233, 12%, 24%)",
                 inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
                 selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
                 pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
                 pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
                 style = list(
                   fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"
                 ),
                 searchInputStyle = list(width = "100%",backgroundColor = "#2b3e50")
               ),
              
              language = reactableLang(
                searchPlaceholder = "Пошук...",
                noData = "Даних не знайдено",
                pageInfo = "{rowStart} до {rowEnd} з {rows} записів",
                pageSizeOptions = "Показати {rows}",
                pagePrevious = "Попередня",
                pageNext = "Наступна",
                # Accessible labels for assistive technologies such as screen readers.
                # These are already set by default, but don't forget to update them when
                # changing visible text.
                pagePreviousLabel = "Попередня",
                pageNextLabel = "Наступна"
              )

# theme = reactableTheme(
#   color = "hsl(233, 9%, 87%)",
#   backgroundColor = "hsl(233, 9%, 19%)",
#   borderColor = "hsl(233, 9%, 22%)",
#   stripedColor = "hsl(233, 12%, 22%)",
#   highlightColor = "hsl(233, 12%, 24%)",
#   inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
#   selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
#   pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
#   pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
#   style = list(
#     fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"
#   ),
#   searchInputStyle = list(width = "100%")
# )

              )


    # datatable(
    #   isolate(data()),
    #   escape = FALSE,
    #   selection = "none",
    #   rownames = FALSE,
    #    #callback = JS("$('select.shiny-input-select selectized shiny-bound-input').append($('#managers'));"),
    #   #colnames = c('','єдрпоу', 'Are', 'Some', 'New', 'Names'),
    #   colnames = c('єдрпоу'='pr', 'назва клієнта'='cl', 'статус' = 'status',
    #                'результат роботи' = 'last_client_result', 'к-ть прац.' = 'emp', 'адреса' = 'full_address',
    #                'код обл.'='kobl', 'квед' = 'kved', 'назва квед' = 'kved_name', 'виручка'='revenue_uah', 'сектор'='sek',
    #                'особисті дані'='person_details', 'телефон'='phone', 'історія роботи з клієнтом'='client_history',
    #                'форекс usd'='forex_per_year_usd','пасиви'='passive_value_uah','кредити'='loan_value_uah',
    #                'к-ть тендерів'='tender_num', 'сума тендерів'='tender_sum', 'логін'='login'),
    #
    #   extensions = c("FixedColumns", 'FixedHeader', 'Buttons', 'KeyTable', 'RowReorder','Responsive'),
    #   #style = "bootstrap",extensions = c('Buttons'),
    #   options = list(
    #     language = list(search = 'Пошук:', lengthMenu = "_MENU_", info = "Показано від _START_ до _END_ з _TOTAL_ клієнтів",
    #                     paginate = list("previous" = "Попередня", "next" = "Наступна", "first" = "Перша", "last" = "Остання"),
    #                     emptyTable = "Не має даних",
    #                     zeroRecords = "Інформацію не знайдено",
    #                     loadingRecords = "Йде завантаження...",
    #                     processing = ""),
    #     #dom = '<"row"<"col-sm-4"l><"col-sm-4 text-center"<"selectize-input items full has-options has-items">><"col-sm-4"f>>tip',
    #
    #     #         {
    #     #     "decimal":        "",
    #     #     "emptyTable":     "No data available in table",
    #     #     "info":           "Showing _START_ to _END_ of _TOTAL_ entries",
    #     #     "infoEmpty":      "Showing 0 to 0 of 0 entries",
    #     #     "infoFiltered":   "(filtered from _MAX_ total entries)",
    #     #     "infoPostFix":    "",
    #     #     "thousands":      ",",
    #     #     "lengthMenu":     "Show _MENU_ entries",
    #     #     "loadingRecords": "Loading...",
    #     #     "processing":     "",
    #     #     "search":         "Search:",
    #     #     "zeroRecords":    "No matching records found",
    #     #     "paginate": {
    #     #         "first":      "First",
    #     #         "last":       "Last",
    #     #         "next":       "Next",
    #     #         "previous":   "Previous"
    #     #     },
    #     #     "aria": {
    #     #         "orderable":  "Order by this column",
    #     #         "orderableReverse": "Reverse order this column"
    #     #     }
    #     # }
    #
    #     Responsive = TRUE,
    #     fixedHeader = TRUE,
    #     RowReorder = TRUE,
    #     keys = FALSE,
    #     scroller = TRUE,
    #     pageLength = 100, #-1 to show all elements
    #     deferRender = FALSE,
    #     scrollY = 512,
    #     dom = 'lPfrtip',
    #     processing = TRUE,
    #     #language = list(url = "datatable.frFR.json"),
    #     #B - Buttons
    #     #l - Length changing input control
    #     #f - Filtering input
    #     #r - pRocessing display element
    #     #t - Table
    #     #i - Table information summary
    #     #p - Pagination control
    #
    #     lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
    #     #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
    #     #buttons = c('excel'),
    #     paging = TRUE,
    #     searching = TRUE,
    #     info = TRUE,
    #     sort = TRUE,
    #     scrollX = FALSE
    #     #fixedColumns = list(leftColumns = 4, rightColumns = 1)
    #
    #      #autoWidth = FALSE,
    #      #columnDefs = list(list(width = '1000px', targets = c(3)))
    #     #columnDefs = (list(list(width = '1000px', targets =c(3, 5, 6,15)), list(width = '1px', targets =c(2))))
    #     #autoWidth = FALSE,
    #     # columnDefs = list((list(targets = c(2), visible = TRUE, width = "1px")),
    #     #                   (list(targets = c(3), visible = TRUE, width = "500px%")),
    #     #                   (list(targets = c(5), visible = TRUE, width = "200px%")))
    #     #columnDefs = list(list(width = '50%', targets = c(5, 6)))
    #
    #     #columnDefs = list(list(width = '200px', targets = "_all"))
    #     #columnDefs = list(list(width = '100%', targets = list(2,3,4)))
    #   ),
    #   #add the fillContainer=T before or after options.
    #   fillContainer = FALSE
    #   #       class = list("display",stripe = FALSE),
    #   # callback = JS("$('div.button').append($('#CR1_S1'));"),
    #
    #
    #   #filter = 'top',
    # ) %>%
    #   #formatStyle(
    #   # 'employee_num',
    #   # background = styleColorBar(data$employee_num, 'yellow'),
    #   # backgroundSize = '100% 90%',
    #   #  backgroundRepeat = 'no-repeat',
    #   #backgroundPosition = 'center'
    #   #) %>%
    #   #formatStyle(
    #   #  'forex_per_year_usd',
    #   #  background = styleColorBar(data$forex_per_year_usd, 'green'),
    #   #  backgroundSize = '100% 90%',
    # #  backgroundRepeat = 'no-repeat',
    # #backgroundPosition = 'center'
    # #) %>%
    # formatRound(c('форекс usd', 'кредити','пасиви', 'виручка', 'к-ть тендерів', 'сума тендерів'), 0, mark = " ") #%>% formatStyle(1:30,color='white')
    # #%>%
    # #formatStyle(c("forex_per_year_usd", "passive_value_uah"), backgroundColor = styleInterval(seq(5, 320000, 1000), colorRampPalette(c("white", "#6baed6"))(length(seq(5, 320000, 1000)) + 1)))
    # #formatStyle(columns = c("sek"), width='10px')

    
  })
  

  
  #output$model <- renderPrint({
  #  print(input$okpo_clicked)
  #})
  
  observeEvent(input$edit, {
    
    # state <- getReactableState("new_clients")
    # print(state)

    
#     ssql <- "SELECT [pr]
#       ,iif([client_name_short] is NULL or [client_name_short] = '',[client_name],[client_name_short]) as cl
# 	  ,[status]
#       ,[employee_num] as emp
#       ,[full_address]
#       ,[kobl]
#       ,[kved]
#       ,[kved_name]
# 	  ,[forex_per_year_usd] as fpyu
#       ,[loan_value_uah] as loan_v_u
#       ,[passive_value_uah] as pass_v_u
# 	  ,[revenue_uah]
# 	  ,[tender_num] as ten_n
#       ,[tender_sum] as ten_s
#       ,[sek]
#       ,[person_details]
#       ,[phone]
# 	  ,[last_client_result]
#       ,CAST( [last_date_contact] AS Date ) as [last_date_contact]
# 	  ,[client_history]
# 	  ,[comments]
# 	  --,[login]
#   FROM [dbo].[database]
#   where login = '"
  #where login = 'olanhaieva' and pr="
    
    ssql <-    "SELECT pr,

CASE
WHEN client_name_short is NULL or client_name_short = '' THEN client_name
ELSE client_name_short
END AS cl
	  ,status
      ,employee_num as emp
      ,full_address
      ,kobl
      ,kved
      ,kved_name
	  ,forex_per_year_usd as fpyu
      ,loan_value_uah as loan_v_u
      ,passive_value_uah as pass_v_u
	  ,revenue_uah
	  ,tender_num as ten_n
      ,tender_sum as ten_s
      ,sek
      ,person_details
      ,phone
	  ,last_client_result
      ,CAST(last_date_contact AS Date ) as last_date_contact
	  ,client_history
	  ,comments
  FROM a9pt7elh5dx2d96q.database
  where login = '"
    
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data <- sqlQuery(con,paste0(ssql,input$edit))
    #data <- RODBC::sqlQuery(con, paste0(ssql,input$managers, "' and pr=", input$edit))
    
    #on.exit(RODBC::odbcClose(con))
    
     
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    data <- DBI::dbGetQuery(pool,  paste0(ssql,input$managers, "' and pr='", input$edit,"'"))

    
    #on.exit(DBI::dbDisconnect(con))
    
    hold <- data
    
    hold$client_history <- gsub(pattern = "<br/>", replacement = "\n", x = hold$client_history)
    
    showModal(
      modalDialog(
        fluidRow(
          column(
            width = 12,
            # selectInput(inputId = 'status', label = 'Статус',  
            #             choices = c('відмова', 'запланована зустріч', 'запланований повторний дзвінок',
            #                         'продана послуга', 'не був оброблений'),
            #             selected = ifelse(is.null(hold), "", hold$status),selectize = TRUE),
            
            tags$head(tags$style(".my-class {font-size:12px;border-color: white;background-color: #4e5d6c;}")),
            tags$div(tags$style(".btn.dropdown-toggle.my-class:focus {border-color: #4e5d6c;background-color: #4e5d6c;}")),
       
            #tags$head(tags$style(".dropdown-menu.open.my-class {font-size:12px;border-color: white;background-color: #4e5d6c;}")),
            
            pickerInput(inputId = "status",
                        label = "Статус:",
                        selected = ifelse(is.null(hold), "", hold$status),
                        options = pickerOptions(style = "my-class"),
                        choices = c("відмова","запланована зустріч","запланований повторний дзвінок", "продана послуга", "не був оброблений"),
                        choicesOpt = list(content = c("<img src='cancel.png' width=25px> відмова</img>",
                                                      "<img src='chat.png' width=25px> запланована зустріч</img>",
                                                      "<img src='phone.png' width=25px> запланований повторний дзвінок</img>",
                                                      "<img src='accordbank.svg' width=25px> продана послуга</img>",
                                                      "<img src='question.png' width=25px> не був оброблений</img>"
                        ))),
            
            uiOutput("test_ui"),
            textAreaInput("history", "Історія роботи з клієнтом:", "", width = "1000px", height = "200px", value = hold$client_history)
            
            # dateInput(inputId = 'last_date_contact', label = 'Дата останнього контакту з клієнтом',value = hold$last_date_contact, 
            #           language = "uk", format = 'dd.mm.yyyy'),
            # actionButton(inputId = "showmodal", label = "showmodal"),
            
            # bsModal("modalExample", title = div("Результат роботи", icon("search",class = "fa-beat")), "showmodal", size = "large", textOutput("text"),
            #         #uiOutput("test_ui")
            #         print("vwevweb ebewb")
            #         ),
            
          )
        ),
        title = hold$cl,
        size = 'l',
        style = "font-size:12px;",
        footer = list(
          modalButton('Відміна'),
          # actionButton(inputId = 'save',
          #              #ns('submit'),
          #              label = 'Зберегти',
          #              class = "btn btn-primary",
          #              style = "color: white"
          # ),
          loadingButton(inputId = 'save',label = 'Зберегти',
                        
                        
                        class = "btn btn-primary",
                        style = "width: 150px;color: white",
                        loadingLabel = "Збереження...",
                        #loadingSpinner = "spinner",
                        loadingSpinner = "circle-notch",
                        #loadingSpinner = "sync",
                        #loadingSpinner = "cog",
          )
        ),
        
        
        tags$script(HTML("document.querySelector('#history').readOnly = true;")),
        
        #runjs('$(".rt-pagination-nav button:nth-child(3)").trigger("click");')
        
        #tags$script(HTML("document.getElementById('history').readOnly = true")),
        
        #       tags$head(tags$style("#modalExample .modal-footer{display:none}
        #                                      .modal-header .close{display:none}")),
        #       tags$script(
        #         HTML("
        # 
        #         document.querySelector('#status').onchange = function() {
        #     console.log(document.querySelector('#status').value);
        #     $(document).ready(function(){
        #                                       $('#modalExample').modal();
        #                                       });
        # }"))
        
        #       ,
        #       tags$script('
        # $( document ).ready(function() {
        #   $("#modalExample").on("hidden.bs.modal", function (event) {
        #   x = new Date().toLocaleString();
        #   window.alert("Ok modal was closed at " + x);
        #   console.log(Shiny.onInputChange("last_modal_close",x));
        # });
        # })
        # ')
      )
      
    )

  })
  
  observeEvent(input$save, {
    
    print("clicked save!!!")
    # print(input$status)
    # print(input$edit)
    #tempdata <- data$df
    page = getReactableState("new_clients")$page
    
#     ssql <- "SELECT [pr]
#       ,iif([client_name_short] is NULL or [client_name_short] = '',[client_name],[client_name_short]) as cl
# 	  ,[status]
#       ,[employee_num] as emp
#       ,[full_address]
#       ,[kobl]
#       ,[kved]
#       ,[kved_name]
# 	  ,[forex_per_year_usd] as fpyu
#       ,[loan_value_uah] as loan_v_u
#       ,[passive_value_uah] as pass_v_u
# 	  ,[revenue_uah]
# 	  ,[tender_num] as ten_n
#       ,[tender_sum] as ten_s
#       ,[sek]
#       ,[person_details]
#       ,[phone]
# 	  ,[last_client_result]
#       ,CAST( [last_date_contact] AS Date ) as [last_date_contact]
# 	  ,[client_history]
# 	  ,[comments]
# 	  --,[login]
#   FROM [dbo].[database]
#   where login = '"
    
  #where login = 'olanhaieva' and pr="
    
    ssql <- "SELECT pr,
    
CASE
WHEN client_name_short is NULL or client_name_short = '' THEN client_name
ELSE client_name_short
END AS cl
	  ,status
      ,employee_num as emp
      ,full_address
      ,kobl
      ,kved
      ,kved_name
	  ,forex_per_year_usd as fpyu
      ,loan_value_uah as loan_v_u
      ,passive_value_uah as pass_v_u
	  ,revenue_uah
	  ,tender_num as ten_n
      ,tender_sum as ten_s
      ,sek
      ,person_details
      ,phone
	  ,last_client_result
      ,CAST(last_date_contact AS Date ) as last_date_contact
	  ,client_history
	  ,comments
  FROM a9pt7elh5dx2d96q.database
    where login = '"
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data <- sqlQuery(con,paste0(ssql,input$edit))
    #data <- RODBC::sqlQuery(con, paste0(ssql,input$managers, "' and pr=", input$edit))
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    data <- DBI::dbGetQuery(pool,  paste0(ssql,input$managers, "' and pr='", input$edit,"'"))
    
    
    #mutate(data, pr = sprintf("%008d", pr)) -> data
    
    #on.exit(RODBC::odbcClose(con))
    hold <- data
    
    #cl_history <- paste("√", input$status, hold[hold$pr == input$edit,]$client_history)
    #client_history <- cat(paste("√", input$status), paste("•", format(Sys.time(), "%d.%m.%Y %X")), hold[hold$pr == input$edit,]$client_history, sep="\n")
    #client_history <- paste(paste("•", input$status), paste("•", format(Sys.time(), "%d.%m.%Y %X")), hold[hold$pr == input$edit,]$client_history, collapse = '\n')
    client_history <- paste(paste("•", input$status), paste("•", format(Sys.time(), "%d.%m.%Y %X")), " ", hold[hold$pr == input$edit,]$client_history, collapse = '<br/>', sep = "<br/>")
    
    cl <- hold$pr
    #print(client_history)
    
    # "√ запланований повторний дзвінок
    # ® 20.10.2021 14:42
    # 
    # √ відкритий рахунок/продана послуга
    # ® 20.10.2021 14:43
    # 
    # √ запланований повторний дзвінок
    # ® 22.10.2021 10:29
    # 
    # √ відмова
    # ® 22.10.2021 10:29
    # 
    # √ запланований повторний дзвінок
    # ® 22.10.2021 10:29
    # 
    # √ запланований повторний дзвінок
    # ® 22.10.2021 10:29
    # 
    # √ запланований повторний дзвінок
    # ® 22.10.2021 10:29
    # 
    # √ запланована зустріч
    # ® 22.10.2021 10:30
    # 
    # √ запланований повторний дзвінок
    # ® 22.10.2021 10:30
    # "
    
    
    # ssql1 <- "UPDATE [dbo].[database]
    # SET status = "
    
    ssql1 <- "UPDATE a9pt7elh5dx2d96q.database
    SET status = "
    
    #format(Sys.time(), "%d.%m.%Y %X")
    
    #con <- odbcDriverConnect('driver={SQL Server};server=LAPTOP-0915C010\\SQLEXPRESS;database=crmsystem;trusted_connection=true')

    
    
    
    # if(input$status == "запланована зустріч" | input$status == "запланований повторний дзвінок"){
    #   data1 <- RODBC::sqlQuery(con,paste0(ssql1,"N'", input$status, "', [last_client_result] = FORMAT (cast('", input$work,"' as Date), 'd', 'hy-AM'), [client_history] = N'", client_history ,"' where login = '", input$managers ,"' and pr=",input$edit))
    #   }else{
    #     data1 <- RODBC::sqlQuery(con,paste0(ssql1,"N'", input$status, "', [last_client_result] = N'", input$work,"', [client_history] = N'", client_history ,"' where login = '", input$managers ,"' and pr=",input$edit))
    #   }
    
    
    if(input$status == "запланована зустріч" | input$status == "запланований повторний дзвінок"){
      #data1 <- RODBC::sqlQuery(con,paste0(ssql1,"'", input$status, "', last_client_result = date_format (cast('", input$work,"' as Date), '%d.%m.%Y'), client_history = '", client_history ,"' where login = '", input$managers ,"' and pr=",input$edit))
      data1 <- DBI::dbGetQuery(
        pool,
        paste0(ssql1,"'", input$status, "', last_client_result = date_format (cast('", input$work,"' as Date), '%d.%m.%Y'), client_history = '", client_history ,"' where login = '", input$managers ,"' and pr='",input$edit, "'")
      )
    }else{
      #data1 <- RODBC::sqlQuery(con,paste0(ssql1,"'", input$status, "', last_client_result = '", input$work,"', client_history = '", client_history ,"' where login = '", input$managers ,"' and pr=",input$edit))
      data1 <- DBI::dbGetQuery(
        pool,
        paste0(ssql1,"'", input$status, "', last_client_result = '", input$work,"', client_history = '", client_history ,"' where login = '", input$managers ,"' and pr='",input$edit,"'")
      )
    }
    
    
    
    #print(paste0(ssql1,"'", input$status, "', [last_client_result] = FORMAT (cast('", input$work,"' as Date), 'd', 'hy-AM'), client_history = '", cl ,"' where login = 'olanhaieva' and pr=",input$edit))
    
    #data$df[data$df$pr == input$edit,]$status <- as.character(input$status)
    #print(head(data$df,1))
    
#     tempdata[tempdata$pr == input$edit,]$status <- input$status
#     tempdata[tempdata$pr == input$edit,]$last_client_result <- as.character(input$work)
#     script <- sprintf("document.getElementById('%s').src=",input$edit)
# 
#     
#     if(input$status == "запланована зустріч"){
#       script <- paste0(script,"'chat.png'")
#       #tempdata[tempdata$pr == input$edit,]$icon <- as.character("chat.png")
#       print(script)
#       runjs(script)
#       updateReactable("new_clients",data = tempdata,page = getReactableState("new_clients")$page)
#     }
#     if(input$status == "запланований повторний дзвінок"){
#       script <- paste0(script,"'phone.png'")
#       #tempdata[tempdata$pr == input$edit,]$icon <- as.character("phone.png")
#       print(script)
#       runjs(script)
#       updateReactable("new_clients",data = tempdata,page = getReactableState("new_clients")$page)
#     }
#     if(input$status == "відкритий рахунок/продана послуга"){
#       script <- paste0(script,"'accordbank.svg'")
#       #tempdata[tempdata$pr == input$edit,]$icon <- as.character("accordbank.svg")
#       print(script)
#       runjs(script)
#       updateReactable("new_clients",data = tempdata,page = getReactableState("new_clients")$page)
#     }
#     if(input$status == "відмова"){
#       script <- paste0(script,"'cancel.png'")
#       #tempdata[tempdata$pr == input$edit,]$icon <- as.character("cancel.png")
#       print(script)
#       runjs(script)
#       updateReactable("new_clients",data = tempdata,page = getReactableState("new_clients")$page)
#     }
#     if(input$status == "не був оброблений"){
#       script <- paste0(script,"'question.png'")
#       #tempdata[tempdata$pr == input$edit,]$icon <- as.character("question.png")
#       print(script)
#       runjs(script)
#       updateReactable("new_clients",data = tempdata,page = getReactableState("new_clients")$page)
#     }
#        
#     #print(tempdata[tempdata$pr == input$edit,])
# 
# 
#     # proxy <- dataTableProxy("new_clients")
#     # observe({
#     #   replaceData(proxy, tempdata, resetPaging = FALSE, rownames = FALSE)
#     # })
#     
#     #runjs("console.log(document.getElementById('203016').rowIndex)")
#     
#     javascript <- sprintf('$(".rt-tbody").each(function( i ) {
#               $(".rt-tr-group", this).each(function( j ) {
#               
#               if($(this).text().match(/%s*/)){
#                   console.log("".concat("row: ", i, ", col: ", j, ", value: ", $(this).text()))
#                   
#                       $(".rt-td-inner", this).each(function( x ) {
#                          
#                          if(x == 4){
#                             console.log("".concat("row: ", i, ", col: ", x, ", value: ", $(this).text()))
#                             $(this).text("%s")
#                          }
#                          if(x == 5){
#                             console.log("".concat("row: ", i, ", col: ", x, ", value: ", $(this).text()))
#                             $(this).text("%s")
#                          }
#                        });
#                   
#               }
#   });
# });', input$edit, input$status, input$work)
#     
#     runjs(javascript)
#     
#     row <- which(tempdata$pr == input$edit)
#     print(tempdata[row,5])
#     print(tempdata[row,7])
    

    # updateReactable("new_clients",data = data(),page = getReactableState("new_clients")$page)

    #input$save
    #input$edit
    #updateReactable("new_clients",data = data(), page = getReactableState("new_clients")$page)

    
    
    # ssql <- sprintf("INSERT INTO [dbo].[hits] (login, status, entrydate) 
    #                                                VALUES ('%s', '%s', '%s')", input$managers, input$status, Sys.time())
    
    ssql <- sprintf("INSERT INTO hits (login, status, entrydate) 
                                                   VALUES ('%s', '%s', '%s')", input$managers, input$status, Sys.time())
    #data2 <- RODBC::sqlQuery(con, ssql)
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    data2 <- DBI::dbGetQuery(pool, ssql)

  
 #    ssql <- "SELECT top 1000 pr
 #       ,iif([client_name_short] is NULL or [client_name_short] = '',[client_name],[client_name_short]) as cl
 # 	  	  ,[dbo].[status_icons].[icon]
 # 	  ,[dbo].[database].[status]
 # 	  ,[last_client_result]
 #     ,[employee_num] as emp
 # 	  ,[forex_per_year_usd]
 #       ,[loan_value_uah]
 #       ,[passive_value_uah]
 # 	  ,[revenue_uah]
 # 	  ,[tender_num]
 #       ,[tender_sum]
 #       ,[sek]
 #       ,[kved]
 #       ,[kved_name]
 #       ,[person_details]
 #       ,[phone]
 #       ,[full_address]
 #       ,[kobl]
 #       ,[login]
 #     --,FORMAT ([last_date_contact], 'd', 'hy-AM') as [last_date_contact]
 # 	  ,[client_history]
 # 	  --,[comments]
 # 
 #   FROM [dbo].[database] INNER JOIN
 #                   [dbo].[status_icons] ON [database].status = [status_icons].status
 #   where login = '"
    
    #where login = 'olanhaieva'"
    
    
    
    ssql <-    "SELECT pr,

CASE
WHEN client_name_short is NULL or client_name_short = '' THEN client_name
ELSE client_name_short
END AS cl
 	  	  ,status_icons.icon
 	  ,`database`.status
 	  ,last_client_result
     ,employee_num as emp
 	  ,forex_per_year_usd
       ,loan_value_uah
       ,passive_value_uah
 	  ,revenue_uah
 	  ,tender_num
       ,tender_sum
       ,sek
       ,kved
       ,kved_name
       ,person_details
       ,phone
       ,full_address
       ,kobl
       ,login
 	  ,client_history

   FROM a9pt7elh5dx2d96q.database  INNER JOIN
                   status_icons ON a9pt7elh5dx2d96q.database.status = status_icons.status 
where login = '"
    
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    
    #data <- RODBC::sqlQuery(con, paste0(ssql,input$managers, "'"))
    
    #data <- RODBC::sqlQuery(con, paste0(ssql,input$managers, "' LIMIT 1000"))
    
    
    data <- DBI::dbGetQuery(pool,  paste0(ssql,input$managers, "' order by pr LIMIT 1000"))
    

    
    #mutate(data, pr = sprintf("%008d", pr)) -> data
    
    edit_onclick = sprintf(
      "Shiny.setInputValue(\"edit\", \"%s\", {priority: \"event\"})",
      data$pr
    )
    
    finzvit_onclick = sprintf(
      "Shiny.setInputValue(\"finzvit\", \"%s\", {priority: \"event\"})",
      data$pr
    )
    
    # button with onClick function
    button_edit <- sprintf(
      "<a title='внести зміни' class='btn btn-primary btn-sm' style='margin-left:5px; margin-right:0px' onClick='%s'><i class='fas fa-edit'></i></a>",
      edit_onclick
    )
    
    # button with onClick function
    button_finzvit <- sprintf(
      "<a id='finzvitt' title='фінансова звітність' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#modalExample' style='margin-left:0px; background-color: #e95420; border-color: #c34113' onClick='%s'><i class='fa-regular fa-file-lines'></i></a>",
      finzvit_onclick
    )
    
    buttons <- paste0(
      '<div class="btn-group" style="width: 75px;" role="group" aria-label="Basic example">',
      button_finzvit,
      button_edit,
      '</div>'
    )
    
    
    data <- cbind(
      tibble("finzvit" = buttons),
      data
    )
    

    
    #observe({
      updateReactable("new_clients", data = data, page = page)
    #})

    #on.exit(RODBC::odbcClose(con))
    
    #on.exit(dbDisconnect(con))
    #poolClose(pool)
    
    removeModal()


  })

  

  
  
  # observeEvent(input$status,{
  #   
  #    
  #   isolate(input$status)
  # 
  #   switch(input$status,"відкритий рахунок/продана послуга" = {
  #                      print("відкритий рахунок/продана послуга")
  #   },
  #   
  #   "запланована зустріч" = {
  #     print("запланована зустріч")
  #   })
  # })
  
  
  
  # observeEvent(input$showmodals,{
  # 
  #   #stat <- reactive({input$status})
  #   #print(input$status)
  #   #removeModal()
  # 
  # })
  
  #   observeEvent(input$status,{
  #     stat$result <- input$status
  # print(stat$result)
  #     #print(input$status)
  #     #removeModal()
  #     
  #   })
  # 
  # stat <- function(){
  #   print(input$status)
  # }
  
  # observe({
  #   stat <- reactive(input$status)
  #   #print("Hello!!!")
  # })
  
  
  # observeEvent(input$status,{
  #   
  #   print(i$counter)
  #   if(i$counter != 0){
  # 
  #   switch(input$status,"відкритий рахунок/продана послуга" = {
  #     print("відкритий рахунок/продана послуга")
  #   },
  # 
  #   "відмова" = {
  #     print("відмова")
  #   },"запланована зустріч" = {
  #     print("запланована зустріч")
  #   })
  # 
  #   }
  # 
  # })
  
  #   runjs("$(document).on('shiny:inputchanged', function(event) {
  #   
  #   if (event.name === 'status') {
  #   event.preventDefault();
  #     console.log('Got it!!!')
  #   }
  # });")
  
  
  #output$text <- renderText(input$status)
  
  observeEvent(input$status,{
    
    print(input$status)
    
    if(input$status == "відмова"){
      output$test_ui <- renderUI({
        tagList(textAreaInput("work", "Зазначте причину відмови:", "", width = "1000px", height = "100px", placeholder = "Коротко опишіть причину відмови"))
        #actionButton(inputId = "ok", label = "Зберегти"))
      })
    }
    else if(input$status == "запланована зустріч"){
      output$test_ui <- renderUI({
        tagList(dateInput(inputId = 'work', label = 'Введіть дату зустрічі:',  weekstart = 1, 
                          language = "uk", format = 'dd.mm.yyyy'))
        #actionButton(inputId = "ok", label = "Зберегти")
        
      })
    }
    else if(input$status == "запланований повторний дзвінок"){
      output$test_ui <- renderUI({
        tagList(dateInput(inputId = 'work', label = 'Введіть дату дзвінка:', weekstart = 1,
                          language = "uk", format = 'dd.mm.yyyy'))
        #actionButton(inputId = "ok", label = "Зберегти"))
      })
      
      
    }
    else if(input$status == "продана послуга"){
      output$test_ui <- renderUI({
        tagList(textAreaInput("work", "Зазначте проданий продукт:", "", width = "1000px", height = "100px", placeholder = "Коротко опишіть проданий продукт"))
        #actionButton(inputId = "ok", label = "Зберегти"))
      })
    }  
    else{
      output$test_ui <- renderUI({
        tagList(renderText("Опрацюйте клієнта"))
        #actionButton(inputId = "ok", label = "Зберегти"))
      })
    }
    
    outputOptions(output, "test_ui", suspendWhenHidden = TRUE) 
  })

  
 
  observeEvent(input$ok,{
    
    if(input$status != "не був оброблений"){
      print(input$work)
    }
    
    #removeModal()
 })
  
  
  
  
  #balance<- reactiveValues(data = data.frame())
  # client<- reactiveValues(name = "")
  
  observeEvent(input$finzvit,{
    
    okpo <- ""
    
    if (nchar(input$finzvit)<8){
      okpo <- paste0(strrep(0, 8-nchar(input$finzvit)),input$finzvit)
    }else{
      okpo <- input$finzvit
    }
    
    client$name <- data()[data()$pr==input$finzvit,]$cl
    print(data()[data()$pr==input$finzvit,]$cl)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    
    # ssql <- sprintf("SELECT cast(id as int) as id, ARTICLE as 'Назва статті', balance_articles.ROW as 'Код рядка', [01-01-2023] as '01.01.2023',[01-01-2022] as '01.01.2022',[01-01-2021] as '01.01.2021',[01-01-2020] as '01.01.2020'
    #          from (SELECT * FROM [crmsystem].[dbo].[DATABASEFINZVIT] where okpo = '%s') as pv
    #          pivot (max(SUMM) for DATE in ([01-01-2023],[01-01-2022],[01-01-2021],[01-01-2020])) as pvt 
    #          right join balance_articles on pvt.ROW = balance_articles.ROW 
    #          order by id", okpo)  
    
    
    
#     ssql <- sprintf("SELECT cast(id as int) as id, ARTICLE as 'Назва статті', balance_articles.ROW as 'Код рядка', 
# iif(balance_articles.ROW IS NOT NULL and [01-01-2024] IS NULL,0,[01-01-2024]) as '01.01.2024',
# iif(balance_articles.ROW IS NOT NULL and [01-01-2023] IS NULL,0,[01-01-2023]) as '01.01.2023',
# iif(balance_articles.ROW IS NOT NULL and [01-01-2022] IS NULL,0,[01-01-2022]) as '01.01.2022', 
# iif(balance_articles.ROW IS NOT NULL and [01-01-2021] IS NULL,0,[01-01-2021]) as '01.01.2021', 
# iif(balance_articles.ROW IS NOT NULL and [01-01-2020] IS NULL,0,[01-01-2020]) as '01.01.2020'
# from (SELECT * FROM [DATABASEFINZVIT] where okpo = '%s') as pv
# pivot (max(SUMM) for DATE in ([01-01-2024],[01-01-2023],[01-01-2022],[01-01-2021],[01-01-2020])) as pvt 
# right join balance_articles on pvt.ROW = balance_articles.ROW 
# order by id", okpo)
    
    ssql <-  sprintf("SELECT QQ.id, QQ.ARTICLE as 'Назва статті', QQ.ROW as 'Код рядка', ifnull(QQ.`01.01.2025`,0) as '01.01.2025', ifnull(QQ.`01.01.2024`,0) as '01.01.2024', ifnull(QQ.`01.01.2023`,0) as '01.01.2023', ifnull(QQ.`01.01.2022`,0) as '01.01.2022', ifnull(QQ.`01.01.2021`,0) as '01.01.2021', ifnull(QQ.`01.01.2020`,0) as '01.01.2020' 
FROM 
( Select * from (SELECT `ROW` AS `ROWS`,
SUM(CASE
  WHEN DATE = '01-01-2025' THEN SUMM ELSE 0 END
) AS '01.01.2025',
SUM(CASE
  WHEN DATE = '01-01-2024' THEN SUMM ELSE 0 END
) AS '01.01.2024',
SUM(CASE
  WHEN DATE = '01-01-2023' THEN SUMM ELSE 0 END
) AS '01.01.2023',
SUM(CASE
  WHEN DATE = '01-01-2022' THEN SUMM ELSE 0 END
) AS '01.01.2022',
SUM(CASE
  WHEN DATE = '01-01-2021' THEN SUMM ELSE 0 END
) AS '01.01.2021',
SUM(CASE
  WHEN DATE = '01-01-2020' THEN SUMM ELSE 0 END
) AS '01.01.2020'
FROM a9pt7elh5dx2d96q.databasefinzvit
WHERE OKPO = '%s'
GROUP BY `ROWS`) as Q right join balance_articles on Q.ROWS = balance_articles.ROW ) AS QQ
order by id", okpo)
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data <- RODBC::sqlQuery(con,ssql)
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)

    data <- DBI::dbGetQuery(pool,ssql)
    #on.exit(dbDisconnect(con))
    
    balance <- data

    
    
    output$balance2 <- renderTable({
      
      balance[is.na(balance)] = ""
      balance <- cbind(balance, Приріст = as.numeric(unlist(balance[input$slide[1]])) - as.numeric(unlist(balance[input$slide[2]])))
      balance$Приріст[is.na(balance$Приріст)] = ""
      balance <- balance %>% relocate(Приріст, .after = "Код рядка")
      
      for (r in 1:nrow(balance)){
        for (c in 5:ncol(balance)){
          
          if(balance[r,c] != ""){
            if(balance[r,c] < 0){
              balance[r,c] <- paste0('<div style="background-color:#FF0800;text-align:right"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              balance[r,c] <- paste0('<div style="text-align:right;"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (r in 1:nrow(balance)){
        for (c in 4:4){
          
          if(balance[r,c] != ""){
            if(balance[r,c] < 0){
              balance[r,c] <- paste0('<div style="color:#FF0800;text-align:right"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              balance[r,c] <- paste0('<div style="color:#3FFF00;text-align:right;"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (iterator in colnames(balance)){
        if (iterator == input$slide[1] || iterator == input$slide[2]){
          names(balance)[names(balance) == iterator] <-  paste0('<div style="color:magenta;"><span>', iterator, '</span></div>')
        }
      }
      
      
      balance

    },bordered = F,striped = F,rownames = F, na = "", hover = T, spacing = c("xs"),  sanitize.text.function = function(x) x)
    
    
    
    
    
    
    
    
#     ssql <- sprintf("SELECT cast(id as int) as id, ARTICLE as 'Назва статті', finrez_articles.ROW as 'Код рядка', 
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2024] IS NULL,0,[01-01-2024]) as '01.01.2024',
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2023] IS NULL,0,[01-01-2023]) as '01.01.2023',
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2022] IS NULL,0,[01-01-2022]) as '01.01.2022', 
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2021] IS NULL,0,[01-01-2021]) as '01.01.2021', 
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2020] IS NULL,0,[01-01-2020]) as '01.01.2020'
# from (SELECT * FROM [DATABASEFINZVIT] where okpo = '%s') as pv
# pivot (max(SUMM) for DATE in ([01-01-2024],[01-01-2023],[01-01-2022],[01-01-2021],[01-01-2020])) as pvt 
# right join finrez_articles on pvt.ROW = finrez_articles.ROW 
# order by id", okpo)
    
    

    ssql <-  sprintf("SELECT QQ.id, QQ.ARTICLE as 'Назва статті', QQ.ROW as 'Код рядка', ifnull(QQ.`01.01.2025`,0) as '01.01.2025', ifnull(QQ.`01.01.2024`,0) as '01.01.2024', ifnull(QQ.`01.01.2023`,0) as '01.01.2023', ifnull(QQ.`01.01.2022`,0) as '01.01.2022', ifnull(QQ.`01.01.2021`,0) as '01.01.2021', ifnull(QQ.`01.01.2020`,0) as '01.01.2020' 
FROM 
( Select * from (SELECT `ROW` AS `ROWS`,
SUM(CASE
  WHEN DATE = '01-01-2025' THEN SUMM ELSE 0 END
) AS '01.01.2025',
SUM(CASE
  WHEN DATE = '01-01-2024' THEN SUMM ELSE 0 END
) AS '01.01.2024',
SUM(CASE
  WHEN DATE = '01-01-2023' THEN SUMM ELSE 0 END
) AS '01.01.2023',
SUM(CASE
  WHEN DATE = '01-01-2022' THEN SUMM ELSE 0 END
) AS '01.01.2022',
SUM(CASE
  WHEN DATE = '01-01-2021' THEN SUMM ELSE 0 END
) AS '01.01.2021',
SUM(CASE
  WHEN DATE = '01-01-2020' THEN SUMM ELSE 0 END
) AS '01.01.2020'
FROM a9pt7elh5dx2d96q.databasefinzvit
WHERE OKPO = '%s'
GROUP BY `ROWS`) as Q right join finrez_articles on Q.ROWS = finrez_articles.ROW ) AS QQ
order by id", okpo)
    
    
    #data <- RODBC::sqlQuery(con,ssql)
    data <- DBI::dbGetQuery(pool,ssql)

    finrez <- data
    
    
    
    
    output$finrez2 <- renderTable({
      
      finrez[is.na(finrez)] = ""
      finrez <- cbind(finrez, Приріст = as.numeric(unlist(finrez[input$slide[1]])) - as.numeric(unlist(finrez[input$slide[2]])))
      finrez$Приріст[is.na(finrez$Приріст)] = ""
      finrez <- finrez %>% relocate(Приріст, .after = "Код рядка")
      
      for (r in 1:nrow(finrez)){
        for (c in 5:ncol(finrez)){
          
          if(finrez[r,c] != ""){
            if(finrez[r,c] < 0){
              finrez[r,c] <- paste0('<div style="background-color:#FF0800;text-align:right"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              finrez[r,c] <- paste0('<div style="text-align:right;"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (r in 1:nrow(finrez)){
        for (c in 4:4){
          
          if(finrez[r,c] != ""){
            if(finrez[r,c] < 0){
              finrez[r,c] <- paste0('<div style="color:#FF0800;text-align:right"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              finrez[r,c] <- paste0('<div style="color:#3FFF00;text-align:right;"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (iterator in colnames(finrez)){
        if (iterator == input$slide[1] || iterator == input$slide[2]){
          names(finrez)[names(finrez) == iterator] <-  paste0('<div style="color:magenta;"><span>', iterator, '</span></div>')
        }
      }
      
      finrez
    },bordered = F,striped = F,rownames = F, na = "", hover = T, spacing = c("xs"),  sanitize.text.function = function(x) x)
    
    
    
    output$downloadData1 <- downloadHandler(
      
      filename = function() {paste0(okpo,"-",client$name, ".xlsx")},
      content = function(file) {
        
        
        wb <- createWorkbook()
        addWorksheet(wb, "Balance")
        writeData(wb, "Balance", balance, rowNames = FALSE)
        setColWidths(wb, "Balance", cols = c(1, 2, 3, 4, 5, 6, 7), widths = c("auto", 70, 10, "auto", "auto", "auto", "auto"))
        addWorksheet(wb, "Finrez")
        writeData(wb, "Finrez", finrez, rowNames = FALSE)
        setColWidths(wb, "Finrez", cols = c(1, 2, 3, 4, 5, 6, 7), widths = c("auto", 70, 10, "auto", "auto", "auto", "auto"))
        # addWorksheet(wb, "CompanyInfo")
        # writeData(wb, "CompanyInfo", companyInfo, rowNames = TRUE)
        # setColWidths(wb, "CompanyInfo", cols = c(1, 2), widths = c("auto", "auto"))
        # addWorksheet(wb, "Founders")
        # writeData(wb, "Founders", founders, rowNames = TRUE)
        # setColWidths(wb, "Founders", cols = c(1, 2), widths = c("auto", "auto"))
        #addWorksheet(wb, "Beneficiaries")
        #writeData(wb, "Beneficiaries", beneficiaries, rowNames = TRUE)
        #setColWidths(wb, "Beneficiaries", cols = c(1, 2), widths = c("auto", "auto"))
        saveWorkbook(wb, file, overwrite = TRUE)
        
        
      }
      
    )
    
    
    # showModal(
    #   modalDialog(
    # 
    #     tabsetPanel(type = "tab", id = "tabsforfinzvit",
    #                 tabPanel("Баланс",       renderTable({
    #                   balance$data
    #                 })),
    #                 tabPanel("Звіт про фінансові результати", renderTable({
    #                   #balance$data
    #                 })),
    #                 #tabPanel("Управлінські звіти", tableOutput("tops_reports")))
    # 
    # 
    # 
    #   )
    # ))
    
    # bsModal("modalExample", title = div("Фінансова звітність", icon("search",class = "fa-beat")), "finzvit", size = "large", textOutput("text"),
    #         #uiOutput("test_ui")
    #         renderTable({
    #           data
    #         })
    #         )
    
    #print(data)
    #on.exit(RODBC::odbcClose(con))
    
    #on.exit(dbDisconnect(con))
    #poolClose(pool)
    
    output$company <- renderText({
      client$name
    })
    
  })
  
  
  
  
  
  
  observeEvent(input$finzvit3,{
    
    print("BS MODAL3!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    
    okpo <- ""
    
    if (nchar(input$finzvit3)<8){
      okpo <- paste0(strrep(0, 8-nchar(input$finzvit3)),input$finzvit3)
    }else{
      okpo <- input$finzvit3
    }
    
    print(okpo)
    print("!!!!!!!!!!!!!!!!!!!!!!")
    
    
    # ssql <- "SELECT [TIN]
    #   ,[FIRM_NAME]
    #   ,[S_CH]
    #   ,[FIRM_RUK]
    #   ,[FIRM_BUH]
    #   ,[FIRM_ADR]
    #   ,[FIRM_TELORG]
    #   ,[FIRM_KVED]
    #   ,[FIRM_KVEDNM]
    #  FROM [dbo].[finzvitdata]
    # where TIN = '"
    
    
    ssql <- "SELECT TIN
      ,FIRM_NAME
      ,S_CH
      ,FIRM_RUK
      ,FIRM_BUH
      ,FIRM_ADR
      ,FIRM_TELORG
      ,FIRM_KVED
      ,FIRM_KVEDNM
     FROM finzvitdata
    where TIN = '"
    
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #dataforcompanyname <- RODBC::sqlQuery(con, paste0(ssql, okpo,"'"))
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    dataforcompanyname <- DBI::dbGetQuery(pool, paste0(ssql, okpo,"'"))
    #on.exit(dbDisconnect(con))

    company$name <- dataforcompanyname$FIRM_NAME
    
    
    # ssql <- sprintf("SELECT cast(id as int) as id, ARTICLE as 'Назва статті', balance_articles.ROW as 'Код рядка', [01-01-2023] as '01.01.2023',[01-01-2022] as '01.01.2022',[01-01-2021] as '01.01.2021',[01-01-2020] as '01.01.2020'
    #          from (SELECT * FROM [crmsystem].[dbo].[DATABASEFINZVIT] where okpo = '%s') as pv
    #          pivot (max(SUMM) for DATE in ([01-01-2023],[01-01-2022],[01-01-2021],[01-01-2020])) as pvt 
    #          right join balance_articles on pvt.ROW = balance_articles.ROW 
    #          order by id", okpo)  
    
    
    
#     ssql <- sprintf("SELECT cast(id as int) as id, ARTICLE as 'Назва статті', balance_articles.ROW as 'Код рядка', 
# iif(balance_articles.ROW IS NOT NULL and [01-01-2024] IS NULL,0,[01-01-2024]) as '01.01.2024',
# iif(balance_articles.ROW IS NOT NULL and [01-01-2023] IS NULL,0,[01-01-2023]) as '01.01.2023',
# iif(balance_articles.ROW IS NOT NULL and [01-01-2022] IS NULL,0,[01-01-2022]) as '01.01.2022', 
# iif(balance_articles.ROW IS NOT NULL and [01-01-2021] IS NULL,0,[01-01-2021]) as '01.01.2021', 
# iif(balance_articles.ROW IS NOT NULL and [01-01-2020] IS NULL,0,[01-01-2020]) as '01.01.2020'
# from (SELECT * FROM [DATABASEFINZVIT] where okpo = '%s') as pv
# pivot (max(SUMM) for DATE in ([01-01-2024],[01-01-2023],[01-01-2022],[01-01-2021],[01-01-2020])) as pvt 
# right join balance_articles on pvt.ROW = balance_articles.ROW 
# order by id", okpo)
#     
    

    
    
    ssql <-  sprintf("SELECT QQ.id, QQ.ARTICLE as 'Назва статті', QQ.ROW as 'Код рядка', ifnull(QQ.`01.01.2025`,0) as '01.01.2025', ifnull(QQ.`01.01.2024`,0) as '01.01.2024', ifnull(QQ.`01.01.2023`,0) as '01.01.2023', ifnull(QQ.`01.01.2022`,0) as '01.01.2022', ifnull(QQ.`01.01.2021`,0) as '01.01.2021', ifnull(QQ.`01.01.2020`,0) as '01.01.2020' 
FROM 
( Select * from (SELECT `ROW` AS `ROWS`,
SUM(CASE
  WHEN DATE = '01-01-2025' THEN SUMM ELSE 0 END
) AS '01.01.2025',
SUM(CASE
  WHEN DATE = '01-01-2024' THEN SUMM ELSE 0 END
) AS '01.01.2024',
SUM(CASE
  WHEN DATE = '01-01-2023' THEN SUMM ELSE 0 END
) AS '01.01.2023',
SUM(CASE
  WHEN DATE = '01-01-2022' THEN SUMM ELSE 0 END
) AS '01.01.2022',
SUM(CASE
  WHEN DATE = '01-01-2021' THEN SUMM ELSE 0 END
) AS '01.01.2021',
SUM(CASE
  WHEN DATE = '01-01-2020' THEN SUMM ELSE 0 END
) AS '01.01.2020'
FROM a9pt7elh5dx2d96q.databasefinzvit
WHERE OKPO = '%s'
GROUP BY `ROWS`) as Q right join balance_articles on Q.ROWS = balance_articles.ROW ) AS QQ
order by id", okpo)
    
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data <- RODBC::sqlQuery(con,ssql)
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    data <- DBI::dbGetQuery(pool, ssql)
    #on.exit(dbDisconnect(con))
    
    
    balance <- data
    
    
    
    output$balance3 <- renderTable({
      
      balance[is.na(balance)] = ""
      balance <- cbind(balance, Приріст = as.numeric(unlist(balance[input$slide3[1]])) - as.numeric(unlist(balance[input$slide3[2]])))
      balance$Приріст[is.na(balance$Приріст)] = ""
      balance <- balance %>% relocate(Приріст, .after = "Код рядка")
      
      
      
      #Для Романцова і Бушуєва форматування рядків звітності 
      # 
      for (r in 1:nrow(balance)){
        for (c in 2:2){
          if(balance[r,3] == 1000 | 
             balance[r,3] == 1005 |
             balance[r,3] == 1010 |
             balance[r,3] == 1015 |
             balance[r,3] == 1020 |
             balance[r,3] == 1030 |
             balance[r,3] == 1035 |
             balance[r,3] == 1040 |
             balance[r,3] == 1045 |
             balance[r,3] == 1050 |
             balance[r,3] == 1060 |
             balance[r,3] == 1065 |
             balance[r,3] == 1090 |
             balance[r,3] == 1100 |
             balance[r,3] == 1101 |
             balance[r,3] == 1102 |
             balance[r,3] == 1103 |
             balance[r,3] == 1104 |
             balance[r,3] == 1110 |
             balance[r,3] == 1115 |
             balance[r,3] == 1120 |
             balance[r,3] == 1125 |
             balance[r,3] == 1130 |
             balance[r,3] == 1135 |
             balance[r,3] == 1140 |
             balance[r,3] == 1145 |
             balance[r,3] == 1155 |
             balance[r,3] == 1160 |
             balance[r,3] == 1165 |
             balance[r,3] == 1170 |
             balance[r,3] == 1180 |
             balance[r,3] == 1190 |
             balance[r,3] == 1400 |
             balance[r,3] == 1401 |
             balance[r,3] == 1405 |
             balance[r,3] == 1410 |
             balance[r,3] == 1411 |
             balance[r,3] == 1412 |
             balance[r,3] == 1415 |
             balance[r,3] == 1420 |
             balance[r,3] == 1425 |
             balance[r,3] == 1430 |
             balance[r,3] == 1435 |
             balance[r,3] == 1500 |
             balance[r,3] == 1505 |
             balance[r,3] == 1510 |
             balance[r,3] == 1515 |
             balance[r,3] == 1520 |
             balance[r,3] == 1521 |
             balance[r,3] == 1525 |
             balance[r,3] == 1526 |
             balance[r,3] == 1530 |
             balance[r,3] == 1535 |
             balance[r,3] == 1540 |
             balance[r,3] == 1545 |
             balance[r,3] == 1600 |
             balance[r,3] == 1605 |
             balance[r,3] == 1610 |
             balance[r,3] == 1635 |
             balance[r,3] == 1640 |
             balance[r,3] == 1645 |
             balance[r,3] == 1650 |
             balance[r,3] == 1660 |
             balance[r,3] == 1665 |
             balance[r,3] == 1670 |
             balance[r,3] == 1690 
             
             ){
            #balance[r,c] <- paste0('<div style="color:yellow;font-size: 15px;font-weight: bold;"><img src="accordbank.svg" height="25" data-toggle="tooltip" data-placement="right" title="статус"><span>', balance[r,c], '</span></div>')
            #balance[r,c] <- paste0('<div style="background-color:yellow;font-size: 15px;font-weight: bold;height: 100%;">', balance[r,c], '</div>')
            balance[r,c] <- paste0('<div style="margin-left: 20px">', balance[r,c], '</div>')
          }
          if(balance[r,3] == 1001 | 
             balance[r,3] == 1002 | 
             balance[r,3] == 1011 | 
             balance[r,3] == 1012 | 
             balance[r,3] == 1016 | 
             balance[r,3] == 1017 | 
             balance[r,3] == 1021 | 
             balance[r,3] == 1022 | 
             balance[r,3] == 1136 | 
             balance[r,3] == 1181 | 
             balance[r,3] == 1182 | 
             balance[r,3] == 1183 | 
             balance[r,3] == 1184 | 
             balance[r,3] == 1531 | 
             balance[r,3] == 1532 | 
             balance[r,3] == 1533 | 
             balance[r,3] == 1534 | 
             balance[r,3] == 1615 | 
             balance[r,3] == 1620 | 
             balance[r,3] == 1621 | 
             balance[r,3] == 1625 | 
             balance[r,3] == 1630 
             
          ){
            #balance[r,c] <- paste0('<div style="color:yellow;font-size: 15px;font-weight: bold;"><img src="accordbank.svg" height="25" data-toggle="tooltip" data-placement="right" title="статус"><span>', balance[r,c], '</span></div>')
            #balance[r,c] <- paste0('<div style="background-color:yellow;font-size: 15px;font-weight: bold;height: 100%;">', balance[r,c], '</div>')
            balance[r,c] <- paste0('<div style="margin-left: 40px">', balance[r,c], '</div>')
          }
        }
      }
      
      
      
      for (r in 1:nrow(balance)){
        for (c in 5:ncol(balance)){
          
          if(balance[r,c] != ""){
            if(balance[r,c] < 0){
              balance[r,c] <- paste0('<div style="background-color:#FF0800;text-align:right"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              balance[r,c] <- paste0('<div style="text-align:right;"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (r in 1:nrow(balance)){
        for (c in 4:4){
          
          if(balance[r,c] != ""){
            if(balance[r,c] < 0){
              balance[r,c] <- paste0('<div style="color:#FF0800;text-align:right"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              balance[r,c] <- paste0('<div style="color:#3FFF00;text-align:right;"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (r in 1:nrow(balance)){
        for (c in 1:1){
              balance[r,c] <- paste0('<div style="text-align:right"><span>', formatC(as.numeric(balance[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            
          }
          
        }
      


      
      for (iterator in colnames(balance)){
        if (iterator == input$slide3[1] || iterator == input$slide3[2]){
          names(balance)[names(balance) == iterator] <-  paste0('<div style="color:magenta;"><span>', iterator, '</span></div>')
        }
      }
      
      
      balance
      
      
    },bordered = F,striped = F,rownames = F, na = "", hover = T, spacing = c("xs"),  sanitize.text.function = function(x) x)
    
    
    
    
    
    
    
    
#     ssql <- sprintf("SELECT cast(id as int) as id, ARTICLE as 'Назва статті', finrez_articles.ROW as 'Код рядка', 
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2024] IS NULL,0,[01-01-2024]) as '01.01.2024',
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2023] IS NULL,0,[01-01-2023]) as '01.01.2023',
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2022] IS NULL,0,[01-01-2022]) as '01.01.2022', 
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2021] IS NULL,0,[01-01-2021]) as '01.01.2021', 
# iif(finrez_articles.ROW IS NOT NULL and [01-01-2020] IS NULL,0,[01-01-2020]) as '01.01.2020'
# from (SELECT * FROM [DATABASEFINZVIT] where okpo = '%s') as pv
# pivot (max(SUMM) for DATE in ([01-01-2024],[01-01-2023],[01-01-2022],[01-01-2021],[01-01-2020])) as pvt 
# right join finrez_articles on pvt.ROW = finrez_articles.ROW 
# order by id", okpo)
    
    
    
    ssql <-  sprintf("SELECT QQ.id, QQ.ARTICLE as 'Назва статті', QQ.ROW as 'Код рядка', ifnull(QQ.`01.01.2025`,0) as '01.01.2025', ifnull(QQ.`01.01.2024`,0) as '01.01.2024', ifnull(QQ.`01.01.2023`,0) as '01.01.2023', ifnull(QQ.`01.01.2022`,0) as '01.01.2022', ifnull(QQ.`01.01.2021`,0) as '01.01.2021', ifnull(QQ.`01.01.2020`,0) as '01.01.2020' 
FROM 
( Select * from (SELECT `ROW` AS `ROWS`,
SUM(CASE
  WHEN DATE = '01-01-2025' THEN SUMM ELSE 0 END
) AS '01.01.2025',
SUM(CASE
  WHEN DATE = '01-01-2024' THEN SUMM ELSE 0 END
) AS '01.01.2024',
SUM(CASE
  WHEN DATE = '01-01-2023' THEN SUMM ELSE 0 END
) AS '01.01.2023',
SUM(CASE
  WHEN DATE = '01-01-2022' THEN SUMM ELSE 0 END
) AS '01.01.2022',
SUM(CASE
  WHEN DATE = '01-01-2021' THEN SUMM ELSE 0 END
) AS '01.01.2021',
SUM(CASE
  WHEN DATE = '01-01-2020' THEN SUMM ELSE 0 END
) AS '01.01.2020'
FROM a9pt7elh5dx2d96q.databasefinzvit
WHERE OKPO = '%s'
GROUP BY `ROWS`) as Q right join finrez_articles on Q.ROWS = finrez_articles.ROW ) AS QQ
order by id", okpo)
    
   # data <- RODBC::sqlQuery(con,ssql)
    
    
    data <- DBI::dbGetQuery(pool, ssql)
    #on.exit(dbDisconnect(con))
    
    finrez <- data
    
    
    
    
    output$finrez3 <- renderTable({
      
      finrez[is.na(finrez)] = ""
      finrez <- cbind(finrez, Приріст = as.numeric(unlist(finrez[input$slide3[1]])) - as.numeric(unlist(finrez[input$slide3[2]])))
      finrez$Приріст[is.na(finrez$Приріст)] = ""
      finrez <- finrez %>% relocate(Приріст, .after = "Код рядка")
      
      for (r in 1:nrow(finrez)){
        for (c in 5:ncol(finrez)){
          
          if(finrez[r,c] != ""){
            if(finrez[r,c] < 0){
              finrez[r,c] <- paste0('<div style="background-color:#FF0800;text-align:right"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              finrez[r,c] <- paste0('<div style="text-align:right;"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (r in 1:nrow(finrez)){
        for (c in 4:4){
          
          if(finrez[r,c] != ""){
            if(finrez[r,c] < 0){
              finrez[r,c] <- paste0('<div style="color:#FF0800;text-align:right"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }else{
              finrez[r,c] <- paste0('<div style="color:#3FFF00;text-align:right;"><span>', formatC(as.numeric(finrez[r,c]), format="f", big.mark=" ", digits=0), '</span></div>')
            }
          }
          
        }
      }
      
      for (iterator in colnames(finrez)){
        if (iterator == input$slide3[1] || iterator == input$slide3[2]){
          names(finrez)[names(finrez) == iterator] <-  paste0('<div style="color:magenta;"><span>', iterator, '</span></div>')
        }
      }
      
      finrez
    },bordered = F,striped = F,rownames = F, na = "", hover = T, spacing = c("xs"),  sanitize.text.function = function(x) x)
    
    
    output$downloadData <- downloadHandler(
      
      filename = function() {paste0(okpo,"-",company$name, ".xlsx")},
      content = function(file) {
        
        
        wb <- createWorkbook()
        addWorksheet(wb, "Balance")
        
        #Для Романцова і Бушуєва форматування рядків звітності 
        #bodyStyle <- createStyle(borderColour = "#4F81BD",fontColour = "red",fontSize = 15,textDecoration = "bold",bgFill = "yellow")
        #addStyle(wb, sheet = 1, bodyStyle, rows = 7:7, cols = 1:3, gridExpand = TRUE)
        
        writeData(wb, "Balance", balance, rowNames = FALSE)
        setColWidths(wb, "Balance", cols = c(1, 2, 3, 4, 5, 6, 7), widths = c("auto", 70, 10, "auto", "auto", "auto", "auto"))
        addWorksheet(wb, "Finrez")
        writeData(wb, "Finrez", finrez, rowNames = FALSE)
        setColWidths(wb, "Finrez", cols = c(1, 2, 3, 4, 5, 6, 7), widths = c("auto", 70, 10, "auto", "auto", "auto", "auto"))
        # addWorksheet(wb, "CompanyInfo")
        # writeData(wb, "CompanyInfo", companyInfo, rowNames = TRUE)
        # setColWidths(wb, "CompanyInfo", cols = c(1, 2), widths = c("auto", "auto"))
        # addWorksheet(wb, "Founders")
        # writeData(wb, "Founders", founders, rowNames = TRUE)
        # setColWidths(wb, "Founders", cols = c(1, 2), widths = c("auto", "auto"))
        #addWorksheet(wb, "Beneficiaries")
        #writeData(wb, "Beneficiaries", beneficiaries, rowNames = TRUE)
        #setColWidths(wb, "Beneficiaries", cols = c(1, 2), widths = c("auto", "auto"))
        saveWorkbook(wb, file, overwrite = TRUE)
        
        
      }
      
    )
    
    
    # showModal(
    #   modalDialog(
    # 
    #     tabsetPanel(type = "tab", id = "tabsforfinzvit",
    #                 tabPanel("Баланс",       renderTable({
    #                   balance$data
    #                 })),
    #                 tabPanel("Звіт про фінансові результати", renderTable({
    #                   #balance$data
    #                 })),
    #                 #tabPanel("Управлінські звіти", tableOutput("tops_reports")))
    # 
    # 
    # 
    #   )
    # ))
    
    # bsModal("modalExample", title = div("Фінансова звітність", icon("search",class = "fa-beat")), "finzvit", size = "large", textOutput("text"),
    #         #uiOutput("test_ui")
    #         renderTable({
    #           data
    #         })
    #         )
    
    #print(data)
    #on.exit(RODBC::odbcClose(con))
    
    #on.exit(dbDisconnect(con))
    #poolClose(pool)
    
    output$company3 <- renderText({
      company$name
    })
    
  })
  
  
  data_status_results <- reactive({
    
    
    
    # ssql <- "select login, cast([продана послуга] as float)/(cast([не був оброблений] as float) + cast([запланована зустріч] as float) + cast([запланований повторний дзвінок] as float) + cast([відмова] as float))*10 as rating, [продана послуга],[запланована зустріч],[запланований повторний дзвінок],[відмова],[не був оброблений] from 
    #           (SELECT top 1000 [login], [status], [status] as count_status
    #            FROM [dbo].[database]
    #            ) as Q
    #            PIVOT (count(count_status) FOR [status] IN ([продана послуга],[запланована зустріч],[запланований повторний дзвінок],[відмова],[не був оброблений])) AS QQ order by 1" #where login = 'olanhaieva'"
    
    
    ssql <- "select login, 
cast(`продана послуга` as DECIMAL(24,0))/(cast(`не був оброблений` as DECIMAL(24,0)) + cast(`запланована зустріч` as DECIMAL(24,0)) + cast(`запланований повторний дзвінок` as DECIMAL(24,0)) + cast(`відмова` as DECIMAL(24,0)))*10 as rating,
`продана послуга`,`запланована зустріч`,`запланований повторний дзвінок`,`відмова`,`не був оброблений`
 from (

SELECT login,

SUM(status = 'продана послуга') AS 'продана послуга',
SUM(status = 'запланована зустріч') AS 'запланована зустріч',
SUM(status = 'запланований повторний дзвінок') AS 'запланований повторний дзвінок',
SUM(status = 'відмова') AS 'відмова',
SUM(status = 'не був оброблений') AS 'не був оброблений'
FROM  (SELECT login, status, status as count_status
               FROM `database`
               LIMIT 1000
               ) as Q
GROUP BY login ) AS QQ"
    
    
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data_status_results <- RODBC::sqlQuery(con, ssql)
    
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    data_status_results <- DBI::dbGetQuery(pool, ssql)
    #on.exit(DBI::dbDisconnect(con))
    #poolClose(pool)
    #on.exit(RODBC::odbcClose(con))
    
    
    data_status_results <- cbind(
      #tibble(" " = buttons),
      tibble("accordbank" = ""),
      data_status_results
    )
    

    
    data_status_results <- cbind(
      #tibble(" " = buttons),
      tibble("chat" = ""),
      data_status_results
    )
    
    data_status_results <- cbind(
      #tibble(" " = buttons),
      tibble("phone" = ""),
      data_status_results
    )
    
    
    data_status_results <- cbind(
      #tibble(" " = buttons),
      tibble("cancel" = ""),
      data_status_results
    )
    
    data_status_results <- cbind(
      #tibble(" " = buttons),
      tibble("question" = ""),
      data_status_results
    )
    
    data_status_results <- data_status_results %>% relocate(accordbank, .before = "продана послуга")
    data_status_results <- data_status_results %>% relocate(chat, .before = "запланована зустріч")
    data_status_results <- data_status_results %>% relocate(phone, .before = "запланований повторний дзвінок")
    data_status_results <- data_status_results %>% relocate(cancel, .before = "відмова")
    data_status_results <- data_status_results %>% relocate(question, .before = "не був оброблений")
    #input$save
    #input$edit
    
    return(data_status_results)
  })
  
  
  
  
  data_status_results_hits <- reactive({
    
    # ssql <- "SELECT login, count(status) as count_status,  FORMAT ([entrydate], 'd', 'hy-AM') as [entrydate], Convert(date,  [entrydate])  as sort
    #             FROM [dbo].[hits]
    #             group by login, FORMAT ([entrydate], 'd', 'hy-AM'),   Convert(date,  [entrydate])  
    #             order by 1, 4"
    
    
    ssql <-  "SELECT login, count(status) as count_status,  
            date_format(entrydate, '%d.%m.%Y') as entrydate, cast(entrydate as date) as sort
                FROM hits
                group by login,  date_format(entrydate, '%d.%m.%Y'),   cast(entrydate as date)   
                order by 1, 4"
    
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data_status_results_hits <- RODBC::sqlQuery(con, ssql)
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    data_status_results_hits <- DBI::dbGetQuery(pool, ssql)
    #on.exit(DBI::dbDisconnect(con))
    #poolClose(pool)
    
    #on.exit(RODBC::odbcClose(con))
    
  
    return(data_status_results_hits)
  })
  
  # log <- reactiveValues(login = "")
  # 
  # output$plot <- renderHighchart({
  #   
  #   print(log$login)
  # 
  #   # sales <- filter(data_status_results_hits(), login == data_status_results()$login) %>% select(-login)
  #   # sales$entrydate<-as.Date(sales$entrydate)
  #   # sales$count_status <-as.numeric(sales$count_status)
  #   
  # 
  #   sales <- filter(data_status_results_hits(), login == log$login) %>% select(-login)
  #   sales$entrydate<-as.Date(sales$entrydate)
  #   sales$count_status <-as.numeric(sales$count_status)
  # 
  #   
  #   hchart(sales, type="area", hcaes(x = entrydate, y = count_status)) %>%
  #     hc_title(text = "") %>%
  #     hc_yAxis(title = list(text = "Hits", style = list(color = "white", fontFamily = "Roboto Slab")),
  #              labels = list(style = list(color = "white", fontFamily = "Roboto Slab"))
  #     ) %>%
  #     hc_xAxis(title = list(text = ""),
  #              labels = list(style = list(color = "white", fontFamily = "Roboto Slab"))
  #     )  %>%
  #     hc_colors(colors = "#F56B38") %>%
  #     hc_size(height = 250) %>%
  #     hc_tooltip(pointFormat = "{point.tooltip}")
  # 
  # })
  
  
  observeEvent(input$plot, {


          output$plot1 <- renderHighchart({
            
            
            sales <- filter(data_status_results_hits(), login == data_status_results()[input$plot,"login"])[c("count_status","entrydate")]
            
            if (nrow(sales) > 0){
            sales$entrydate<-sales$entrydate
            sales$count_status <-as.numeric(sales$count_status)
            }else{
              count_status <- c(0)
              entrydate <- c(format(Sys.Date(), "%d.%m.%Y"))
              sales <- data.frame(count_status, entrydate)
            }
            
        
            hchart(sales, type="area", hcaes(x = entrydate, y = count_status)) %>%
            hc_title(text = "") %>%
            hc_yAxis(title = list(text = "к-ть контактів в день", style = list(color = "white", fontFamily = "system-ui")),
                     labels = list(style = list(color = "white", fontFamily = "system-ui"))
            ) %>%
            hc_xAxis(title = list(text = ""),
                     labels = list(style = list(color = "white", fontFamily = "system-ui"))
            )  %>%
            hc_colors(colors = "#F56B38") %>%
            hc_size(height = 250) %>%
            hc_tooltip(pointFormat = "{point.tooltip}")
            
        })

    showModal(modalDialog(size = "l",  footer = NULL, easyClose = TRUE,
      title = paste("Щоденна активність - ", data_status_results()[input$plot,"login"]),
      #style = "font-size:12px",
      highchartOutput("plot1",width = '100%', height = 250),
      
      # dateRangeInput("daterange1", "Date range:",
      #                start = "2001-01-01",
      #                end   = "2010-12-31",language = "uk"),
      
      removeModal()
    )
    )
    
  })

  
  output$status_results <- renderReactable({
    
    bar_chart <- function(label, width = "100%", height = "1rem", fill = "#00bfc4", background = NULL) {
      bar <- div(style = list(background = fill, width = width, height = height))
      chart <- div(style = list(flexGrow = 1, marginLeft = "0.5rem", background = background), bar)
      div(style = list(display = "flex", alignItems = "center"), label, chart)
    }
    
    
    # rating_stars <- function(rating, max_rating = 10) {
    #   rounded_rating <- floor(rating + 0.5)  # always round up
    #   stars <- lapply(seq_len(max_rating), function(i) {
    #     if (i <= rounded_rating) fontawesome::fa("fas fa-star", fill= "yellow") else fontawesome::fa("star", fill= "grey")
    #   })
    #   label <- sprintf("%s out of %s", rating, max_rating)
    #   div_out <- div(title = label, "aria-label" = label, role = "img", stars)
    # 
    #    as.character(div_out) %>%
    #      gt::html()
    # }
    
    # rating_stars <- function(rating, max_rating = 10) {
    #   rounded_rating <- floor(rating + 0.5)  # always round up
    #   stars <- lapply(seq_len(max_rating), function(i) {
    #     if (i <= rounded_rating) fontawesome::fa("fas fa-star", fill= "yellow") else fontawesome::fa("star", fill= "grey")
    #   })
    #   label <- sprintf("%s out of %s", rating, max_rating)
    #   div_out <- div(title = label, "aria-label" = label, role = "img", stars)
    #   
    #   as.character(div_out) %>% 
    #     gt::html()
    # }
  
    star_rating <- function(rating, max_rating = 10){
      
      star_icon <- function(status) {
        
        if (status == "Half") {
          tagAppendAttributes(shiny::icon("star-half-alt"),
                              style = paste("color: #FFEA00"),
                              "aria-hidden" = "true")
        }else if (status == "Full") {
          tagAppendAttributes(shiny::icon("fas fa-star"),
                              style = paste("color: #FFEA00"),
                              "aria-hidden" = "true")
        }else {
          tagAppendAttributes(shiny::icon("star"),
                              style = paste("color:", if (status == "Empty") "grey" else "#FFEA00"),
                              "aria-hidden" = "true"
          )
        }
        
      }
      
      rounded_rating <- floor(rating)
      last_rating <- rating - rounded_rating
      last_rating <- case_when(last_rating < .25 ~ "Empty",
                               last_rating > .75 ~ "Full",
                               TRUE ~ "Half"
      )
      
      stars <- lapply(seq_len(max_rating), function(i) {
        if (i <= rounded_rating) { star_icon(status = "Full")} 
        else {
          if (i == (rounded_rating+1)) star_icon(status = last_rating)
          else {
            star_icon(status = "Empty")
          }
        }
        
      })
      
      label <- sprintf("%s із %s", rating, max_rating)
      div(title = label, "aria-label" = label, role = "img", stars)
      
    }
    
    reactable(
      
      data_status_results(),
      
      onClick = JS("
      function(rowInfo, colInfo) {
        //if (rowInfo.index === 0) {
          if (window.Shiny) {
            Shiny.setInputValue('plot', rowInfo.index + 1, { priority: 'event' })
          }
        //}
      }
    "),
      
      # details = function(index) {
      #   sales <- filter(data_status_results_hits(), login == data_status_results()$login[index]) %>% select(-login)
      #   tbl <- reactable(sales, outlined = TRUE, highlight = TRUE, fullWidth = FALSE)
      #   htmltools::div(style = list(margin = "12px 45px"), tbl)
      # },

      # details = function(index) {
      # 
      #   #tbl <- reactable(sales, outlined = TRUE, highlight = TRUE, fullWidth = FALSE)
      # 
      #    # print(name)
      #     # output$plot <- renderPlot({
      #     #   hist(rnorm(500))
      #     # })
      # 
      # 
      #     # output$plot <- renderHighchart({
      #     #
      # 
      #   print(data_status_results()[index,"login"])
      #   sales <- filter(data_status_results_hits(), login == data_status_results()[index,"login"])[c("count_status","entrydate")]
      #   sales$entrydate<-sales$entrydate
      #   sales$count_status <-as.numeric(sales$count_status)
      #   
      #   
      #   output$plot1 <- renderHighchart({
      #     
      #     hchart(sales, type="area", hcaes(x = entrydate, y = count_status)) %>%
      #       hc_title(text = "") %>%
      #       hc_yAxis(title = list(text = "к-ть контактів з клієнтом", style = list(color = "white", fontFamily = "system-ui")),
      #                labels = list(style = list(color = "white", fontFamily = "system-ui"))
      #       ) %>%
      #       hc_xAxis(title = list(text = ""),
      #                labels = list(style = list(color = "white", fontFamily = "system-ui"))
      #       )  %>%
      #       hc_colors(colors = "#F56B38") %>%
      #       hc_size(height = 250) %>%
      #       hc_tooltip(pointFormat = "{point.tooltip}")
      #     
      #   })
      #   highchartOutput("plot1",width = '100%', height = 250)
      # },
    
      #onClick = "expand",
      rowStyle = list(cursor = "pointer"),
      
      style = list(fontSize = '9px'),
      searchable = TRUE,
      highlight = TRUE,
      borderless = FALSE,
      striped = FALSE,
      compact = TRUE,
      wrap = FALSE,
      resizable = TRUE,
      showSortable = TRUE,
      #height = 610,
      showPageSizeOptions = TRUE,
      pageSizeOptions = c(10, 25, 50, 100),
      defaultPageSize = 100,
      
      defaultColDef = colDef(
        vAlign = "center",
        headerVAlign = "bottom",
        style = list(fontWeight = "bold", fontSize = "10px",
                     fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
        footerStyle = list(fontWeight = "bold", fontSize = "15px", color = '#FFEA00',
                           fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif")
      ),
      
      columns = list(
        
        login = colDef(name = "логін", footer = "Всього", maxWidth = 150, sticky = "left"),
        
        rating = colDef(name = "рейтинг",
                        maxWidth = 250,
                        sortable = TRUE,
                        html = TRUE,
                        cell = function(value){
                          star_rating(round(value, digits = 1))
                        }, 
                        align = "left",
                        style = list(fontWeight = "bold", fontSize = "15px",
                                     fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
                        ),
        
        
        
        question = colDef(
          name = "",
          maxWidth = 40,
          sortable = FALSE,
          html = TRUE,
        
            cell = function(value,rowIndex) {
            image <- img(src = "question.png",style = "height: 25px;", alt = "")

            tagList(
              div(style = "display: inline-block; width: 45px;", image)
            )
           }
        ),
        
        'не був оброблений' = colDef(
          
          maxWidth = 180,
          sortable = TRUE,
          html = TRUE,
          footer = sprintf("%.f", sum(data_status_results()$"не був оброблений")),
          
          align = "left", cell = function(value) {
            width <- paste0(value / sum(data_status_results()$"не був оброблений") * 100, "%")
            bar_chart(value, width = width, fill = "orange")
          }
          
        ),
        
        chat = colDef(
          name = "",
          maxWidth = 40,
          sortable = FALSE,
          html = TRUE,
          
          cell = function(value,rowIndex) {
            image <- img(src = "chat.png",style = "height: 25px;", alt = "")
            
            tagList(
              div(style = "display: inline-block; width: 45px;", image)
            )
          }
        ),
        
        'запланована зустріч' = colDef(
          
          maxWidth = 180,
          sortable = TRUE,
          html = TRUE,
          footer = sprintf("%.f", sum(data_status_results()$"запланована зустріч")),
          
          align = "left", cell = function(value) {
            width <- paste0(value / sum(data_status_results()$"запланована зустріч") * 100, "%")
            bar_chart(value, width = width, fill = "cyan")
          }
          
        ),
        
        phone = colDef(
          name = "",
          maxWidth = 40,
          sortable = FALSE,
          html = TRUE,
          
          cell = function(value,rowIndex) {
            image <- img(src = "phone.png",style = "height: 25px;", alt = "")
            
            tagList(
              div(style = "display: inline-block; width: 45px;", image)
            )
          }
        ),
        
        'запланований повторний дзвінок' = colDef(
          
          maxWidth = 180,
          sortable = TRUE,
          html = TRUE,
          footer = sprintf("%.f", sum(data_status_results()$"запланований повторний дзвінок")),
          
          align = "left", cell = function(value) {
            width <- paste0(value / sum(data_status_results()$"запланований повторний дзвінок") * 100, "%")
            bar_chart(value, width = width, fill = "lightgreen")
          }
          
        ),
        
        accordbank = colDef(
          name = "",
          maxWidth = 40,
          sortable = FALSE,
          html = TRUE,
          
          cell = function(value,rowIndex) {
            image <- img(src = "accordbank.svg",style = "height: 25px;", alt = "")
            
            tagList(
              div(style = "display: inline-block; width: 45px;", image)
            )
          }
        ),
        
        'продана послуга' = colDef(
          
          maxWidth = 180,
          sortable = TRUE,
          html = TRUE,
          footer = sprintf("%.f", sum(data_status_results()$"продана послуга")),
          
          align = "left", cell = function(value) {
            width <- paste0(value / sum(data_status_results()$"продана послуга") * 100, "%")
            bar_chart(value, width = width, fill = "magenta")
          }
          
        ),
        
        cancel = colDef(
          name = "",
          maxWidth = 40,
          sortable = FALSE,
          html = TRUE,
          
          cell = function(value,rowIndex) {
            image <- img(src = "cancel.png",style = "height: 25px;", alt = "")
            
            tagList(
              div(style = "display: inline-block; width: 45px;", image)
            )
          }
        ),
        
        'відмова' = colDef(
          
          maxWidth = 180,
          sortable = TRUE,
          html = TRUE,
          footer = sprintf("%.f", sum(data_status_results()$"відмова")),
          
          align = "left", cell = function(value) {
            width <- paste0(value / sum(data_status_results()$"відмова") * 100, "%")
            bar_chart(value, width = width, fill = "red")
          }
          
        )
        
        
      #   
      #   finzvit = colDef(
      #     name = "",
      #     sortable = FALSE,
      #     maxWidth = 75,
      #     html = TRUE
      #   ),
      #   
      #   
      #   
      #   cl = colDef(name = "назва клієнта", minWidth = 200),
      #   status = colDef(name = "статус", minWidth = 130,
      #                   
      #                   
      #                   cell = function(value) {
      #                     color <- switch(
      #                       value,
      #                       'запланований повторний дзвінок' = "lightgreen",
      #                       'запланована зустріч' = "cyan",
      #                       'відмова' = "red",
      #                       'продана послуга' = "magenta",
      #                       'не був оброблений' = "orange"
      #                     )
      #                     badge <- status_badge(color = color)
      #                     tagList(badge, value)
      #                   }
      #                   
      #                   
      #   ),  
      #   last_client_result = colDef(name = "останній результат по клієнту", minWidth = 120, na = "–", ),  
      #   emp = colDef(name = "к-ть прац",maxWidth = 70, format = colFormat(separators = TRUE, digits = 0)),  
      #   pr = colDef(name = "єдрпоу", maxWidth = 60),  
      #   forex_per_year_usd = colDef(name = "форекс за рік, дол", minWidth = 100,
      #                               format = colFormat(prefix = "$", separators = TRUE, digits = 0)
      #   ),
      #   loan_value_uah = colDef(name = "кредити, грн", maxWidth = 80,
      #                           format = colFormat(separators = TRUE, digits = 0),
      #   ),  
      #   passive_value_uah = colDef(name = "пасиви, грн", maxWidth = 80,
      #                              format = colFormat(separators = TRUE, digits = 0)),  
      #   revenue_uah = colDef(name = "виручка, грн", maxWidth = 80,
      #                        format = colFormat(separators = TRUE, digits = 0)),  
      #   tender_num = colDef(name = "к-ть тендерів", maxWidth = 80, 
      #                       format = colFormat(separators = TRUE, digits = 0)),  
      #   tender_sum = colDef(name = "сума тендерів", maxWidth = 90,
      #                       format = colFormat(separators = TRUE, digits = 0)), 
      #   sek = colDef(name = "сектор", maxWidth = 50),  
      #   person_details = colDef(name = "керівник", minWidth = 200),  
      #   phone = colDef(name = "телефон", minWidth = 100),  
      #   login = colDef(name = "логін", minWidth = 60), 
      #   full_address = colDef(name = "повна адреса", minWidth = 200),  
      #   kobl = colDef(name = "код обл", maxWidth = 60),  
      #   kved = colDef(name = "квед", maxWidth = 50),  
      #   kved_name = colDef(name = "назва квед", minWidth = 200), 
      #   
      #   
      #   
      #   icon = colDef(
      #     name = "",
      #     maxWidth = 40,
      #     sortable = FALSE,
      #     html = TRUE
      #     
      #   ),
      # 
       ),

      
      #2b3e50
      theme = reactableTheme(
        color = "hsl(233, 9%, 87%)",
        backgroundColor = "#2b3e50",
        borderColor = "#2b3e50",
        stripedColor = "hsl(233, 12%, 22%)",
        highlightColor = "hsl(233, 12%, 24%)",
        inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
        selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
        pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
        pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
        style = list(
          fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"
        ),
        searchInputStyle = list(width = "100%",backgroundColor = "#2b3e50")
      ),
      
      language = reactableLang(
        searchPlaceholder = "Пошук...",
        noData = "Даних не знайдено",
        pageInfo = "{rowStart} до {rowEnd} з {rows} записів",
        pageSizeOptions = "Показати {rows}",
        pagePrevious = "Попередня",
        pageNext = "Наступна",
        pagePreviousLabel = "Попередня",
        pageNextLabel = "Наступна"
      )

      
    )

  })
  
  data_income_results <- reactive({
    
  #   ssql <- "SELECT '<img src=''accordbank.svg'' height=''20'' data-toggle=''tooltip'' data-placement=''right'' title=''Акордбанк''>' as icon, [client]
  #     ,[group]
  #     ,[EDRPO]
  #     ,[cust]
  #     ,[cust open date]
  #     ,[branch]
  #     ,[segment]
  #     ,[client type]
  #     ,[RM]
  #     ,[ManageLogin]
  #     ,isnull([▲% марж дох на акт],0) as [▲% марж дох на акт]
  #     ,isnull([▲% марж дох на пас],0) as [▲% марж дох на пас]
  #     ,isnull([▲коміс дохід],0) as [▲коміс дохід]
  #     ,isnull([▲в тч коміс по док інстр],0) as [▲в тч коміс по док інстр]
  #     ,isnull([▲в тч кред коміс],0) as [▲в тч кред коміс]
  #     ,isnull([▲коміс від куп-прод вал],0) as [▲коміс від куп-прод вал]
  #     ,isnull([▲інші коміс (РКО, інші…)],0) as [▲інші коміс (РКО, інші…)]
  #     ,isnull([▲заг дохід],0) as [▲заг дохід]
  #     ,isnull([▲дохід казнач],0) as [▲дохід казнач]
  #     ,isnull([▲середден розмір актив],0) as [▲середден розмір актив]
  #     ,isnull([▲середден розмір пасив],0) as [▲середден розмір пасив]
  #     ,isnull([▲заг дох акт (ROA)],0) as [▲заг дох акт (ROA)]
  # FROM [dbo].[comissdata]"

    ssql <-  "SELECT '<img src=''accordbank.svg'' height=''20'' data-toggle=''tooltip'' data-placement=''right'' title=''Акордбанк''>' as icon, 
client, `group`
      ,EDRPO
      ,cust
      ,`cust open date`
      ,branch
      ,segment
      ,`client type`
      ,`RM`
      ,`ManageLogin`
      ,IFNULL(`▲% марж дох на акт`,0)  as `▲% марж дох на акт`
      ,IFNULL(`▲% марж дох на пас`,0) as `▲% марж дох на пас`
      ,IFNULL(`▲коміс дохід`,0) as `▲коміс дохід`
      ,IFNULL(`▲в тч коміс по док інстр`,0) as `▲в тч коміс по док інстр`
      ,IFNULL(`▲в тч кред коміс`,0) as `▲в тч кред коміс`
      ,IFNULL(`▲коміс від куп-прод вал`,0) as `▲коміс від куп-прод вал`
      ,IFNULL(`▲інші коміс (РКО, інші…)`,0) as `▲інші коміс (РКО, інші…)`
      ,IFNULL(`▲заг дохід`,0) as `▲заг дохід`
      ,IFNULL(`▲дохід казнач`,0) as `▲дохід казнач`
      ,IFNULL(`▲середден розмір актив`,0) as `▲середден розмір актив`
      ,IFNULL(`▲середден розмір пасив`,0) as `▲середден розмір пасив`
      ,IFNULL(`▲заг дох акт (ROA)`,0) as `▲заг дох акт (ROA)`
  FROM a9pt7elh5dx2d96q.comissdata"
    
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
    #con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
    #data_income_results <- RODBC::sqlQuery(con, ssql)
    #on.exit(RODBC::odbcClose(con))
    
    # con <- DBI::dbConnect(RMySQL::MySQL(), dbname = databaseName, host = options()$mysql$host,
    #                  port = options()$mysql$port, user = options()$mysql$user,
    #                  password = options()$mysql$password)
    
    data_income_results <- DBI::dbGetQuery(pool, ssql)
    #on.exit(DBI::dbDisconnect(con))
    #poolClose(pool)
    
    return(data_income_results)
  })
  
#   data_income_results_details <- reactive({
#     
#     ssql <- "select * from (SELECT [client],[EDRPO],[cust], dates, feature_ukr, sort, round(SUMM,1) as SM
#   FROM
#  (SELECT [client]
#       ,[EDRPO]
#       ,[cust]
#       ,[interest margin assets]
#       ,[thereof loans1]
#       ,[thereof overdrafts1]
#       ,[interest margin liabilities]
#       ,[thereof cash on ca]
#       ,[thereof term deposits1]
#       ,[Commision income]
#       ,[thereof doc Instruments]
#       ,[thereof loan commisions]
#       ,[thereof FX commision]
#       ,[thereof other commisions]
#       ,[agents expenses]
#       ,[total income]
#       ,[treasury income]
#       ,[Av Assets]
#       ,[thereof loans2]
#       ,[thereof overdrafts2]
#       ,[Av Exposure on Doc instruments]
#       ,[thereof bid, performance, touristic bonds]
#       ,[thereof other Doc instruments]
#       ,[Av Liabilities]
#       ,[thereof cash on c_a]
#       ,[thereof term deposits2]
#       ,[thereof FCY]
#       ,[thereof UAH]
#       ,[ROA]
#       ,[ROA non-lending]
#       ,[ROA (incl doc instr)]
#       ,[ROA (incl doc instr) non-lending]
#       ,[dates]
#  FROM [dbo].[DATABASEcomision] inner join (SELECT [ManageReportName] FROM [dbo].[HB_MANAGERS]) AS Q on [ManageReportName] = RM) p
#  UNPIVOT (SUMM FOR feature IN ([interest margin assets]
#       ,[thereof loans1]
#       ,[thereof overdrafts1]
#       ,[interest margin liabilities]
#       ,[thereof cash on ca]
#       ,[thereof term deposits1]
#       ,[Commision income]
#       ,[thereof doc Instruments]
#       ,[thereof loan commisions]
#       ,[thereof FX commision]
#       ,[thereof other commisions]
#       ,[agents expenses]
#       ,[total income]
#       ,[treasury income]
#       ,[Av Assets]
#       ,[thereof loans2]
#       ,[thereof overdrafts2]
#       ,[Av Exposure on Doc instruments]
#       ,[thereof bid, performance, touristic bonds]
#       ,[thereof other Doc instruments]
#       ,[Av Liabilities]
#       ,[thereof cash on c_a]
#       ,[thereof term deposits2]
#       ,[thereof FCY]
#       ,[thereof UAH]
#       ,[ROA]
#       ,[ROA non-lending]
#       ,[ROA (incl doc instr)]
#       ,[ROA (incl doc instr) non-lending])
#  )AS unpvt inner join HB_SORT on unpvt.feature = HB_SORT.feature) as pv
#    
#    
# 
# pivot (sum(SM) for dates in ([202108],[202107],[202106],[202105],[202104],[202103],[202102],[202101])) as pvt 
# order by sort
# "
#     
#     #con <- RODBC::odbcDriverConnect('driver={SQL Server};server=localhost\\SQLEXPRESS;database=crmsystem;trusted_connection=true')
#     con <- RODBC::odbcDriverConnect('driver={SQL Server};Server=tcp:ne-az-sql-serv1.database.windows.net;database=daqk9mfw8cyjjxu;uid=upe7l0su0vij18r;pwd=wQxX6Z85n0DJx*Y#i5QFYS4lD;')
#     data_income_results_details <- RODBC::sqlQuery(con, ssql)
#     on.exit(RODBC::odbcClose(con))
#     
#     
#     return(data_income_results_details)
#   })
  
  output$income_results <- renderReactable({

    
    reactable(

      data = data_income_results(),

      # details = function(index) {
      #   
      #   sales <- filter(data_income_results_details(), EDRPO == data_income_results()$EDRPO[index],
      #                                                  cust == data_income_results()$cust[index]) %>% select(-EDRPO, cust)
      #   tbl <- reactable(sales, outlined = TRUE, highlight = TRUE, fullWidth = FALSE)
      #    htmltools::div(style = list(margin = "12px 45px"), tbl)
      # },
      
      style = list(fontSize = '9px'),
      searchable = TRUE,
      highlight = TRUE,
      borderless = FALSE,
      striped = FALSE,
      compact = TRUE,
      wrap = FALSE,
      resizable = TRUE,
      showSortable = TRUE,
      #height = 610,
      showPageSizeOptions = TRUE,
      pageSizeOptions = c(10, 25, 50, 100),
      defaultPageSize = 100,
      
      
      defaultColDef = colDef(
        vAlign = "center",
        headerVAlign = "bottom",
        style = list(fontSize = "9px",
                     fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
        # footerStyle = list(fontWeight = "bold", fontSize = "15px",
        #                    fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif")
        
      ),
      
       columns = list(
         icon = colDef(name = "", maxWidth = 40, html = TRUE, sortable = FALSE, sticky = "left"),
         client = colDef(name = "клієнт", minWidth = 250, sticky = "left"),
         group = colDef(name = "група", minWidth = 80, na = "-", sticky = "left"),
         EDRPO = colDef(name = "єдрпо", maxWidth = 70, na = "-",align = "left", sticky = "left"),
         cust = colDef(name = "код", maxWidth = 60, na = "-",align = "left"),
         'cust open date' = colDef(name = "дата відкриття", maxWidth = 90, na = "-",align = "center"),
         branch = colDef(name = "відділення", maxWidth = 70, na = "-",align = "center"),
         segment = colDef(name = "сегмент", maxWidth = 70, na = "-",align = "center"),
         "client type" = colDef(name = "тип клієнта", minWidth = 140, na = "-",align = "left"),
         "RM" = colDef(name = "менеджер", minWidth = 150, na = "-",align = "left"),
         "ManageLogin" = colDef(name = "логін", maxWidth = 70, na = "-",align = "left"),
         "▲% марж дох на акт" = colDef(minWidth = 80,align = "right",html = TRUE,
                                       format = colFormat(separators = TRUE, digits = 0)
                                       
                                       # style = function(value) {
                                       #   color <- if (value > 0) {
                                       #     "#7CFC00"
                                       #   } else if (value < 0) {
                                       #     "red"
                                       #   }
                                       #   list(fontWeight = 600, color = color)
                                       # }
                                       
                                       ),
         "▲% марж дох на пас" = colDef(minWidth = 80,align = "right",html = TRUE,
                                       format = colFormat(separators = TRUE, digits = 0)
                                       
                                       
                                       # style = function(value) {
                                       #   color <- if (value > 0) {
                                       #     "#7CFC00"
                                       #   } else if (value < 0) {
                                       #     "red"
                                       #   }
                                       #   list(fontWeight = 600, color = color)
                                       # }
                                       
         ),
         "▲коміс дохід" = colDef(minWidth = 80,align = "right",html = TRUE,
                                       format = colFormat(separators = TRUE, digits = 0)
                                 
                                 # style = function(value) {
                                 #   color <- if (value > 0) {
                                 #     "#7CFC00"
                                 #   } else if (value < 0) {
                                 #     "red"
                                 #   }
                                 #   list(fontWeight = 600, color = color)
                                 # }
         ),
         "▲в тч коміс по док інстр" = colDef(minWidth = 80,align = "right",html = TRUE,
                                 format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲в тч кред коміс" = colDef(minWidth = 80,align = "right",html = TRUE,
                                             format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲коміс від куп-прод вал" = colDef(minWidth = 80,align = "right",html = TRUE,
                                     format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲інші коміс (РКО, інші…)" = colDef(minWidth = 80,align = "right",html = TRUE,
                                            format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲заг дохід" = colDef(minWidth = 80,align = "right",html = TRUE,
                                            format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲дохід казнач" = colDef(minWidth = 80,align = "right",html = TRUE,
                                            format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲середден розмір актив" = colDef(minWidth = 80,align = "right",html = TRUE,
                                            format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲середден розмір пасив" = colDef(minWidth = 80,align = "right",html = TRUE,
                                            format = colFormat(separators = TRUE, digits = 0)
         ),
         "▲заг дох акт (ROA)" = colDef(minWidth = 80,align = "right",html = TRUE,
                                            format = colFormat(separators = TRUE, digits = 0)
         )
         
      
      ),
      
      
      #2b3e50
      theme = reactableTheme(
        color = "hsl(233, 9%, 87%)",
        backgroundColor = "#2b3e50",
        borderColor = "#2b3e50",
        stripedColor = "hsl(233, 12%, 22%)",
        highlightColor = "hsl(233, 12%, 24%)",
        inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
        selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
        pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
        pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)"),
        style = list(
          fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"
        ),
        # cellStyle = list(
        #   ".rt-tr-highlight:hover &" = list(backgroundColor = "grey !important")
        # ),
        searchInputStyle = list(width = "100%",backgroundColor = "#2b3e50")
      ),
      
      language = reactableLang(
        searchPlaceholder = "Пошук...",
        noData = "Даних не знайдено",
        pageInfo = "{rowStart} до {rowEnd} з {rows} записів",
        pageSizeOptions = "Показати {rows}",
        pagePrevious = "Попередня",
        pageNext = "Наступна",
        pagePreviousLabel = "Попередня",
        pageNextLabel = "Наступна"
      )
      
      
    )
    
  })
  
  output$testUI <- renderUI({
    req(credentials()$user_auth)
    print(user_data()$user)
    fluidRow(
      column(
        width = 12
        ,
        tags$div(tags$div(HTML('<i class="far fa-user" style = "color:#df691a"></i>'),sprintf("%s", user_data()$user)))
        
        # tags$div(tags$div(HTML('<i class="far fa-user" style = "color:white"></i>'),sprintf("%s,
        #                  %s", user_data()$user, Sys.time())))
        
        
        # ,
        # tags$div(sprintf("You logged in at: %s
        #                  You logged as: %s",Sys.time(),user_data()$user)),
        # box(
        #   width = NULL,
        #   status = "primary",
        #   title = ifelse(user_info()$permissions == "admin", "Starwars Data", "Storms Data"),
        #   DT::renderDT(user_data(), options = list(scrollX = TRUE))
        # )
      )
    )
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
