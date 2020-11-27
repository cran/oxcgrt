## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(oxcgrt)
library(magrittr)

## ----usage1, echo = TRUE, eval = FALSE----------------------------------------
#  get_json_time(from = "2020-06-01") %>% get_data_time()

## ----usage1a, echo = FALSE, eval = TRUE---------------------------------------
get_json_time(from = "2020-06-01") %>% get_data_time()

## ----usage2, echo = TRUE, eval = FALSE----------------------------------------
#  get_json_time() %>% get_data_time()

## ----usage2a, echo = FALSE, eval = TRUE---------------------------------------
get_json_time() %>% get_data_time()

## ----usage3, echo = TRUE, eval = FALSE----------------------------------------
#  get_json_actions(ccode = "AFG",
#                   from = NULL,
#                   to = "2020-06-01") %>%
#    get_data()

## ----usage3a, echo = FALSE, eval = TRUE---------------------------------------
get_json_actions(ccode = "AFG", 
                 from = NULL, 
                 to = "2020-06-01") %>% 
  get_data()

## ----usage4, echo = TRUE, eval = FALSE----------------------------------------
#  get_json_actions(ccode = "AFG",
#                   from = NULL,
#                   to = "2020-06-01") %>%
#    get_data_action()

## ----usage4a, echo = FALSE, eval = TRUE---------------------------------------
get_json_actions(ccode = "AFG", 
                 from = NULL, 
                 to = "2020-06-01") %>% 
  get_data_action()

## ----usage5, echo = TRUE, eval = FALSE----------------------------------------
#  get_json_actions(ccode = c("AFG", "Philippines"),
#                   from = "2020-10-25",
#                   to = "2020-10-31") %>%
#    get_data_actions()

## ----usage5a, echo = FALSE, eval = TRUE---------------------------------------
get_json_actions(ccode = c("AFG", "Philippines"), 
                 from = "2020-10-25", 
                 to = "2020-10-31") %>% 
  get_data_actions()

