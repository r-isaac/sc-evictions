# This script reads in the city boundaries for the cities specified in the eviction data on South Carolina.

# Author: Isaac Arocha
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(sf)

# Parameters

cities.geojson_download_url <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"

file_output_path <- here::here("/data/city_boundaries.rds")


vars <- 
  c(
    city_id = "GEOID",
    city_name = "n"
  )

#===============================================================================

cities.geojson_download_url %>% 
  read_sf() %>% 
  select(vars) %>% 
  mutate(city_id = as.integer(city_id)) %>% 
  write_rds(path = file_output_path)
  
