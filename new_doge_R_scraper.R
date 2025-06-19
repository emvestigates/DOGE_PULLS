library(httr)
library(jsonlite)
library(dplyr)

scrape_doge_endpoint <- function(api_root, endpoint_str, params) {
  endpoint_json_list <- list()
  p_scrape <- TRUE
  page <- 1
  
  while (p_scrape) {
    # Add page to query parameters
    full_params <- c(params, list(page = page))
    # Make the GET request
    res <- GET(url = paste0(api_root, endpoint_str), query = full_params)
    # Parse response
    res_content <- content(res, as = "text", encoding = "UTF-8")
    res_json <- fromJSON(res_content, flatten = TRUE)
    
    # Extract result and meta
    json_list <- res_json$result[[endpoint_str]]
    endpoint_json_list <- append(endpoint_json_list, list(json_list))
    p_scrape <- page < res_json$meta$pages
    page <- page + 1
  }
  
  # Combine all pages
  df <- bind_rows(endpoint_json_list)
  # Rename column
  df <- rename(df, description_doge = description)
  return(df)
}

scrape_doge <- function() {
  api_root <- "https://api.doge.gov/savings/"
  params <- list(
    sort_by = "date",
    sort_order = "desc",
    per_page = 500
  )
  contract_df <- scrape_doge_endpoint(api_root, "contracts", params)
  grant_df <- scrape_doge_endpoint(api_root, "grants", params)
  property_df <- scrape_doge_endpoint(api_root, "leases", params)
  return(list(contracts = contract_df, grants = grant_df, leases = property_df))
}
result <- scrape_doge()
contract_df <- result$contracts
grant_df <- result$grants
property_df <- result$leases

write.csv(contract_df, "contracts_all.csv")
write.csv(grant_df, "grants_all.csv")
write.csv(property_df, "leases_all.csv")

