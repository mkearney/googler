
<!-- README.md is generated from README.Rmd. Please edit that file -->

# googler <img src='man/figures/logo.png' align="right" height="200" />

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/mkearney/googler.svg?branch=master)](https://travis-ci.org/mkearney/googler)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mkearney/googler?branch=master&svg=true)](https://ci.appveyor.com/project/mkearney/googler)
<!-- badges: end -->

This is a wrapper around the [‘googler’ command line
tool](https://github.com/jarun/googler).

## Requirements

Python 3 must be installed and locatable

## Installation

You can install the development version of {googler} from
[Github](https://github.com/mkearney/googler) with:

``` r
remotes::install_github("mkearney/googler")
```

<!-- You can install the released version of googler from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("googler") -->

<!-- ``` -->

## Examples

Search google with various options to specify things like the desired
result **`count`**, google **`news`**, within a range of **`time`**,
from a given **`site`**, etc.

### Example \#1: Basic google search

``` r
## search google for 'rstats'
googler("rstats")
#> # A tibble: 10 x 4
#>    abstract                        matches    title            url                        
#>    <chr>                           <list>     <chr>            <chr>                      
#>  1 "5h ago @akesslerdc tweeted: \… <df[,2] [… News about #rst… https://twitter.com/hashta…
#>  2 The latest Tweets from Rstats … <df[,2] [… Rstats (@rstats… https://twitter.com/rstats…
#>  3 The R Project for Statistical … <NULL>     The R Project f… https://www.r-project.org/ 
#>  4 Read writing about Rstats in T… <df[,2] [… Rstats – Toward… https://towardsdatascience…
#>  5 Right now I'm building a GLM f… <NULL>     Rstats - Reddit  https://www.reddit.com/r/r…
#>  6 This function is used to calcu… <NULL>     rstats function… https://www.rdocumentation…
#>  7 Jun 24, 2019 ... GitHub is whe… <NULL>     rstats · GitHub… https://github.com/topics/…
#>  8 Read writing about Rstats in l… <df[,2] [… Rstats – learn … https://blog.exploratory.i…
#>  9 Jul 24, 2019 ... Welcome to RS… <df[,2] [… RStats Institut… https://www.missouristate.…
#> 10 Today I pushed a preliminary v… <NULL>     Rstats - Once U… https://www.onceupondata.c…
```

### Example \#2: Advanced google search

``` r
## search google for 100 'rstats' or "R language" hits in English in past year
googler("rstats OR \"R language\"", count = 100, time = "y1", lang = "en")
#> # A tibble: 97 x 5
#>    abstract                   matches   title               url                   metadata
#>    <chr>                      <list>    <chr>               <chr>                 <chr>   
#>  1 "5h ago @akesslerdc tweet… <df[,2] … News about #rstats… https://twitter.com/… <NA>    
#>  2 Right now I'm building a … <NULL>    Rstats - Reddit     https://www.reddit.c… <NA>    
#>  3 This past year in R has b… <NULL>    My 2018 #rstats ye… https://leonawicz.gi… <NA>    
#>  4 GitHub is where people bu… <NULL>    rstats · GitHub To… https://github.com/t… <NA>    
#>  5 Welcome to RStats Institu… <df[,2] … RStats Institute -… https://www.missouri… <NA>    
#>  6 RStats Glossary. Find def… <df[,2] … Stats Tools - RSta… https://www.missouri… <NA>    
#>  7 Dec 13, 2018 - 77 min - U… <df[,2] … R Programming for … https://www.youtube.… <NA>    
#>  8 Why the R Language? R is … <df[,2] … Why use the R Lang… https://www.burns-st… <NA>    
#>  9 "The view_df() function f… <NULL>    Quickly create Cod… https://www.r-blogge… <NA>    
#> 10 Basically, this book is a… <df[,2] … A Complete Guide t… https://towardsdatas… <NA>    
#> # … with 87 more rows
```

### Example \#3: Search google news

``` r
## search google news for rstats/R language articles in the past three weeks
googler("rstats OR \"R language\"", news = TRUE)
#> # A tibble: 10 x 5
#>    abstract                matches   metadata       title             url                 
#>    <chr>                   <list>    <chr>          <chr>             <chr>               
#>  1 Quartz: How would you … <df[,2] … Quartz, Aug 1… What's next for … https://qz.com/1661…
#>  2 ... R package develope… <df[,2] … Yahoo Finance… R Consortium Com… https://finance.yah…
#>  3 'Brittany Runs a Marat… <NULL>    The Boston Gl… Jillian Bell lac… https://www.bostong…
#>  4 “A broad range of orga… <df[,2] … Datanami, Aug… Is Python Strang… https://www.datanam…
#>  5 ... data visualization… <df[,2] … Neowin, Aug 3… This 2019 Certif… https://www.neowin.…
#>  6 28 R (language) — Gary… <df[,2] … Valdosta Dail… Capsule reviews … https://www.valdost…
#>  7 The R language offers … <df[,2] … Toolbox (blog… Google's AI Plat… https://it.toolbox.…
#>  8 Her favorites are Data… <df[,2] … Quartz, Nov 1… What's the best … https://qz.com/1464…
#>  9 Big-data company Datab… <NULL>    SiliconANGLE … Databricks' MLfl… https://siliconangl…
#> 10 The R language was ori… <df[,2] … IT Jungle, Ap… R Comes To i      https://www.itjungl…
```
