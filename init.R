# init.R
#
# Example R code to install packages if not already installed
#

my_packages = c("shiny", "shinyBS", "shinythemes", "shinydashboard", "shinyauthr", "shinyjs", "shinyWidgets", "shinyFeedback", "shinycssloaders", "dplyr", "tidyr", "openxlsx", "data.table", "RMySQL", "DBI", "pool", "DT", "reactable", "htmltools", "gtrendsR", "highcharter", "lubridate")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))
