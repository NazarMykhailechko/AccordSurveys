library(shinysurveys)
library(shiny)
library(shinythemes)
library(shinyjs)
library(shinyFeedback)
library(shinytitle)
library(shinyWidgets)
library(RMySQL)
library(pool)
library(DBI)


 pool <- pool::dbPool(
  drv = RMySQL::MySQL(),
  dbname = "accordsurveys",
  host = "127.0.0.1",
  username = "root",
  password = "WIN72007@NAZAr"
 )

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

questions <- data.frame(
  question = c( 
    
    rep("Регіональний директор забезпечує чітку, своєчасну та відкриту комунікацію з Вами?",5),
    rep("Наскільки своєчасним та ефективним є зворотний зв’язок, який Ви отримуєте від регіонального директора?",5),
    rep("Наскільки ефективною є практична підтримка регіонального директора у вирішенні складних питань, що виникають на відділенні?",5),
    rep("Наскільки об`єктивним є регіональний директор у прийнятті управлінських рішень та оцінці роботи?",5),
    rep("Наскільки активно регіональний директор залучається до роботи з потенційними клієнтами відділення безпосередньо «в полях»?",5),
    rep("Регіональний директор бере участь у підборі персоналу для відділення?",5),
    rep("Регіональний директор відвідує відділення з метою надання реальної підтримки та контролю за ключовими процесами – такими як: розвиток бізнес зростання напрямків відділення, якість обслуговування клієнтів, управління ризиками, виконання планових показників, інше?",5),
    rep("Регіональний директор демонструє чітке стратегічне бачення розвитку свого регіону – розуміє ринок, визначає пріоритети, формує цілі, ініціює довгострокові рішення та адаптує команду до змін?",5),
    rep("Як часто проводяться селекторні/Zoom-зустрічі з регіональним директором для обговорення проблемних питань?",4),
    rep("Наскільки ефективними Ви вважаєте онлайн – зустрічі з регіональним директором з точки зору змісту, практичної користі, залученості та можливості обговорити важливі питання?",5),
    rep("Наскільки дії та стиль управління регіонального директора мотивують Вас і Вашу команду до досягнення результатів?",5),
    rep("Чи враховується Ваша думка у процесі прийняття рішень на регіональному рівні?",5),
    rep("Чи траплялися ситуації, коли у спілкуванні з регіональним директором Ви відчували емоційний дискомфорт ( наприклад, через тон спілкування, тиск, неприйнятні висловлювання чи порушення етичних норм)?",5),
    rep("Що Ви вважаєте сильними сторонами регіонального директора?",1),
    rep("Які напрями в його/її роботі, на Вашу думку, потребують покращення?",1),
    rep("Як ви загалом оцінюєте роботу регіонального директора – з урахуванням його управлінських рішень, комунікації, підтримки, професіоналізму та внеску в розвиток відділення?",5)
    
  ),
  
  option = option <- c(
    "1 - зовсім не забезпечує: інформація часто запізнюється, нечітка або відсутня",
    "2 – переважно ні: іноді інформує, але часто виникає плутанина або затримки у комунікації",
    "3 – частково забезпечує: іноді комунікація якісна, але не має стабільності",
    "4 – переважно забезпечує: зазвичай спілкується чітко й вчасно",
    "5 – повністю забезпечує: комунікація завжди чітка, своєчасна і відкрита",
    "1 - зворотного зв’язку не має або він демотивує, нечіткий і неконструктивний, все вирішую самостійно",
    "2 – дуже рідко отримую, він поверхневий і не допомагає в роботі",
    "3 – отримую іноді, інколи корисний, але часто не чіткий або з запізненням",
    "4 – переважно своєчасний, конструктивний і допомагає коригувати дії",
    "5 – регулярний, чіткий, корисний, мотивує до розвитку й покращення результатів",
    "1 - зовсім не надає підтримки або уникає участі у вирішенні складних питань",
    "2 - підтримка рідко надається, часто формальна або неефективна",
    "3 – іноді допомагає, але не завжди своєчасно та результативно",
    "4 – переважно залучається, допомагає знайти рішення в складних ситуаціях",
    "5 – завжди активно долучається, надає дієву підтримку, допомагає вирішити проблеми",
    "1 -  рішення часто суб’єктивні, упереджені або базуються на особистому ставленні",
    "2 - є прояви упередженості, не всі оцінки роботи виглядають справедливими",
    "3 – іноді рішення об’єктивні, іноді – викликають сумніви щодо неупередженості",
    "4 – переважно керується фактами та результатами, оцінки зазвичай справедливі",
    "5 – завжди приймає рішення з опорою на факти, оцінки прозорі та неупереджені",
    "1 - не залучається взагалі або робить це лише формально",
    "2  - дуже рідко бере участь у зустрічах або лише у виняткових випадках",
    "3 - іноді долучається, але без стабільності і активної ролі",
    "4 - переважно залучений, підтримує зустрічі з потенційними клієнтами",
    "5 - активно та регулярно працює з потенційними клієнтами",
    "1 - не бере участі взагалі",
    "2 - дуже обмежена участь, лише в окремих питаннях",
    "3 - залучається вибірково, участь, участь не постійна",
    "4 - переважно залучений, взаємодіє  та надає підримку в підборі",
    "5 - активно долучений до процесу, регулярно взаємодіє і дає рекомендації",
    "1  - не відвідує взагалі ( 0 в квартал)",
    "2 – відвідує рідко, підтримка обмежена, контроль неефективний або поверхневий ( 0-1 в квартал)",
    "3 – іноді візити допомагають, але вплив на процеси нестабільний або частковий ( 1-2 в квартал)",
    "4 – переважно відвідує, підтримує, допомагає з питаннями щодо зростання показників відділення, надає зворотний зв`язок ( 2-3 в квартал)",
    "5 – регулярно відвідує, глибоко розуміє ситуації на відділенні, допомагає вирішити питання, мотивує ( більше 3х в квартал)",
    "1 – не проявляє статегічного бачення, відсутні чіткі орієнтири та ініціативи розвитку",
    "2 – рідко ділиться баченнями, фокусується лише на поточних завданнях без довгостркової перспективи",
    "3 – має загальне уявлення про розвиток, але бракує конкретики або системності",
    "4 – визначає зрозумілі цілі, бачення частково доноситься до команди, ініціює стратегічні дії",
    "5 – чітко формулює бачення розвитку регіону, стратегічно мислить, надихає команду та діє проактивно",
    "1 - Щотижня",
    "2 - Декілька разів на місяць",
    "3 - Рідше одного разу на місяць",
    "4 - Практично не проводяться",
    "1 – зустрічі неефектифні, не дають жодної користі, даремно витрачаємо час",
    "2 – частково корисні, але поверхові або без глибокого змісту",
    "3 – помірно ефективні, частина інформації є корисною, але бракує практичності чи залученості",
    "4 – ефективні, дають можливість обговорити важливі теми, є практичне значення",
    "5 – дуже ефективні – змістовні, конструктивні, дають чітке розуміння ситуації та сприяють реальним діям",
    "1 – демотивує, стиль управління пригнічує ініціативу, викликає відчуття несправедливості або байдужості. Мотивація значно знижується",
    "2 – скоріше демотивує,  є певні позитивні моменти, але в цілому стиль управління  не сприяє залученості чи ентузіазму",
    "3 – нейтрально, дії та стиль управління не впливають суттєво на мотивацію. Команда працює на автоматизмі або через внутрішні чинники",
    "4 – скоріше мотивує – є підримка, визнання та зворотний зв’язок, це позитивно впливає на результати",
    "5 – дуже мотивує – регілнальний директор надихає, підримує, створює атмосфкру довіри та відповідальності",
    "1 – зовсім не враховується, рішення приймаються без обговорень та зворотного зв’язку",
    "2 – враховується дуже рідко, переважно формально",
    "3 - частково враховується, але вплив мінімальний",
    "4 – думка здебільшого береться до уваги, іноді залучаються до обговорення",
    "5 – враховується завжди, мене слухають, запрошують до обговорення",
    "1 – так, часто трапляються подібні ситуації",
    "2 – іноді відчував (-ла) дискомфорт",
    "3 – рідко, але такі випадки були",
    "4 – майже ніколи не було подібного досвіду",
    "5 – ніколи не відчував (-ла) емоційного дискомфорту",
    "Заповніть поле",
    "Заповніть поле",
    "1 – дуже незадовільно",
    "2 – задовільно з великими недоліками",
    "3 – середній рівень – частково справляється з обов`язками, але є важливі зони для розвитку",
    "4 – добре – забезпечує стабільну підтримку, ефективне управління, позитивно впливає на розвиток відділень",
    "5 – відмінно – високопрофесійний підхід, стратегічне бачення, підтримка та довіра команди"
  ),
  
  
  # For matrix questions, the IDs should be the same for each question
  # but different for each matrix input unit
  input_type = c(rep("mc", 64),rep("text", 2),rep("mc", 5)),
  input_id = c(
    
    rep("q_11_Комунікація_та_підтримка-Регіональний директор забезпечує чітку, своєчасну та відкриту комунікацію з Вами?",5),
    rep("q_12_Комунікація_та_підтримка-Наскільки свєчасним та ефективним є зворотний зв’язок, який Ви отримуєте від регіонального директора?",5),
    rep("q_13_Комунікація_та_підтримка-Наскільки ефективною є  практична підтримка регіонального директора у вирішенні складних питань, що виникають на відділенні? ",5),
    rep("q_14_Комунікація_та_підтримка-Наскільки об’єктивним є регіональний директор у прийнятті управлінських рішень та оцінці роботи?",5),
    rep("q_21_Взаємодія з клієнтами та персоналом-Наскільки активно регіональний директор залучається до роботи з потенційними клієнтами відділення безпосередньо «в полях»?",5),
    rep("q_22_Взаємодія з клієнтами та персоналом-Регіональний директор бере участь у підборі персоналу для відділення?",5),
    rep("q_23_Взаємодія з клієнтами та персоналом-Регіональний директор відвідує відділення з метою надання реальної підтримки та контролю за ключовими процесами – такими як розвиток бізнес зростання напрямків відділення, якість обслуговування клієнтів, управління ризиками, виконання планових показників, інше?",5),
    rep("q_31_Стратегічне бачення-Регіональний директор демонструє чітке стратегічне бачення розвитку свого регіону – розуміє ринок, визначає пріоритети, формує цілі, ініціює довгострокові рішення та адаптує команду до змін?",5),
    rep("q_41_Онлайн_наради_та_зустрічі-Як часто проводяться селекторні Zoom-зустрічі з регіональним директором для обговорення проблемних питань?",4),
    rep("q_42_Онлайн_наради_та_зустрічі-Наскільки ефективними Ви вважаєте онлайн – зустрічі з регіональним директором з точки зору змісту, практичної користі, залученості та можливості обговорити важливі питання?",5),
    rep("q_51_Мотивація та залучення-Наскільки дії та стиль управління регіонального директора мотивують Вас і Вашу команду до досягнення результатів?",5),
    rep("q_52_Мотивація та залучення-Чи враховується Ваша думка у процесі прийняття рішень на регіональному рівні?",5),
    rep("q_53_Мотивація та залучення-Чи траплялися ситуації, коли у спілкуванні з регіональним директором Ви відчували емоційний дискомфорт ( наприклад, через тон спілкування, тиск, неприйнятні висловлювання чи порушення етичних норм)?",5),
    rep("q_61_Відкриті запитання-Що Ви вважаєте сильними сторонами регіонального директора?",1),
    rep("q_62_Відкриті запитання-Які напрями в його/її роботі, на Вашу думку, потребують покращення?",1),
    rep("q_63_Відкриті запитання-Як ви загалом оцінюєте роботу регіонального директора – з урахуванням його управлінських рішень, комунікації, підтримки, професіоналізму та внеску в розвиток відділення?",5)
    
    
  ),
  dependence = NA,
  dependence_value = NA,
  required = c(rep(TRUE, 71))
  #page = c(rep(1, 214), rep(2, 54), rep(3, 54), rep(4, 54))
)

#View(questions)

#questions <- read.csv2(file = "questions.txt",header = TRUE, sep = ";")


#write.csv(x = questions, sep = ";",file = "111.txt")


#choicesOpt = list(content = c("<img src='accordbank.svg' width=15px> 1 відділення</img>",
#                             "<img src='accordbank.svg' width=15px> 2 відділення</img>",
#                            "<img src='accordbank.svg' width=15px> 3 відділення</img>"

ui <- shiny::fluidPage(use_shiny_title(),
                       #shinysurveys::teaching_r_questions
                       shinysurveys::surveyOutput(df = questions,
                                                  survey_title = div(img(src="accordbank.svg", height = 35, width = 35), "Опитування"),
                                                  survey_description = 'Комунікація та підтримка:',theme = "#7B1818"),
                       
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
          
              var iDiv1 = document.createElement('div');
              iDiv1.id = 'title-description-1';
              iDiv1.className = 'title-description';
              var iDiv1_1 = document.createElement('h1');
              iDiv1_1.id = 'survey-title1';
              var iDiv1_2 = document.createElement('p');
              iDiv1_2.id = 'survey-description1';
              
              document.getElementById('q_21_Взаємодія з клієнтами та персоналом-Наскільки активно регіональний директор залучається до роботи з потенційними клієнтами відділення безпосередньо «в полях»?-question').before(iDiv1)
              document.getElementById('title-description-1').appendChild(iDiv1_1)
              document.getElementById('title-description-1').appendChild(iDiv1_2)
              document.getElementById('survey-description1').innerHTML = 'Взаємодія з клієнтами та персоналом:';

              var iDiv1_1_1 = document.createElement('div');
              iDiv1_1_1.id = 'div1';
              document.getElementById('survey-title1').appendChild(iDiv1_1_1);
              document.getElementById('div1').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              

              
              
              
              var iDiv3 = document.createElement('div');
              iDiv3.id = 'title-description-2';
              iDiv3.className = 'title-description';
              var iDiv3_3 = document.createElement('h1');
              iDiv3_3.id = 'survey-title2';
              var iDiv3_4 = document.createElement('p');
              iDiv3_4.id = 'survey-description2';
              
              document.getElementById('q_31_Стратегічне бачення-Регіональний директор демонструє чітке стратегічне бачення розвитку свого регіону – розуміє ринок, визначає пріоритети, формує цілі, ініціює довгострокові рішення та адаптує команду до змін?-question').before(iDiv3)
              document.getElementById('title-description-2').appendChild(iDiv3_3)
              document.getElementById('title-description-2').appendChild(iDiv3_4)
              document.getElementById('survey-description2').innerHTML = 'Стратегічне бачення:';

              var iDiv3_3_3 = document.createElement('div');
              iDiv3_3_3.id = 'div3';
              document.getElementById('survey-title2').appendChild(iDiv3_3_3);
              document.getElementById('div3').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              



              var iDiv5 = document.createElement('div');
              iDiv5.id = 'title-description-3';
              iDiv5.className = 'title-description';
              var iDiv5_5 = document.createElement('h1');
              iDiv5_5.id = 'survey-title3';
              var iDiv5_6 = document.createElement('p');
              iDiv5_6.id = 'survey-description3';
              
              document.getElementById('q_41_Онлайн_наради_та_зустрічі-Як часто проводяться селекторні Zoom-зустрічі з регіональним директором для обговорення проблемних питань?-question').before(iDiv5)
              document.getElementById('title-description-3').appendChild(iDiv5_5)
              document.getElementById('title-description-3').appendChild(iDiv5_6)
              document.getElementById('survey-description3').innerHTML = 'Онлайн- наради та зустрічі:';

              var iDiv5_5_5 = document.createElement('div');
              iDiv5_5_5.id = 'div5';
              document.getElementById('survey-title3').appendChild(iDiv5_5_5);
              document.getElementById('div5').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              
              
              
              
              var iDiv6 = document.createElement('div');
              iDiv6.id = 'title-description-4';
              iDiv6.className = 'title-description';
              var iDiv6_5 = document.createElement('h1');
              iDiv6_5.id = 'survey-title4';
              var iDiv6_6 = document.createElement('p');
              iDiv6_6.id = 'survey-description4';
              
              document.getElementById('q_51_Мотивація та залучення-Наскільки дії та стиль управління регіонального директора мотивують Вас і Вашу команду до досягнення результатів?-question').before(iDiv6)
              document.getElementById('title-description-4').appendChild(iDiv6_5)
              document.getElementById('title-description-4').appendChild(iDiv6_6)
              document.getElementById('survey-description4').innerHTML = 'Мотивація та залучення:';

              var iDiv6_6_6 = document.createElement('div');
              iDiv6_6_6.id = 'div6';
              document.getElementById('survey-title4').appendChild(iDiv6_6_6);
              document.getElementById('div6').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              
              
              
              
              var iDiv8 = document.createElement('div');
              iDiv8.id = 'title-description-8';
              iDiv8.className = 'title-description';
              var iDiv8_5 = document.createElement('h1');
              iDiv8_5.id = 'survey-title8';
              var iDiv8_6 = document.createElement('p');
              iDiv8_6.id = 'survey-description8';
              
              document.getElementById('q_61_Відкриті запитання-Що Ви вважаєте сильними сторонами регіонального директора?-question').before(iDiv8)
              document.getElementById('title-description-8').appendChild(iDiv8_5)
              document.getElementById('title-description-8').appendChild(iDiv8_6)
              document.getElementById('survey-description8').innerHTML = 'Відкриті запитання:';

              var iDiv8_8_8 = document.createElement('div');
              iDiv8_8_8.id = 'div8';
              document.getElementById('survey-title8').appendChild(iDiv8_8_8);
              document.getElementById('div8').innerHTML = '<img width=\"35\" height=\"35\" src=\"accordbank.svg\">             Опитування            ';
              
              
              
              

              document.getElementById('survey-description').setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.6rem;font-weight: bold;');



              var iDiv11 = document.createElement('div');
              iDiv11.id = 'q11';
              iDiv11.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q11').before(iDiv11);
              document.getElementById('q11').innerHTML = 'ОЦІНІТЬ ВАШІ ЗНАННЯ/ ЗНАННЯ  ВАШИХ ПІДЛЕГЛИХ ЗА НАПРЯМОМ ЗЕД (ОПЕРАЦІЇ ПРОДАЖУ КУПІВЛІ БЕЗГОТІВКОВОЇ ІНОЗЕМНОЇ ВАЛЮТИ)';
              
              
              
              var iDiv12 = document.createElement('div');
              iDiv12.id = 'q12';
              iDiv12.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q12').before(iDiv12);
              document.getElementById('q12').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ КЛІЄНТІВ НА ЦЕЙ НАПРЯМ';
              
              
              var iDiv13 = document.createElement('div');
              iDiv13.id = 'q13';
              iDiv13.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q13').before(iDiv13);
              document.getElementById('q13').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ДЕПАРТАМЕНТОМ ВАЛЮТНОГО НАГЛЯДУ, УФМ ТОЩО, ДЛЯ ВИРІШЕННЯ СКЛАДНИХ ПИТАНЬ ПО КЛІЄНТУ';


              var iDiv21 = document.createElement('div');
              iDiv21.id = 'q21';
              iDiv21.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q21').before(iDiv21);
              document.getElementById('q21').innerHTML = 'ОЦІНІТЬ ВАШЕ ЗНАННЯ/ЗНАННЯ ВАШИХ ПІДЛЕГЛИХ  НАПРЯМУ СПІВПРАЦІ З ЮРИДИЧНИМИ ОСОБАМИ - РОЗРАХУНКОВО-КАСОВОГО ОБСЛУГОВУВАННЯ ЮР.ОСІБ';
              
              
              
              var iDiv22 = document.createElement('div');
              iDiv22.id = 'q22';
              iDiv22.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q22').before(iDiv22);
              document.getElementById('q22').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ НОВИХ КЛІЄНТІВ (ЮР.ОСІБ) НА ВІДКРИТТЯ РАХУНКІВ У БАНКУ, У Т.Ч. ДЛЯ РКО';
              

              var iDiv23 = document.createElement('div');
              iDiv23.id = 'q23';
              iDiv23.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q23').before(iDiv23);
              document.getElementById('q23').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ВІДДІЛАМИ KYC, УФМ ТА ІНШИМИ';
              
              
              
              var iDiv31 = document.createElement('div');
              iDiv31.id = 'q31';
              iDiv31.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q31').before(iDiv31);
              document.getElementById('q31').innerHTML = 'ОЦІНІТЬ ВАШЕ ЗНАННЯ/ЗНАННЯ ВАШИХ ПІДЛЕГЛИХ ПРОДУКТУ -  ПРИЙОМ ПЛАТЕЖІВ ВІД НАСЕЛЕННЯ';
              
              
              var iDiv32 = document.createElement('div');
              iDiv32.id = 'q32';
              iDiv32.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q32').before(iDiv32);
              document.getElementById('q32').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ КЛІЄНТІВ НА ЦЕЙ ПРОДУКТ';
              
              
              
              var iDiv33 = document.createElement('div');
              iDiv33.id = 'q33';
              iDiv33.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q33').before(iDiv33);
              document.getElementById('q33').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ДЕПАРТАМЕНТОМ РОЗВИТКУ РОЗРАХУНКОВИХ ОПЕРАЦІЙ ТА ДЕПОЗИТНИХ ПРОДУКТІВ, УФМ, ОПЕРАЦІЙНИМ ДЕПАРТАМЕНТОМ ТОЩО, ДЛЯ ВИРІШЕННЯ СКЛАДНИХ ПИТАНЬ ПО КЛІЄНТУ';
              
              
              
              var iDiv41 = document.createElement('div');
              iDiv41.id = 'q41';
              iDiv41.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q41').before(iDiv41);
              document.getElementById('q41').innerHTML = 'ОЦІНІТЬ ВАШЕ ЗНАННЯ/ЗНАННЯ ВАШИХ ПІДЛЕГЛИХ ПРОДУКТУ -  СТРОКОВІ ДЕПОЗИТИ ФІЗ ОСІБ';
              
              
              var iDiv42 = document.createElement('div');
              iDiv42.id = 'q42';
              iDiv42.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q42').before(iDiv42);
              document.getElementById('q42').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ТА ПОСТІЙНУ ЩОДЕННУ РОБОТУ ПО ЗАЛУЧЕННЮ КЛІЄНТІВ НА ЦЕЙ ПРОДУКТ';
              
              
              
              var iDiv43 = document.createElement('div');
              iDiv43.id = 'q43';
              iDiv43.setAttribute('style', 'text-align: center;margin: 2px;font-size: 1.0rem;font-weight: bold;color:#D22B2B');
              
              document.getElementById('q43').before(iDiv43);
              document.getElementById('q43').innerHTML = 'ОЦІНІТЬ ВАШЕ ВМІННЯ/ВМІННЯ ВАШИХ ПІДЛЕГЛИХ ЗДІЙСНЮВАТИ КОМУНІКАЦІЮ ПО ЦЬОМУ НАПРЯМУ В СЕРЕДИНІ БАНКУ, З ДЕПАРТАМЕНТОМ РОЗВИТКУ РОЗРАХУНКОВИХ ОПЕРАЦІЙ ТА ДЕПОЗИТНИХ ПРОДУКТІВ, УФМ, ОПЕРАЦІЙНИМ ДЕПАРТАМЕНТОМ  ТОЩО, ДЛЯ ВИРІШЕННЯ СКЛАДНИХ ПИТАНЬ ПО КЛІЄНТУ';
              
              
          </script>
          
          "
                         )
                       ),
                       
                       
                       tags$body(tags$style("#submit {color: white;background-color: grey;} ")),
                       tags$body(tags$style("#survey-title {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
                       tags$body(tags$style("#survey-title1 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
                       tags$body(tags$style("#survey-title2 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
                       tags$body(tags$style("#survey-title3 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
                       tags$body(tags$style("#survey-title4 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
                       tags$body(tags$style("#survey-title8 {text-align: center;margin-top: 20px;margin-bottom: 12px;} ")),
                       tags$body(tags$style("#survey-description1 {text-align: center;margin: 2px;font-size: 1.6rem;font-weight: bold;} ")),
                       tags$body(tags$style("#survey-description2 {text-align: center;margin: 2px;font-size: 1.6rem;font-weight: bold;} ")),
                       tags$body(tags$style("#survey-description3 {text-align: center;margin: 2px;font-size: 1.6rem;font-weight: bold;} ")),
                       tags$body(tags$style("#survey-description4 {text-align: center;margin: 2px;font-size: 1.6rem;font-weight: bold;} ")),
                       tags$body(tags$style("#survey-description8 {text-align: center;margin: 2px;font-size: 1.6rem;font-weight: bold;} ")),
                       tags$body(tags$style("table {font-size: 10px;} ")),
                       tags$head(tags$style("input[type=radio] {accent-color: red;}")),
                       tags$head(tags$style(".radio span {font-size: 1.1rem;}")),
                       tags$head(tags$style(".control-label {font-size: 1.3rem;color:#C41E3A}")),
                       
)

server <- function(input, output, session) {
  shinysurveys::renderSurvey()
  change_window_title(session, "Опитування")
  flashing_window_title( session, "Акордбанк", inactive_only = TRUE, interval = 1000 )
  
  observeEvent(input$submit, {
    
    showModal(modalDialog(footer = NULL,
                          title = "Ваші відповіді надіслано! Дякуємо за участь в опитуванні!",
                          #"You can customize what actions happen when a user finishes a survey using input$submit."
    ))
    
    print("clicked save!!!")
    
    final_data <- getSurveyData()
    final_data$date <- Sys.Date()
    
    final_data <- subset(final_data, select = -question_type)
    final_data <- subset(final_data, select = -subject_id)
    final_data$question_id <- gsub("'", "`", final_data$question_id)
    final_data$response <- gsub("'", "`", final_data$response)
    View(final_data)
    #write.csv2(final_data,sep = ";",file = "d:/XML/111111111111111111111111.csv")
    
    ssql <- "INSERT INTO results_rb (question_id, response, date) "
    
    for(i in 1:nrow(final_data)) {
      data <- DBI::dbGetQuery(pool,  paste0(ssql,"VALUES('", final_data$question_id[i],"','", substr(final_data$response[i],1,1000), "','", final_data$date[i],"')"))
      #data <- DBI::dbGetQuery(pool,  paste0(ssql,"VALUES('", questions$question[i],"','", questions$option[i], "','", Sys.Date(),"')"))
      #print(paste0(ssql,"VALUES('", final_data$question_id[i],"','", final_data$response[i], "','", final_data$date[i],"')"))
      }
    
  })
  
  observeEvent(input$PIB, {
    validate(need(input$PIB, 'Check at least one letter!'),)
  })
  
  
}

shiny::shinyApp(ui = ui, server = server)