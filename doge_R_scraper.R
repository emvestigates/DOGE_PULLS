#set up requirements
library(plyr)
library(dplyr)
library(jsonlite)

#scrape contracts
contracts <- fromJSON("https://api.doge.gov/savings/contracts?page=1&per_page=500", flatten=TRUE)
contracts_df <- ldply(contracts, data.frame)
contracts2 <- fromJSON("https://api.doge.gov/savings/contracts?page=2&per_page=500", flatten=TRUE)
contracts_df2 <- ldply(contracts2, data.frame)
contracts3 <- fromJSON("https://api.doge.gov/savings/contracts?page=3&per_page=500", flatten=TRUE)
contracts_df3 <- ldply(contracts3, data.frame)
contracts4 <- fromJSON("https://api.doge.gov/savings/contracts?page=4&per_page=500", flatten=TRUE)
contracts_df4 <- ldply(contracts4, data.frame)
contracts5 <- fromJSON("https://api.doge.gov/savings/contracts?page=5&per_page=500", flatten=TRUE)
contracts_df5 <- ldply(contracts5, data.frame)
contracts6 <- fromJSON("https://api.doge.gov/savings/contracts?page=6&per_page=500", flatten=TRUE)
contracts_df6 <- ldply(contracts6, data.frame)
contracts7 <- fromJSON("https://api.doge.gov/savings/contracts?page=7&per_page=500", flatten=TRUE)
contracts_df7 <- ldply(contracts7, data.frame)
contracts8 <- fromJSON("https://api.doge.gov/savings/contracts?page=8&per_page=500", flatten=TRUE)
contracts_df8 <- ldply(contracts8, data.frame)
contracts9 <- fromJSON("https://api.doge.gov/savings/contracts?page=9&per_page=500", flatten=TRUE)
contracts_df9 <- ldply(contracts9, data.frame)
contracts10 <- fromJSON("https://api.doge.gov/savings/contracts?page=10&per_page=500", flatten=TRUE)
contracts_df10 <- ldply(contracts10, data.frame)
contracts11 <- fromJSON("https://api.doge.gov/savings/contracts?page=11&per_page=500", flatten=TRUE)
contracts_df11 <- ldply(contracts11, data.frame)
contracts12 <- fromJSON("https://api.doge.gov/savings/contracts?page=12&per_page=500", flatten=TRUE)
contracts_df12 <- ldply(contracts12, data.frame)
contracts13 <- fromJSON("https://api.doge.gov/savings/contracts?page=13&per_page=500", flatten=TRUE)
contracts_df13 <- ldply(contracts13, data.frame)
contracts14 <- fromJSON("https://api.doge.gov/savings/contracts?page=14&per_page=500", flatten=TRUE)
contracts_df14 <- ldply(contracts14, data.frame)
contracts15 <- fromJSON("https://api.doge.gov/savings/contracts?page=15&per_page=500", flatten=TRUE)
contracts_df15 <- ldply(contracts15, data.frame)

#combine contracts
contracts_all <- contracts_df %>% 
  bind_rows(contracts_df2) %>%
  bind_rows(contracts_df3) %>%
  bind_rows(contracts_df4) %>%
  bind_rows(contracts_df5) %>%
  bind_rows(contracts_df6) %>%
  bind_rows(contracts_df7) %>%
  bind_rows(contracts_df8) %>%
  bind_rows(contracts_df9) %>%
  bind_rows(contracts_df10) %>%
  bind_rows(contracts_df11) %>%
  bind_rows(contracts_df12) %>%
  bind_rows(contracts_df13) %>%
  bind_rows(contracts_df14) %>%
  bind_rows(contracts_df15) 

#scrape grants

grants <- fromJSON("https://api.doge.gov/savings/grants?page=1&per_page=500", flatten=TRUE)
grants_df <- ldply(grants, data.frame)
grants2 <- fromJSON("https://api.doge.gov/savings/grants?page=2&per_page=500", flatten=TRUE)
grants_df2 <- ldply(grants2, data.frame)
grants3 <- fromJSON("https://api.doge.gov/savings/grants?page=3&per_page=500", flatten=TRUE)
grants_df3 <- ldply(grants3, data.frame)
grants4 <- fromJSON("https://api.doge.gov/savings/grants?page=4&per_page=500", flatten=TRUE)
grants_df4 <- ldply(grants4, data.frame)
grants5 <- fromJSON("https://api.doge.gov/savings/grants?page=5&per_page=500", flatten=TRUE)
grants_df5 <- ldply(grants5, data.frame)
grants6 <- fromJSON("https://api.doge.gov/savings/grants?page=6&per_page=500", flatten=TRUE)
grants_df6 <- ldply(grants6, data.frame)
grants7 <- fromJSON("https://api.doge.gov/savings/grants?page=7&per_page=500", flatten=TRUE)
grants_df7 <- ldply(grants7, data.frame)
grants8 <- fromJSON("https://api.doge.gov/savings/grants?page=8&per_page=500", flatten=TRUE)
grants_df8 <- ldply(grants8, data.frame)
grants9 <- fromJSON("https://api.doge.gov/savings/grants?page=9&per_page=500", flatten=TRUE)
grants_df9 <- ldply(grants9, data.frame)
grants10 <- fromJSON("https://api.doge.gov/savings/grants?page=10&per_page=500", flatten=TRUE)
grants_df10 <- ldply(grants10, data.frame)
grants11 <- fromJSON("https://api.doge.gov/savings/grants?page=11&per_page=500", flatten=TRUE)
grants_df11 <- ldply(grants11, data.frame)
grants12 <- fromJSON("https://api.doge.gov/savings/grants?page=12&per_page=500", flatten=TRUE)
grants_df12 <- ldply(grants12, data.frame)
grants13 <- fromJSON("https://api.doge.gov/savings/grants?page=13&per_page=500", flatten=TRUE)
grants_df13 <- ldply(grants13, data.frame)
grants14 <- fromJSON("https://api.doge.gov/savings/grants?page=14&per_page=500", flatten=TRUE)
grants_df14 <- ldply(grants14, data.frame)
grants15 <- fromJSON("https://api.doge.gov/savings/grants?page=15&per_page=500", flatten=TRUE)
grants_df15 <- ldply(grants15, data.frame)
grants16 <- fromJSON("https://api.doge.gov/savings/grants?page=16&per_page=500", flatten=TRUE)
grants_df16 <- ldply(grants16, data.frame)
grants17 <- fromJSON("https://api.doge.gov/savings/grants?page=17&per_page=500", flatten=TRUE)
grants_df17 <- ldply(grants17, data.frame)
grants18 <- fromJSON("https://api.doge.gov/savings/grants?page=18&per_page=500", flatten=TRUE)
grants_df18 <- ldply(grants18, data.frame)
grants19 <- fromJSON("https://api.doge.gov/savings/grants?page=19&per_page=500", flatten=TRUE)
grants_df19 <- ldply(grants19, data.frame)

#combine grants
grants_all <- grants_df %>% 
  bind_rows(grants_df2) %>%
  bind_rows(grants_df3) %>%
  bind_rows(grants_df4) %>%
  bind_rows(grants_df5) %>%
  bind_rows(grants_df6) %>%
  bind_rows(grants_df7) %>%
  bind_rows(grants_df8) %>%
  bind_rows(grants_df9) %>%
  bind_rows(grants_df10) %>%
  bind_rows(grants_df11) %>%
  bind_rows(grants_df12) %>%
  bind_rows(grants_df13) %>%
  bind_rows(grants_df14) %>%
  bind_rows(grants_df15) %>%
  bind_rows(grants_df16) %>%
  bind_rows(grants_df17) %>%
  bind_rows(grants_df18) %>%
  bind_rows(grants_df19)

#scrape leases
leases <- fromJSON("https://api.doge.gov/savings/leases?page=1&per_page=500", flatten=TRUE)
leases_df <- ldply(leases, data.frame)
leases2 <- fromJSON("https://api.doge.gov/savings/leases?page=2&per_page=500", flatten=TRUE)
leases_df2 <- ldply(leases2, data.frame)

#combine leases
leases_all <- leases_df %>% bind_rows(leases_df2) 

#remove API metadata
drops <- c(".id","X..i..","total_results","pages")
contracts_all <- subset(contracts_all, contracts_all$.id == "result") 
contracts_all <- contracts_all[ , !(names(contracts_all) %in% drops)] %>% mutate(dt_scrape = c(Sys.Date())) %>% rename(fpds_link = contracts.fpds_link)
grants_all <- subset(grants_all, grants_all$.id == "result")
grants_all <- grants_all[ , !(names(grants_all) %in% drops)] %>% mutate(dt_scrape = c(Sys.Date()))
leases_all <- subset(leases_all, leases_all$.id == "result")
leases_all <- leases_all[ , !(names(leases_all) %in% drops)] %>% mutate(dt_scrape = c(Sys.Date()))

write.csv(contracts_all, "contracts_all.csv")
write.csv(grants_all, "grants_all.csv")
write.csv(leases_all, "leases_all.csv")
