# Встановлення remotes (для інсталяції з GitHub)
if (!requireNamespace("remotes")) install.packages("remotes")

# Встановлення shinysurveys з GitHub (офіційний репозиторій)
remotes::install_github("jdtrat/shinysurveys")

# Список інших пакетів (без shinysurveys)
my_packages = c(
  "shiny", "shinyBS", "shinythemes", "shinytitle",
  "shinyauthr", "shinyjs", "dplyr", "tidyr", "DT", "lubridate",
  "shinyWidgets", "shinyFeedback", "openxlsx", "RMySQL", "DBI", "pool", "jsonlite"
)

# Функція для встановлення відсутніх пакетів
install_if_missing = function(p) {
  if (!(p %in% rownames(installed.packages()))) {
    install.packages(p)
  }
}

# Встановлення пакетів
invisible(sapply(my_packages, install_if_missing))