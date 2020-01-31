# Description: This script joins cities.rds with city_boundaries.rds

# Author: Isaac Arocha
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters

cities.rds_path <- "/Users/isaacarocha/GitHub/C12/data/cities.rds"

city_boundaries.rds_path <- "/Users/isaacarocha/GitHub/C12/data/city_boundaries.rds"

output_path <-here::here("/data/cities_and_boundaries.rds") 

#===============================================================================

cities <-  read_rds(cities.rds_path)
city_boundaries <- read_rds(city_boundaries.rds_path)

city_boundaries %>% 
  left_join(cities, by = c("city_id" = "GEOID")) %>% 
  write_rds(path = output_path)
