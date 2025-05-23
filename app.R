#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinyBS)
library(shinythemes)
library(openxlsx)
library(shinyauthr)
library(shinyjs)
library(RMySQL)
library(shinyWidgets)
library(shinysurveys)
library(shinyFeedback)
library(shinytitle)
library(pool)
library(DBI)
library(dplyr)
library(tidyr)
library(lubridate)
library(DT)


user_base <- data.frame(
  user = c("accord", "tops"),
  password = c("22222", "11111"), 
  permissions = c("admin", "standard"),
  name = c("User One", "User Two"),
  stringsAsFactors = FALSE,
  row.names = NULL
)


  #pool <- pool::dbPool(
  #drv = RMySQL::MySQL(),
  #dbname = "accordsurveys",
  #host = "127.0.0.1",
  #username = "root",
  #password = "WIN72007@NAZAr"
 #)

pool <- pool::dbPool(
  drv = RMySQL::MySQL(),
  dbname = "a9pt7elh5dx2d96q",
  host = "fojvtycq53b2f2kx.chr7pe7iynqr.eu-west-1.rds.amazonaws.com",
  username = "azpnhhninzjx64pg",
  password = "uh8bfx0wuu4c44e5"
)

onStop(function() {
  print("POOL CLOSED!!!!!!!!!!!!!")
  poolClose(pool)
})






#Sys.setlocale("LC_CTYPE", "ukrainian")
#questions <- read.csv2(file = "questions.txt",header = TRUE, sep = ";")


questions <- data.frame(
  question = c( 
    
    rep("Адміністративно-господарське управління (Ревуцький В.В.)",11),
    rep("Департамент банкнотного бізнесу (Комашко О.Л.)",11),
    rep("Департамент безпеки (Ткачук І.В.)",11),
    rep("Департамент валютного нагляду (Лосенко Р.П.)",11),
    rep("Департамент інформаційних технологій (Семенцул Є.В.)",11),
    rep("Департамент казначейських операцій (Єфремов Ю.В.)",11),
    rep("Департамент корпоративного бізнесу (Клевацький Д.С.)",11),
    rep("Департамент маркетингу (Кривоус І.А.)",11),
    rep("Департамент ризик-менеджементу (Войтків М.В.)",11),
    rep("Департамент розвитку картк. бізнесу та спожив. кредит. (Кутас О.В.)",11),
    rep("Департамент розвитку неторгових операцій (Музика А.І.)",11),
    rep("Департамент розвитку регіональної мережі (Олійник І.А.)",11),
    rep("Департамент розвитку розрах. опер. та депозит. продук. (Ткачук Л.О.)",11),
    rep("Кредитний департамент (Голеня О.Є.)",11),
    rep("Операційний департамент (Баклаєва В.О.)",11),
    rep("Управління по роботі з персоналом (Кирилішина Т.В.)",11),
    rep("Управління фінансового моніторингу (Черняк В.В.)",11),
    rep("Фінансово-економічний департамент (Балун Д.Л.)",11),
    rep("Юридичний департамент (Булгаков П.А.)",11),
    
    rep("Адміністративно-господарське управління (Ревуцький В.В.) ",11),
    rep("Департамент банкнотного бізнесу (Комашко О.Л.) ",11),
    rep("Департамент безпеки (Ткачук І.В.) ",11),
    rep("Департамент валютного нагляду (Лосенко Р.П.) ",11),
    rep("Департамент інформаційних технологій (Семенцул Є.В.) ",11),
    rep("Департамент казначейських операцій (Єфремов Ю.В.) ",11),
    rep("Департамент корпоративного бізнесу (Клевацький Д.С.) ",11),
    rep("Департамент маркетингу (Кривоус І.А.) ",11),
    rep("Департамент ризик-менеджементу (Войтків М.В.) ",11),
    rep("Департамент розвитку картк. бізнесу та спожив. кредит. (Кутас О.В.) ",11),
    rep("Департамент розвитку неторгових операцій (Музика А.І.) ",11),
    rep("Департамент розвитку регіональної мережі (Олійник І.А.) ",11),
    rep("Департамент розвитку розрах. опер. та депозит. продук. (Ткачук Л.О.) ",11),
    rep("Кредитний департамент (Голеня О.Є.) ",11),
    rep("Операційний департамент (Баклаєва В.О.) ",11),
    rep("Управління по роботі з персоналом (Кирилішина Т.В.) ",11),
    rep("Управління фінансового моніторингу (Черняк В.В.) ",11),
    rep("Фінансово-економічний департамент (Балун Д.Л.) ",11),
    rep("Юридичний департамент (Булгаков П.А.) ",11)
  ),
  
  option = option <- c(
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10",
    "не було комунікації",	"1",	"2",	"3",	"4",	"5",	"6",	"7",	"8",	"9",	"10"),
  
  
  # For matrix questions, the IDs should be the same for each question
  # but different for each matrix input unit
  input_type = c(rep("matrix", 418)),
  input_id = c(rep("q11", 209),rep("q12", 209)),
  dependence = NA,
  dependence_value = NA,
  required = c(rep(FALSE, 418))
  #page = c(rep(1, 214), rep(2, 54), rep(3, 54), rep(4, 54))
)




# Define UI for application that draws a histogram
ui <- fluidPage(
  
  shinyjs::useShinyjs(),
  
  
  div(class = "pull-right", logoutUI(id = "logout", label="Вийти", 
                                     icon = icon("angle-right",
                                                 class = "normal"))),
  
  # add login panel UI function
  
  
  div(id = "loginpage", loginUI(id = "login", title = tags$div(tags$img(src="accordbank.svg", height = 50, width = 50),tags$br(tags$br("Вхід до системи"))), 
                                user_title = "Логін",
                                pass_title = "Пароль",
                                error_message = "Невірний логін або пароль!",
                                login_title = "Увійти", additional_ui =  tags$hr(tags$div(id = "myfooter",
                                                                                          tags$p(
                                                                                            "З питань роботи AccordBoosty пишіть ",
                                                                                            tags$a(
                                                                                              href = "mailto:mykhailechko@accordbank.com.ua?Subject=AccordSurvey",
                                                                                              target="_top", "адміністратору"
                                                                                            )
                                                                                          )
                                )
                                )
                                
                                
  )),
  
  tableOutput("user_table"),
  
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
}"))
  ),
  
  
  tags$head(
    # Note the wrapping of the string in HTML()
    tags$style(HTML("body {
  font-family: system-ui, sans-serif;
  padding: 1rem;
}


table {
  width: 100%;
  height: 70vh;
  margin: 0 auto;
  display: block;
  overflow-x: auto;
}

tbody {
  
  white-space: nowrap;
}

th,
td {
  padding: 1rem;
}

thead {
  position: sticky;
  top: 0;
  background: #4e5d6c;
  text-align: left;
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
font-size:10px;color:red;font-family: system-ui, sans-serif;
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
  
  
  
  
  theme = shinytheme("superhero"), #flatly, journal, lumen, readable, simplex, superhero, united, yeti
  
  div( id = "display_content",
       
       fluidPage(

       # App title ----
       #titlePanel("Результати опитування відділень Банку"),
       titlePanel(tags$div(tags$img(src="accordbank.svg", height = 50, width = 50),"Результати опитування відділень Банку")),
         
         # Main panel for displaying outputs ----
         mainPanel(
           
           
            h5(textOutput("text3", container = span)),
            br(),
            dataTableOutput("total_stat1"),
            br(),
            dataTableOutput("total_stat2"),
            br(),
            dataTableOutput("count_surveys"),
            br(),
            dataTableOutput("count_last"),
            br(),
            textOutput("text1", container = span),

            dataTableOutput("results1"),
            br(),
            textOutput("text2", container = span),
            dataTableOutput("results2")
           
         )
         
       )
  ) %>% shinyjs::hidden(),
  
  div( id = "display_survey",
       
       use_shiny_title(),
       #shinysurveys::teaching_r_questions
       shinysurveys::surveyOutput(df = questions,
                                  survey_title = div(img(src="accordbank.svg", height = 35, width = 35), "Опитування"),
                                  survey_description = paste0('ЩОДО КОМУНІКАЦІЇ З ПІДРОЗДІЛАМИ ГБ за минулий місяць'),theme = "#7B1818",),
       
       useShinyjs(),
       tags$head(
         HTML("
                     <meta name='viewport' content= 'width=device-width, initial-scale=1.0'>
                     <link rel='shortcut icon' sizes='16x16' href='accordbank.svg'>
                 ")
       ),
       
       tags$head(
         tags$style(
           HTML("#shiny-notification-panel {
             top: 0;
  bottom: unset;
  left: 0;
  right: 0;
  margin-left: auto;
  margin-right: auto;
  width: 100%;
  max-width: 450px;
  opacity:1;
             }
             "
           )
         )
       ),
       
       
       
       
       
       tags$body(
         HTML(
           "
          <script>
              document.getElementById('submit').innerHTML = 'Відправити';
          </script>
          
          "
         )
       ),
       
       
       tags$body(
         HTML(
           "
          <script>
          
              var iDiv1111 = document.createElement('div');
              iDiv1111.id = 'q11xxx';
              document.getElementById('q11-question').appendChild(iDiv1111);
              document.getElementById('q11xxx').innerText = `1. Оцініть від 1 (дуже негативно) до 10 (дуже позитивно), на скільки ПРАЦІВНИКИ підрозділу ГБ сприяють вирішенню питань/проблем відділення в межах своїх посадових обов'язків (оперативність, якість допомоги, тощо), при зверненні працівників Вашого відділення?`;
              document.getElementById('q11').before(iDiv1111);
              iDiv1111.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');      

              var iDiv2222 = document.createElement('div');
              iDiv2222.id = 'q12xxx';
              document.getElementById('q12-question').appendChild(iDiv2222);
              document.getElementById('q12xxx').innerText = `2. Оцініть від 1 (дуже негативно) до 10 (дуже позитивно), на скільки КЕРІВНИК підрозділу ГБ, при звернені працівників відділення безпосередньо до нього, сприяє вирішенню питань/проблем відділення в межах своїх посадових обов'язків (оперативність, якість допомоги, тощо)?`;
              document.getElementById('q12').before(iDiv2222);
              iDiv2222.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
      
      

          </script>
          
          "
         )
       ),
       
       
       
       
       tags$body(tags$style("#submit {color: white;background-color: grey;} ")),
       tags$body(tags$style("#survey-title {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
       tags$body(tags$style("#survey-title1 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
       tags$body(tags$style("#survey-title2 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
       tags$body(tags$style("#survey-title3 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
       tags$body(tags$style("#survey-description1 {text-align: center;margin: 2px;font-size: 1.2rem;font-weight: bold;} ")),
       tags$body(tags$style("#survey-description2 {text-align: center;margin: 2px;font-size: 1.2rem;font-weight: bold;} ")),
       tags$body(tags$style("#survey-description3 {text-align: center;margin: 2px;font-size: 1.2rem;font-weight: bold;} ")),
       tags$body(tags$style("table {font-size: 10px;} ")),
       tags$body(tags$style("#login-user_name {display: block;
       width: 100%;
       height: 39px;
       padding: 8px 16px;
       font-size: 15px;
       line-height: 1.42857143;
       color: #2b3e50;
         background-color: #ffffff;
         background-image: none;
       border: 1px solid transparent;
       border-radius: 0;
       -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
       box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
       -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
       transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s} ")),
       tags$body(tags$style("#login-user_name:focus {border-color: #2c3e50;
         outline: 0;
       -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(44,62,80,0.6);
       box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(44,62,80,0.6)} ")),
       
       
       tags$body(tags$style("h2 {orphans: 3;
widows: 3;
page-break-after: avoid;
font-family: inherit;
font-weight: 400;
line-height: 1.1;
color: inherit;
font-weight: normal;
line-height: 1;
color: #ebebeb;
margin-top: 21px;
margin-bottom: 10.5px;font-size: 20px;} ")),
       
       tags$body(tags$style("table {font-size: 10px;")),
       
       
       #font-size: 65%;
       #font-size: 32px;
       
       
       tags$body(tags$style("td {color: black;text-align: left !important;}")),
       tags$body(tags$style("th {color: darkred;text-align: left !important;}")),
       #tags$body(tags$style("#q11-question {width: 120%;word-break: break-word}")),
       tags$body(tags$style("table {text-align: left;word-break: break-word;  border-collapse: initial;widht:auto;height:auto}")),
       tags$body(tags$style(".radioMatrixInput table {-webkit-border-vertical-spacing: 0rem;-webkit-border-horizontal-spacing: 0rem;}")),
       tags$head(tags$style("input[type=radio] {accent-color: red;}")),
       tags$head(tags$style("#comment-label {color: red;}")),
       tags$head(tags$style(".modal-content {background-color:white;}")),
       tags$head(tags$style(".modal-title {background-color:white;}")),
       tags$head(tags$style(".modal-header {background-color:white;}")),
       tags$head(tags$style("div #myfooter p {color: white;}")),
       
       tags$body(tags$style("#DataTables_Table_0_wrapper {background-color:#4e5d6c;color: white;width: 70%}")),
       tags$body(tags$style("#DataTables_Table_0 td {background-color:#4e5d6c;color: white;font-family: arial;}")),
       tags$body(tags$style("#DataTables_Table_0 th {background-color:#4e5d6c;color: white;font-family: arial}")),
       tags$body(tags$style("#DataTables_Table_1_wrapper {background-color:#4e5d6c;color: white;width: 70%}")),
       tags$body(tags$style("#DataTables_Table_1 td {background-color:#4e5d6c;color: white;font-family: arial;}")),
       tags$body(tags$style("#DataTables_Table_1 th {background-color:#4e5d6c;color: white;font-family: arial}")),
       tags$body(tags$style("#DataTables_Table_2_wrapper {background-color:#4e5d6c;color: white;width: 70%}")),
       tags$body(tags$style("#DataTables_Table_2 td {background-color:#4e5d6c;color: white;font-family: arial;}")),
       tags$body(tags$style("#DataTables_Table_2 th {background-color:#4e5d6c;color: white;font-family: arial}")),
       tags$body(tags$style("#DataTables_Table_3_wrapper {background-color:#4e5d6c;color: white;width: 70%}")),
       tags$body(tags$style("#DataTables_Table_3 td {background-color:#4e5d6c;color: white;font-family: arial;}")),
       tags$body(tags$style("#DataTables_Table_3 th {background-color:#4e5d6c;color: white;font-family: arial}")),
       tags$body(tags$style("#DataTables_Table_4_wrapper {background-color:#4e5d6c;color: white;width: 130%}")),
       tags$body(tags$style("#DataTables_Table_4 td {background-color:#4e5d6c;color: white;font-family: arial;}")),
       tags$body(tags$style("#DataTables_Table_4 th {background-color:#4e5d6c;color: white;font-family: arial}")),
       tags$body(tags$style("#DataTables_Table_5_wrapper {background-color:#4e5d6c;color: white;width: 130%}")),
       tags$body(tags$style("#DataTables_Table_5 td {background-color:#4e5d6c;color: white;font-family: arial;}")),
       tags$body(tags$style("#DataTables_Table_5 th {background-color:#4e5d6c;color: white;font-family: arial}")),
       tags$body(tags$style("#text1 {color:white;font-family: arial;font-size:10px;width: 70%}")),
       tags$body(tags$style("#text2 {color:white;font-family: arial;font-size:10px;width: 70%}")),
       tags$body(tags$style("#text3 {color:white;font-family: arial;width: 70%}")),
       #tags$body(tags$style("p #survey-description {font-size: 15px;}")),
       
       
  ) %>% shinyjs::hidden(),
  
  
  shinyjs::useShinyjs(),
  
  
  
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  shinyjs::show(id = "loginpage")
  
  logout_init <- shinyauthr::logoutServer(
    id = "logout",
    active = reactive(credentials()$user_auth)
  )
  
  credentials <- shinyauthr::loginServer(
    id = "login",
    data = user_base,
    user_col = user,
    pwd_col = password,
    #sodium_hashed = TRUE,
    log_out = reactive(logout_init())
  )
  
  
  user_data <- reactive({credentials()$info})
  
  shiny::observe({
    req(credentials()$user_auth)
    if (user_data()$user == "tops"){
      shinyjs::show(id = "display_content")
    }
  })
  
  shiny::observe({
    req(credentials()$user_auth)
    if (user_data()$user == "accord"){
      shinyjs::show(id = "display_survey")
    }
  })
  
  shiny::observe({
    req(!credentials()$user_auth)
    shinyjs::hide(id = "display_content")
  })
  
  shiny::observe({
    req(!credentials()$user_auth)
    shinyjs::hide(id = "display_survey")
  })
  
  
  shinysurveys::renderSurvey()
  change_window_title(session, "Опитування")
  flashing_window_title( session, "Акордбанк", inactive_only = TRUE, interval = 1000 )
  
  observeEvent(input$submit, {
    

 


    
    if (is.null(input$q11) || is.null(input$q12)) {
      print("Не всі поля заповнені!!!!!!")
      showModal(modalDialog(footer = NULL,easyClose = T,
                            title = "Ви не проставили всі оцінки! Будь ласка перевірте всі питання!"))
    }else{
      showModal(modalDialog(footer = NULL,
                            title = "Ваші відповіді надіслано! Дякуємо за участь в опитуванні!",
                            #"You can customize what actions happen when a user finishes a survey using input$submit."
      ))
      
      q11 <- as.data.frame(input$q11)
      q11$q <- c(rep("q11",19))
      
      q12 <- as.data.frame(input$q12)
      q12$question_id <- substr(q12$question_id, 1, nchar(q12$question_id)-1)
      q12$q <- c(rep("q12",19))
      
      
      final_data <- bind_rows(q11, q12)
      final_data$date <- Sys.Date()
      
      final_data <- subset(final_data, select = -question_type)
      
      print(final_data)
      
      ssql <- "INSERT INTO results (question_id, response, q, date) "

      for(i in 1:nrow(final_data)) {
        data <- DBI::dbGetQuery(pool,  paste0(ssql,"VALUES('", final_data$question_id[i],"','", final_data$response[i],"','", final_data$q[i], "','", final_data$date[i],"')"))
      }
      
      
      
      
      #print(paste0(ssql,"VALUES('", final_data$question_id,"','", final_data$response,"','", final_data$q, "','", final_data$date,"')"))
    }
    
    #if(any(c(1,2,3) %in% unlist(as.data.frame(input$q11[,3]))) == TRUE && input$comment == ""){
    #  showModal(modalDialog(footer = NULL,easyClose = T,
     #                       title = "Ви проставили оцінку від 1-3 балів! Будь ласка залиште свій коментар!"))
    #}
    

    #if(any(c(1,2,3) %in% unlist(as.data.frame(input$q12[,3]))) == TRUE && input$comment == ""){
    #  showModal(modalDialog(footer = NULL,easyClose = T,
    #                        title = "Ви проставили оцінку від 1-3 балів! Будь ласка залиште свій коментар!"))
    #}
    
    print("clicked save!!!")
    

    #ssql <- "INSERT INTO questionare (division, PIB, q11ker, q12ker, q13ker, q21ker, q22ker, q23ker, q31ker, q32ker, q33ker, q41ker, q42ker, q43ker) "
    
    
    #data <- DBI::dbGetQuery(pool,  paste0(ssql,"VALUES('", input$division,"','", input$PIB,"','", input$q11[1,3],
    #                                      "','", input$q12[1,3],
    #                                      "','", input$q13[1,3],
    #                                      "','", input$q21[1,3],
    #                                      "','", input$q22[1,3],
    #                                      "','", input$q23[1,3],
    #                                      "','", input$q31[1,3],
    #                                      "','", input$q32[1,3],
    #                                      "','", input$q33[1,3],
    #                                      "','", input$q41[1,3],
    #                                      "','", input$q42[1,3],
    #                                      "','", input$q43[1,3],"')"))
    #showNotification("Ваші відповіді надіслано! Дякуємо за участь в опитуванні!",duration = 4,closeButton = FALSE, type = "error",id = "info")

    
    
  })
  
  
  shiny::observe({
    req(credentials()$user_auth)
    if (user_data()$user == "tops"){
      
      output$text1 <- renderText({
        "1. Оцініть від 1 (дуже негативно) до 10 (дуже позитивно), на скільки ПРАЦІВНИКИ підрозділу ГБ сприяють вирішенню питань/проблем відділення в межах своїх посадових обов'язків (оперативність, якість допомоги, тощо), при зверненні працівників Вашого відділення?"
      })
      
      output$text2 <- renderText({
        "2. Оцініть від 1 (дуже негативно) до 10 (дуже позитивно), на скільки КЕРІВНИК підрозділу ГБ, при звернені працівників відділення безпосередньо до нього, сприяє вирішенню питань/проблем відділення в межах своїх посадових обов'язків (оперативність, якість допомоги, тощо)?"
      })
      
      output$text3 <- renderText({
        
        as.character(dbGetQuery(pool, paste0("SELECT replace(concat('Оцінка підрозділів ГБ зі сторони мережі відділень на ', max(DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y')),' (', round(count(*)/38,0), ' анкети)'),'-','.') FROM results")))
        
      })
      
      
      data1 <- reactive({
        
        data1 = dbGetQuery(pool, paste0("SELECT replace(replace(question_id, SUBSTRING_INDEX(question_id,'_', -2), concat('(', SUBSTRING_INDEX(question_id,'_', -2), ')')),'_',' ') as question_id, response, q, date, DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') as dates from results where q in ('q11') and response not in ('не було комунікації')"))
        
        
        #data1 <- data1 %>% mutate(date = paste(quarters(floor_date(as.Date(date), "quarter")-1),format(floor_date(as.Date(date), "quarter")-1,"%Y"))) %>% group_by(question_id, date) %>%
        data1 <- data1 %>% group_by(question_id, dates) %>%
          summarise(mean = mean(as.double(response))) %>%
          spread(dates, mean)

        data1 <- data1 %>% rename("Підрозділ Головного Банку" = "question_id") %>% mutate(across(where(is.numeric), round, 1))
        
        return(data1)
      })
      
      data2 <- reactive({
        
        data2 = dbGetQuery(pool, paste0("SELECT replace(replace(question_id, SUBSTRING_INDEX(question_id,'_', -2), concat('(', SUBSTRING_INDEX(question_id,'_', -2), ')')),'_',' ') as question_id, response, q, date, DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') as dates from results where q in ('q12') and response not in ('не було комунікації')"))
        
        
        #data1 <- data1 %>% mutate(date = paste(quarters(floor_date(as.Date(date), "quarter")-1),format(floor_date(as.Date(date), "quarter")-1,"%Y"))) %>% group_by(question_id, date) %>%
        data2 <- data2 %>% group_by(question_id, dates) %>%
          summarise(mean = mean(as.double(response))) %>%
          spread(dates, mean)
        data2 <- data2 %>% rename("Підрозділ Головного Банку" = "question_id") %>% mutate(across(where(is.numeric), round, 1))
        
       
        return(data2)
      })
      
      
      data3 <- reactive({
        
        
        data3 = dbGetQuery(pool, paste0("SELECT 'Кількість отриманих анкет' as count_surveys, DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') as dates from results"))
        
        
        #data3 <- data3 %>% mutate(date = paste(quarters(floor_date(as.Date(date), "quarter")-1),format(floor_date(as.Date(date), "quarter")-1,"%Y"))) %>% group_by(count_surveys, date) %>%
        data3 <- data3 %>% group_by(count_surveys, dates) %>%
          summarise(count = n()/38) %>%
          spread(dates, count)
        data3 <- data3 %>% rename(" " = "count_surveys")
        
        return(data3)
      })
      
      data4 <- reactive({
        
        
        data4 = dbGetQuery(pool, paste0("SELECT * from (SELECT replace(replace(question_id, SUBSTRING_INDEX(question_id,'_', -2), concat('(', SUBSTRING_INDEX(question_id,'_', -2), ')')),'_',' ') as question_id, response, q, date, (case when (response = 'не було комунікації') THEN 'не було комунікацій' ELSE 'оцінювався' END) as res, (case when (q = 'q11') THEN 'питання 1' ELSE 'питання 2' END) as question, DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') as dates from results) as Q
where dates in (select max(DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y')) as dates from results)"))
        
        
        #data4 <- data4 %>% mutate(date = paste(quarters(floor_date(as.Date(date), "quarter")-1),format(floor_date(as.Date(date), "quarter")-1,"%Y"))) %>% group_by(question_id, question, res) %>%
        data4 <- data4 %>% group_by(question_id, question, res) %>%
          summarise(count = n()) %>%
          spread(res, count)
        data4 <- data4 %>% rename("Підрозділ Головного Банку" = "question_id")
        data4 <- data4 %>% rename("Питання" = "question")
        
        data4[is.na(data4)] <- 0
        
        return(data4)
      })

      data5 <- reactive({
        
        
        data5 = dbGetQuery(pool, paste0("
                                        
                                        Select * from (SELECT replace(replace(question_id, SUBSTRING_INDEX(question_id,'_', -2), concat('(', SUBSTRING_INDEX(question_id,'_', -2), ')')),'_',' ') as 'Оцінка ПРАЦІВНИКІВ підрозділу головного офісу', round(sum(case when response = 'не було комунікації' then 0 else response end) / count(case when response <> 'не було комунікації' then  response end),1) as 'середній бал',
concat(round((count(case when response in(1,2,3,4,5) then response end) / count(case when response <> 'не було комунікації' then  response end))*100,0),'%') as 'Частка оцінок нижче 5 балів включно',
count(case when response <> 'не було комунікації' then  response end) as 'К-ть зарахованих оцінок',
concat(round((count(case when response <> 'не було комунікації' then  response end) / count(response))*100,0),'%') as 'Частка зарахованих  оцінок від всіх голосувань',
  count((CASE response WHEN 1 THEN response ELSE NULL END)) AS '1',
  count((CASE response WHEN 2 THEN response ELSE NULL END)) AS '2',
  count((CASE response WHEN 3 THEN response ELSE NULL END)) AS '3',
  count((CASE response WHEN 4 THEN response ELSE NULL END)) AS '4',
  count((CASE response WHEN 5 THEN response ELSE NULL END)) AS '5',
  count((CASE response WHEN 6 THEN response ELSE NULL END)) AS '6',
  count((CASE response WHEN 7 THEN response ELSE NULL END)) AS '7',
  count((CASE response WHEN 8 THEN response ELSE NULL END)) AS '8',
  count((CASE response WHEN 9 THEN response ELSE NULL END)) AS '9',
  count((CASE response WHEN 10 THEN response ELSE NULL END)) AS '10',
  count((CASE response WHEN 'не було комунікації' THEN response ELSE NULL END)) AS 'не було комунікації'
FROM results 
where q = 'q11' and DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') in (SELECT max(DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y')) FROM results)
GROUP BY question_id
Order by 2
) AS Q

union all

SELECT 'К-ть оцінок в цілому' as 'К-ть оцінок в цілому', round(sum(case when response = 'не було комунікації' then 0 else response end) / count(case when response <> 'не було комунікації' then  response end),1) as total_avg_rank,
concat(round((count(case when response in(1,2,3,4,5) then response end) / count(case when response <> 'не було комунікації' then  response end))*100,0),'%') as 'Частка оцінок нижче 5 балів включно',
count(case when response <> 'не було комунікації' then  response end) as 'К-ть зарахованих оцінок',
concat(round((count(case when response <> 'не було комунікації' then  response end) / count(response))*100,0),'%') as 'Частка зарахованих  оцінок від всіх голосувань',
  count((CASE response WHEN 1 THEN response ELSE NULL END)) AS '1',
  count((CASE response WHEN 2 THEN response ELSE NULL END)) AS '2',
  count((CASE response WHEN 3 THEN response ELSE NULL END)) AS '3',
  count((CASE response WHEN 4 THEN response ELSE NULL END)) AS '4',
  count((CASE response WHEN 5 THEN response ELSE NULL END)) AS '5',
  count((CASE response WHEN 6 THEN response ELSE NULL END)) AS '6',
  count((CASE response WHEN 7 THEN response ELSE NULL END)) AS '7',
  count((CASE response WHEN 8 THEN response ELSE NULL END)) AS '8',
  count((CASE response WHEN 9 THEN response ELSE NULL END)) AS '9',
  count((CASE response WHEN 10 THEN response ELSE NULL END)) AS '10',
  count((CASE response WHEN 'не було комунікації' THEN response ELSE NULL END)) AS 'не було комунікації'
FROM results 
where q = 'q11' and DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') in (SELECT max(DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y')) FROM results)
GROUP BY 'К-ть оцінок в цілому'
                                        
                                        "))
        
        return(data5)
      })
        
        data6 <- reactive({
          
          
          data6 = dbGetQuery(pool, paste0("select * from (SELECT replace(replace(question_id, SUBSTRING_INDEX(question_id,'_', -2), concat('(', SUBSTRING_INDEX(question_id,'_', -2), ')')),'_',' ') as 'Оцінка КЕРІВНИКА підрозділу головного офісу', round(sum(case when response = 'не було комунікації' then 0 else response end) / count(case when response <> 'не було комунікації' then  response end),1) as 'середній бал',
concat(round((count(case when response in(1,2,3,4,5) then response end) / count(case when response <> 'не було комунікації' then  response end))*100,0),'%') as 'Частка оцінок нижче 5 балів включно',
count(case when response <> 'не було комунікації' then  response end) as 'К-ть зарахованих оцінок',
concat(round((count(case when response <> 'не було комунікації' then  response end) / count(response))*100,0),'%') as 'Частка зарахованих  оцінок від всіх голосувань',
  count((CASE response WHEN 1 THEN response ELSE NULL END)) AS '1',
  count((CASE response WHEN 2 THEN response ELSE NULL END)) AS '2',
  count((CASE response WHEN 3 THEN response ELSE NULL END)) AS '3',
  count((CASE response WHEN 4 THEN response ELSE NULL END)) AS '4',
  count((CASE response WHEN 5 THEN response ELSE NULL END)) AS '5',
  count((CASE response WHEN 6 THEN response ELSE NULL END)) AS '6',
  count((CASE response WHEN 7 THEN response ELSE NULL END)) AS '7',
  count((CASE response WHEN 8 THEN response ELSE NULL END)) AS '8',
  count((CASE response WHEN 9 THEN response ELSE NULL END)) AS '9',
  count((CASE response WHEN 10 THEN response ELSE NULL END)) AS '10',
  count((CASE response WHEN 'не було комунікації' THEN response ELSE NULL END)) AS 'не було комунікації'
FROM results 
where q = 'q12' and DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') in (SELECT max(DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y')) FROM results)
GROUP BY question_id
order by 2
) as Q

union all

SELECT 'К-ть оцінок в цілому' as 'К-ть оцінок в цілому', round(sum(case when response = 'не було комунікації' then 0 else response end) / count(case when response <> 'не було комунікації' then  response end),1) as total_avg_rank,
concat(round((count(case when response in(1,2,3,4,5) then response end) / count(case when response <> 'не було комунікації' then  response end))*100,0),'%') as 'Частка оцінок нижче 5 балів включно',
count(case when response <> 'не було комунікації' then  response end) as 'К-ть зарахованих оцінок',
concat(round((count(case when response <> 'не було комунікації' then  response end) / count(response))*100,0),'%') as 'Частка зарахованих  оцінок від всіх голосувань',
  count((CASE response WHEN 1 THEN response ELSE NULL END)) AS '1',
  count((CASE response WHEN 2 THEN response ELSE NULL END)) AS '2',
  count((CASE response WHEN 3 THEN response ELSE NULL END)) AS '3',
  count((CASE response WHEN 4 THEN response ELSE NULL END)) AS '4',
  count((CASE response WHEN 5 THEN response ELSE NULL END)) AS '5',
  count((CASE response WHEN 6 THEN response ELSE NULL END)) AS '6',
  count((CASE response WHEN 7 THEN response ELSE NULL END)) AS '7',
  count((CASE response WHEN 8 THEN response ELSE NULL END)) AS '8',
  count((CASE response WHEN 9 THEN response ELSE NULL END)) AS '9',
  count((CASE response WHEN 10 THEN response ELSE NULL END)) AS '10',
  count((CASE response WHEN 'не було комунікації' THEN response ELSE NULL END)) AS 'не було комунікації'
FROM results 
where q = 'q12' and DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y') in (SELECT max(DATE_FORMAT(date + INTERVAL 1 MONTH, '01-%m-%Y')) FROM results)
GROUP BY 'К-ть оцінок в цілому'

"))
        
        

        return(data6)
      })
      
      output$total_stat1 <- renderDataTable({
        #selectize-input items full has-options has-items
        datatable(
          isolate(data5()),
          rownames = FALSE,
          options = list(
            #lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
            #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
            #buttons = c('excel'),
            pageLength = -1,
            paging = FALSE,
            searching = FALSE,
            info = FALSE,
            sort = TRUE,
            highlight = TRUE,
            borderless = FALSE,
            striped = FALSE,
            compact = TRUE,
            wrap = FALSE,
            resizable = FALSE,
            columnDefs = (list(list(width = '50px', targets =c(1,2,3,4,15)))) 
          ),
          
        )}
      )
      
      output$total_stat2 <- renderDataTable({
        #selectize-input items full has-options has-items
        datatable(
          isolate(data6()),
          rownames = FALSE,
          options = list(
            #lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
            #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
            #buttons = c('excel'),
            pageLength = -1,
            paging = FALSE,
            searching = FALSE,
            info = FALSE,
            sort = TRUE,
            highlight = TRUE,
            borderless = FALSE,
            striped = FALSE,
            compact = TRUE,
            wrap = FALSE,
            resizable = FALSE,
            columnDefs = (list(list(width = '50px', targets =c(1,2,3,4,15)))) 
          ),
          
        )}
      )
      
      output$results1 <- renderDataTable({
        #selectize-input items full has-options has-items
        datatable(
          isolate(data1()),
          rownames = FALSE,
          options = list(
          #lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
          #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
          #buttons = c('excel'),
          pageLength = -1,
          paging = FALSE,
          searching = FALSE,
          info = FALSE,
          sort = TRUE,
          highlight = TRUE,
          borderless = FALSE,
          striped = FALSE,
          compact = TRUE,
          wrap = FALSE,
          resizable = FALSE,
          columnDefs = (list(list(width = '100px', targets =c(0)))) 
          ),
          
        )}
      )
      
      output$results2 <- renderDataTable({
        #selectize-input items full has-options has-items
        datatable(
          isolate(data2()),
          rownames = FALSE,
          options = list(
            #lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
            #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
            #buttons = c('excel'),
            pageLength = -1,
            paging = FALSE,
            searching = FALSE,
            info = FALSE,
            sort = TRUE,
            highlight = TRUE,
            borderless = FALSE,
            striped = FALSE,
            compact = TRUE,
            wrap = FALSE,
            resizable = FALSE,
            columnDefs = (list(list(width = '100px', targets =c(0)))) 
          ),
          
        )}
      )
          
      output$count_surveys <- renderDataTable({
        #selectize-input items full has-options has-items
        datatable(
          isolate(data3()),
          rownames = FALSE,
          options = list(
            #lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
            #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
            #buttons = c('excel'),
            pageLength = -1,
            paging = FALSE,
            searching = FALSE,
            info = FALSE,
            sort = TRUE,
            highlight = TRUE,
            borderless = FALSE,
            striped = FALSE,
            compact = TRUE,
            wrap = FALSE,
            resizable = FALSE,
            columnDefs = (list(list(width = '100px', targets =c(0)))) 
          ),
          
        )}
      )
      
      output$count_last <- renderDataTable({
        #selectize-input items full has-options has-items
        datatable(
          isolate(data4()),
          rownames = FALSE,
          options = list(
            #lengthMenu = list(c(10, 25, 50, 100), c("10","25","50", "100")),
            #buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
            #buttons = c('excel'),
            pageLength = -1,
            paging = FALSE,
            searching = FALSE,
            info = FALSE,
            sort = TRUE,
            highlight = TRUE,
            borderless = FALSE,
            striped = FALSE,
            compact = TRUE,
            wrap = FALSE,
            resizable = FALSE,
            columnDefs = (list(list(width = '100px', targets =c(0)))) 
          ),
          
        )}
      )
      
    }
    else{
      #hideTab(inputId = "mytabs" ,target = "Secret")
      #print(mtcars)
    }
    
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
