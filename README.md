
<!-- README.md is generated from README.Rmd. Please edit that file -->

# googler <img src='man/figures/logo.png' align="right" height="277.5" />

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

Python3 must be installed and located with the following code:

``` r
Sys.which("python3")
```

## Installation

You can install the development version of {googler} from
[Github](https://github.com/mkearney/googler)
with:

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
#>  1 Looking for teaching material … <df[,2] [… #rstats hashtag… https://twitter.com/hashta…
#>  2 The latest Tweets from Rstats … <df[,2] [… Rstats (@rstats… https://twitter.com/rstats…
#>  3 The R Project for Statistical … <NULL>     R: The R Projec… https://www.r-project.org/ 
#>  4 Read writing about Rstats in T… <df[,2] [… Rstats – Toward… https://towardsdatascience…
#>  5 I'm working with the European … <NULL>     rstats - Reddit  https://www.reddit.com/r/r…
#>  6 This function is used to calcu… <NULL>     rstats function… https://www.rdocumentation…
#>  7 GitHub is where people build s… <NULL>     Topic: rstats ·… https://github.com/topics/…
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
#>  1 Looking for teaching mate… <df[,2] … #rstats hashtag on… https://twitter.com/… <NA>    
#>  2 I'm working with the Euro… <NULL>    rstats - Reddit     https://www.reddit.c… <NA>    
#>  3 This past year in R has b… <NULL>    My 2018 #rstats ye… https://leonawicz.gi… <NA>    
#>  4 Welcome to RStats Institu… <df[,2] … RStats Institute -… https://www.missouri… <NA>    
#>  5 RStats Glossary. Find def… <df[,2] … Stats Tools - RSta… https://www.missouri… <NA>    
#>  6 "The view_df() function f… <NULL>    Quickly create Cod… https://www.r-blogge… <NA>    
#>  7 Why the R Language? R is … <df[,2] … Why use the R Lang… https://www.burns-st… <NA>    
#>  8 Basically, this book is a… <df[,2] … A Complete Guide t… https://towardsdatas… <NA>    
#>  9 This blog on R Programmin… <NULL>    R Programming | Be… https://www.edureka.… <NA>    
#> 10 This trend is of course h… <df[,2] … What is R Programm… https://www.guru99.c… <NA>    
#> # … with 87 more rows
```

### Example \#3: Search google news

``` r
## search google news for rstats/R language articles in the past three weeks
googler("rstats OR \"R language\"", news = TRUE)
#> # A tibble: 10 x 5
#>    abstract                 matches   metadata      title             url                 
#>    <chr>                    <list>    <chr>         <chr>             <chr>               
#>  1 Quartz: How would you d… <df[,2] … Quartz, Aug … What's next for … https://qz.com/1661…
#>  2 ... R package developer… <df[,2] … Yahoo Financ… R Consortium Com… https://finance.yah…
#>  3 'Brittany Runs a Marath… <NULL>    The Boston G… Jillian Bell lac… https://www.bostong…
#>  4 R (Language, drug use, … <df[,2] … The Florida … Movie capsules: … https://www.jackson…
#>  5 “A broad range of organ… <df[,2] … Datanami, Au… Is Python Strang… https://www.datanam…
#>  6 ... data visualization,… <df[,2] … Neowin, Aug … This 2019 Certif… https://www.neowin.…
#>  7 28 R (language) — Gary … <df[,2] … Valdosta Dai… Capsule reviews … https://www.valdost…
#>  8 The R language offers a… <df[,2] … Toolbox (blo… Google's AI Plat… https://it.toolbox.…
#>  9 Cameron admits that ear… <df[,2] … Deadline, 17… 'Terminator: Dar… https://deadline.co…
#> 10 Her favorites are DataC… <df[,2] … Quartz, Nov … What's the best … https://qz.com/1464…
```
