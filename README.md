
<!-- README.md is generated from README.Rmd. Please edit that file -->

# usehelp

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

The goal of usehelp is to get help text to use presentation or post.

## Installation

You can install the developing version of usehelp from
[github](https://github.com/mrchypark/usehelp) with:

``` r
remotes::install_github("mrchypark/sendgridr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(usehelp)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
ho <- get_help("tidyr", "unnest")
get_title(ho)
#> [1] "Unnest a list column."
get_usage(ho)
#> [1] "unnest(data, ..., .drop = NA, .id = NULL, .sep = NULL, .preserve = NULL)"
get_description(ho) %>% 
  strsplit("(\\r\\n)+|\\r+|\\n+|\\t+/i") %>% 
  .[[1]]
#> [1] "If you have a list-column, this makes each element of the list its own"  
#> [2] "row. unnest() can handle list-columns that can atomic vectors, lists, or"
#> [3] "data frames (but not a mixture of the different types)."
```
