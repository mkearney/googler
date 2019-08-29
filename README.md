
<!-- README.md is generated from README.Rmd. Please edit that file -->

# googler

<!-- badges: start -->

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

### Example \#1: `search_google()`

``` r
## search google for 'rstats'
search_google("rstats")
#> # A tibble: 10 x 4
#>    abstract                        matches    title            url                        
#>    <chr>                           <list>     <chr>            <chr>                      
#>  1 Looking for teaching material … <df[,2] [… #rstats hashtag… https://twitter.com/hashta…
#>  2 The latest Tweets from Rstats … <df[,2] [… Rstats (@rstats… https://twitter.com/rstats…
#>  3 The R Project for Statistical … <NULL>     R: The R Projec… https://www.r-project.org/ 
#>  4 Hello,. Is there an R package … <NULL>     rstats - Reddit  https://www.reddit.com/r/r…
#>  5 Read writing about Rstats in T… <df[,2] [… Rstats – Toward… https://towardsdatascience…
#>  6 This function is used to calcu… <NULL>     rstats function… https://www.rdocumentation…
#>  7 GitHub is where people build s… <NULL>     Topic: rstats ·… https://github.com/topics/…
#>  8 Read writing about Rstats in l… <df[,2] [… Rstats – learn … https://blog.exploratory.i…
#>  9 Jul 24, 2019 ... Welcome to RS… <df[,2] [… RStats Institut… https://www.missouristate.…
#> 10 Today I pushed a preliminary v… <NULL>     Rstats - Once U… https://www.onceupondata.c…

## search google for 100 'rstats' or "R language" hits in past year
search_google("rstats OR \"R language\"", count = 100, time = "y1")
#> # A tibble: 99 x 5
#>    abstract                   matches   title              url                    metadata
#>    <chr>                      <list>    <chr>              <chr>                  <chr>   
#>  1 R Programming Technology … <df[,2] … A Complete Guide … https://towardsdatasc… <NA>    
#>  2 When I pushed spreadsheet… <df[,2] … What's the best w… https://qz.com/146452… <NA>    
#>  3 R is a programming langua… <df[,2] … What is R Program… https://www.guru99.co… <NA>    
#>  4 Whether you're dipping in… <df[,2] … R Programming Lan… https://insights.dice… <NA>    
#>  5 R is a Turing complete la… <df[,2] … R Programming Tut… https://intellipaat.c… <NA>    
#>  6 Introduction. R is an ope… <df[,2] … Introduction and … https://www.xtivia.co… <NA>    
#>  7 Sep 20, 2018 - 7 min - Up… <df[,2] … R vs Python | Bes… https://www.youtube.c… <NA>    
#>  8 The Python vs. R debate r… <df[,2] … R vs. Python: Whi… https://www.techrepub… <NA>    
#>  9 R is one of the most popu… <df[,2] … R Programming | B… https://www.edureka.c… <NA>    
#> 10 Text adventures dominated… <df[,2] … The Secret of Lan… https://www.r-blogger… <NA>    
#> # … with 89 more rows
```

### Example \#2: `search_google_news()`

``` r
## search google news for rstats/R language articles in the past three weeks
search_google_news("rstats OR \"R language\"", time = "w3", exact = TRUE)
#> # A tibble: 10 x 5
#>    abstract                 matches   metadata     title              url                 
#>    <chr>                    <list>    <chr>        <chr>              <chr>               
#>  1 In the case of the wild… <df[,2] … Quartz, Aug… What's next for t… https://qz.com/1661…
#>  2 Reports of the demise o… <df[,2] … Datanami, 2… R Backers Tout Fu… https://www.datanam…
#>  3 But is Python's fame co… <df[,2] … Datanami, A… Is Python Strangl… https://www.datanam…
#>  4 If you are unfamiliar w… <df[,2] … Source, 1 d… Get a handle on p… https://source.colo…
#>  5 28, 2019 /PRNewswire/ -… <df[,2] … Yahoo Finan… R Consortium Comm… https://finance.yah…
#>  6 “Joker” is the latest c… <df[,2] … The Daily C… 'Joker' Gets Rate… https://www.dailyca…
#>  7 In the middle of his ti… <df[,2] … Yahoo Lifes… Pete Davidson Cal… https://www.yahoo.c…
#>  8 103 minutes. (Rated R f… <df[,2] … Buffalo New… Movie openings: '… https://buffalonews…
#>  9 own R-rated “It” (the h… <df[,2] … IndieWire, … 'Joker' Director … https://www.indiewi…
#> 10 (R for violence, bloody… <df[,2] … Albany Time… Movies opening Fr… https://www.timesun…
```
