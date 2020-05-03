#' @title configuration file
#' @description Configuration file holding environment variables
#' @return list object containing configuration
#'
#' @export

configuration <- function() {
  configuration <- list(WORKPATH = list(TOKEN = get_sys_env("WORKPATH_TOKEN")))}
