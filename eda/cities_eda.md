Cities EDA
================
Isaac Arocha
2020-01-30

  - [City with the most evictions](#city-with-the-most-evictions)

``` r
# Libraries
library(tidyverse)

# Parameters
cities <- 
  read_rds(here::here("/data/cities.rds"))
```

## City with the most evictions

``` r
cities <- 
  cities %>% 
  select(GEOID, year, name, evictions)

cities %>% 
  arrange(desc(evictions)) %>% 
  top_n(n = 1, wt = evictions)
```

    ## # A tibble: 1 x 4
    ##     GEOID  year name             evictions
    ##     <dbl> <dbl> <chr>                <dbl>
    ## 1 4550875  2016 North Charleston     3660.
