#' @title get_sys_env is a wrapper around Sys.getenv. Checks if variables are available via Sys.getenv in .Renvorin(.site)
#' https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/
#' @description Checks if output of Sys.getenv corresponds to empty string ''
#' @param credvar Sys.getenv input
#' @return Sys.getenv output or error message

get_constants <- function(credvar) {
  tryCatch({
    var = system.file("enums", "enums.R",package =  "Rworkpath")
    return(ifelse(identical(var, ""), stop(message("Error: Sys.Var ", credvar, " cannot be found")),
                  var))
  }, error = function(error_message) {
    message("please check your start up variables(in .Renviron(.site) & .Rprofile)")
  })
}
