## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  error = FALSE,
  warning = FALSE,
  message = FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(oxcgrt)
library(magrittr)

## ----usage6, echo = FALSE, eval = TRUE----------------------------------------
tab <- codebook[!stringr::str_detect(string = codebook$Name, pattern = "_Flag"), ] %>%
  dplyr::mutate(Name = stringr::str_remove_all(string = Name, pattern = "[A-Z]{1}[0-9]{1}\\_"))

knitr::kable(x = tab)

## ----usage7, echo = FALSE, eval = TRUE----------------------------------------
library(rvest)
library(xml2)

x <- xml2::read_html("https://github.com/OxCGRT/covid-policy-tracker/blob/master/documentation/index_methodology.md") %>%
  rvest::xml_nodes(css = ".markdown-body table") %>%
  rvest::html_table()

x <- data.frame(t(x[[1]]))
tab <- x[3:nrow(x), 1:4]
tab <- data.frame(row.names(tab), tab)
row.names(tab) <- 1:nrow(tab)
names(tab) <- c("ID", "Government response index", "Containment and health index",
                "Stringency index", "Economic support index")

tab <- tab %>%
  dplyr::mutate(`Government response index` = ifelse(`Government response index` == "'x'", "x", `Government response index`),
                `Containment and health index` = ifelse(`Containment and health index` == "'x'", "x", `Containment and health index`))

tab <- codebook[!stringr::str_detect(string = codebook$Name, pattern = "_Flag"), c("ID", "Name")] %>%
  dplyr::mutate(Name = stringr::str_remove_all(string = Name, pattern = "[A-Z]{1}[0-9]{1}\\_")) %>%
  merge(tab, by = "ID")

knitr::kable(x = tab)

## ----usage8, echo = TRUE, eval = FALSE----------------------------------------
#  ## Given the C1 data in indicatorData, calculate C1 sub-index
#  calculate_subindex(indicator_code = indicatorData[1, "indicator"],
#                     value = indicatorData[1, "value"],
#                     flag_value = indicatorData[1, "flag_value"])

## ----usage8a, echo = FALSE, eval = TRUE---------------------------------------
## Given the C1 data in indicatorData, calculate C1 sub-index
calculate_subindex(indicator_code = indicatorData[1, "indicator"], 
                   value = indicatorData[1, "value"], 
                   flag_value = indicatorData[1, "flag_value"])

## ----usage9, echo = TRUE, eval = FALSE----------------------------------------
#  ## Given the indicatorData dataset, calculate all sub-indices
#  indicatorData %>%
#    calculate_subindices(indicator_code = "indicator",
#                         value = "value",
#                         flag_value = "flag_value",
#                         add = TRUE)

## ----usage9a, echo = FALSE, eval = TRUE---------------------------------------
## Given the indicatorData dataset, calculate all sub-indices
indicatorData %>%
  calculate_subindices(indicator_code = "indicator", 
                       value = "value", 
                       flag_value = "flag_value",
                       add = TRUE)

## ----usage10, echo = TRUE, eval = FALSE---------------------------------------
#  indicatorData %>%
#    calculate_subindices(indicator_code = "indicator",
#                         value = "value",
#                         flag_value = "flag_value",
#                         add = FALSE) %>%
#    calculate_index(codes = c(paste("C", 1:8, sep = ""),
#                              paste("E", 1:2, sep = ""),
#                              paste("H", 1:3, sep = ""),
#                              "H6"),
#                    tolerance = 1)

## ----usage10a, echo = FALSE, eval = TRUE--------------------------------------
indicatorData %>%
  calculate_subindices(indicator_code = "indicator",
                       value = "value",
                       flag_value = "flag_value",
                       add = FALSE) %>%
  calculate_index(codes = c(paste("C", 1:8, sep = ""),
                            paste("E", 1:2, sep = ""),
                            paste("H", 1:3, sep = ""),
                            "H6"), 
                  tolerance = 1)

## ----usage11, echo = TRUE, eval = FALSE---------------------------------------
#  indicatorData %>%
#    calculate_subindices(indicator_code = "indicator",
#                         value = "value",
#                         flag_value = "flag_value",
#                         add = FALSE) %>%
#    calculate_gov_response()

## ----usage11a, echo = FALSE, eval = TRUE--------------------------------------
indicatorData %>% 
  calculate_subindices(indicator_code = "indicator",
                       value = "value",
                       flag_value = "flag_value",
                       add = FALSE) %>%
  calculate_gov_response()

## ----usage12, echo = TRUE, eval = FALSE---------------------------------------
#  indicatorData %>%
#    calculate_subindices(indicator_code = "indicator",
#                         value = "value",
#                         flag_value = "flag_value",
#                         add = FALSE) %>%
#    calculate_indices()

## ----usage12a, echo = FALSE, eval = TRUE--------------------------------------
indicatorData %>% 
  calculate_subindices(indicator_code = "indicator",
                       value = "value",
                       flag_value = "flag_value",
                       add = FALSE) %>%
  calculate_indices()

