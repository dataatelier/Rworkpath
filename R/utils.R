#' Load api token if present. If not append token to .Renviron
#' @param your_company_subdomain Character sring api key
#' @param token Character sring api key
#' @param default_path_to_token Character sring api key
#' @return auth_header
#' @importFrom httr http_error GET  status_code add_headers

workpath_api_token <- function(your_company_subdomain, token, default_path_to_token = "~/.Renviron") {
  if (missing(token)) {
    if (!file.exists(default_path_to_token)) {
      stop("Your are missing a valid .Renviron. Please create ~/.Renviron first")
    }
    token <- Sys.getenv("WORKPATH_TOKEN")
    if (identical(token, "")) {
      stop("No token detected. Please put your key into the .Renviron", call. = FALSE)
    }
  } else {
    auth_header <- httr::add_headers(Authorization = paste("Token", token))
    resp <- httr::GET(your_company_subdomain, auth_header)
    if (httr::http_error(resp)) {
      stop("WORKPATH request failed. Please validate your token.", httr::status_code(resp))
      call. = FALSE
    } else {
      cat(paste0("WORKPATH_TOKEN=", token), append = TRUE, fill = TRUE, file = file.path("~",
        ".Renviron"))
      message("Token has been added to .Renviron")
    }
  }
  return(auth_header)
}

#' Return a dataframe object
#' @param resp jsonlite::fromJSON object
#' @return dataframe#'
#' #' @examples
#' \dontrun{raw_to_dataframe(listOfDataFrames)}
#' @importFrom purrr map
#' @importFrom plyr rbind.fill
#' @importFrom magrittr %>%
#' @importFrom utils globalVariables
#' @examples
raw_to_dataframe <- function(resp) {
  source_df <- resp %>% purrr::map(~data.frame(.)) %>% do.call(plyr::rbind.fill,.)
  return(source_df)
}
