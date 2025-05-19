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


user_base <- data.frame(
  user = c("accord", "tops"),
  password = c("22222", "11111"), 
  permissions = c("admin", "standard"),
  name = c("User One", "User Two"),
  stringsAsFactors = FALSE,
  row.names = NULL
)


#  pool <- pool::dbPool(
#  drv = RMySQL::MySQL(),
#  dbname = "accordsurveys",
#  host = "127.0.0.1",
#  username = "root",
#  password = "WIN72007@NAZAr"
# )

#pool <- pool::dbPool(
#  drv = RMySQL::MySQL(),
#  dbname = "heroku_623d565686a87a4",
#  host = "eu-cluster-west-01.k8s.cleardb.net",
#  username = "bc6a3dad916b4a",
#  password = "0c7f407f"
#)

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
       # Application title
       titlePanel("Old Faithful Geyser Data"),
       
       # Sidebar with a slider input for number of bins 
       sidebarLayout(
         sidebarPanel(
           sliderInput("bins",
                       "Number of bins:",
                       min = 1,
                       max = 50,
                       value = 30)
         ),
         
         # Show a plot of the generated distribution
         mainPanel(
           plotOutput("distPlot")
         )
       )
  ) %>% shinyjs::hidden(),
  
  div( id = "display_survey",
       
       use_shiny_title(),
       #shinysurveys::teaching_r_questions
       shinysurveys::surveyOutput(df = questions,
                                  survey_title = div(img(src="accordbank.svg", height = 35, width = 35), "Опитування"),
                                  survey_description = 'ЩОДО КОМУНІКАЦІЇ З ПІДРОЗДІЛАМИ ГБ',theme = "#7B1818",),
       
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
              document.getElementById('q11xxx').innerText = `Оцініть від 1 (дуже негативно) до 10 (дуже позитивно), на скільки відповідальні особи підрозділу ГБ сприяють вирішеню питань/проблем відділення в межах своїх посадових обов'язків  (оперативність, якість допомоги, тощо), при зверенні працівників Вашого відділення?`;
              document.getElementById('q11').before(iDiv1111);
              iDiv1111.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');      

              var iDiv2222 = document.createElement('div');
              iDiv2222.id = 'q12xxx';
              document.getElementById('q12-question').appendChild(iDiv2222);
              document.getElementById('q12xxx').innerText = `Оцініть від 1 (дуже негативно) до 10 (дуже позитивно), на скільки КЕРІВНИК підрозділу ГБ, при звернені працівників відділення безпосередньо до нього, сприяє вирішеню питань/проблем відділення в межах своїх посадових обов'язків (оперативність, якість допомоги, тощо)?`;
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
      
      #print(final_data)
      
      ssql <- "INSERT INTO results (question_id, response, q, date) "

      #for(i in 1:nrow(final_data)) {
      #  data <- DBI::dbGetQuery(pool,  paste0(ssql,"VALUES('", final_data$question_id[i],"','", final_data$response[i],"','", final_data$q[i], "','", final_data$date[i],"')"))
      #}
      
      
      
      
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
      
      
      
    }
    else{
      #hideTab(inputId = "mytabs" ,target = "Secret")
      #print(mtcars)
    }
    
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
