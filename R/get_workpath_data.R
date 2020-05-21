if (getRversion() >= "2.15.1") utils::globalVariables(c("."))
#' Use workpath api to query data
#' @param endpoint string:  Endpoint
#' @param your_company_subdomain string: Company subdomain: https://<your-company>.workpath.com/api/v1
#' @param auth_header string: Workpath API token
#' @param raw_data boolean: Raw data to return or not
#' @return dataframe
#' @examples
#' \dontrun{get_workpath_data(endpoint = 'goals?query=become',
# your_company_subdomain = 'https://mycompany.com/api/v1/', token = 'mytoken',
# raw_data = TRUE)}
#' @export
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content

get_workpath_data <- function(your_company_subdomain, endpoint, auth_header = workpath_api_token(),
  raw_data = FALSE) {
  resp <- httr::GET(paste(your_company_subdomain, endpoint, sep = ""), auth_header)
  source_dict <- jsonlite::fromJSON(httr::content(resp, "text"))
  if (raw_data) {
    source_dict
  } else {
    raw_to_dataframe(source_dict)
  }
}
#' Return a dataframe object
#' @param resp jsonlite::fromJSON object
#' @return dataframe
#' @importFrom purrr map
#' @importFrom plyr rbind.fill
#' @importFrom magrittr %>%
#' @importFrom utils globalVariables

raw_to_dataframe <- function(resp) {

  source_df <- resp %>% purrr::map(~data.frame(.)) %>% do.call(plyr::rbind.fill,
    .)
  return(source_df)
}
