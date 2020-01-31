# Reading in cities.csv from the Eviction Project's online repository on South Carolina

# Author: Isaac Arocha
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters

cities.csv_download_url <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"

file_output_path <- here::here("/data/cities.rds")

vars_types <- 
  cols_only(
    GEOID = col_double(),
    year = col_integer(),
    name = col_character(),
    evictions = col_double(),
  )

#===============================================================================

cities.csv_download_url %>% 
  read_csv(col_types = vars_types) %>% 
  filter(year == 2016) %>% 
  write_rds(path = file_output_path)
