
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

### Example \#1: `googler()`

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
#>  8 Today I pushed a preliminary v… <NULL>     Rstats - Once U… https://www.onceupondata.c…
#>  9 Read writing about Rstats in l… <df[,2] [… Rstats – learn … https://blog.exploratory.i…
#> 10 Jul 24, 2019 ... Welcome to RS… <df[,2] [… RStats Institut… https://www.missouristate.…

## search google for 100 'rstats' or "R language" hits in past year
googler("rstats OR \"R language\"", count = 100, time = "y1")
#> # A tibble: 97 x 5
#>    abstract                   matches   title               url                   metadata
#>    <chr>                      <list>    <chr>               <chr>                 <chr>   
#>  1 Looking for teaching mate… <df[,2] … #rstats hashtag on… https://twitter.com/… <NA>    
#>  2 Excited to announce that … <NULL>    #Rstats - Twitter … https://twitter.com/… <NA>    
#>  3 I'm working with the Euro… <NULL>    rstats - Reddit     https://www.reddit.c… <NA>    
#>  4 Welcome to RStats Institu… <df[,2] … RStats Institute -… https://www.missouri… <NA>    
#>  5 This past year in R has b… <NULL>    My 2018 #rstats ye… https://leonawicz.gi… <NA>    
#>  6 "The view_df() function f… <NULL>    Quickly create Cod… https://www.r-blogge… <NA>    
#>  7 Why the R Language? R is … <df[,2] … Why use the R Lang… https://www.burns-st… <NA>    
#>  8 Using R language with Ana… <df[,2] … Using R language w… https://docs.anacond… <NA>    
#>  9 Basically, this book is a… <df[,2] … A Complete Guide t… https://towardsdatas… <NA>    
#> 10 This trend is of course h… <df[,2] … What is R Programm… https://www.guru99.c… <NA>    
#> # … with 87 more rows
```

### Example \#2: `googler()`

``` r
## search google news for rstats/R language articles in the past three weeks
googler("rstats OR \"R language\"", news = TRUE, time = "w3", exact = TRUE)
#> # A tibble: 10 x 5
#>    abstract                matches   metadata       title             url                 
#>    <chr>                   <list>    <chr>          <chr>             <chr>               
#>  1 Quartz: How would you … <df[,2] … Quartz, Aug 1… What's next for … https://qz.com/1661…
#>  2 ... that assist R pack… <df[,2] … Yahoo Finance… R Consortium Com… https://finance.yah…
#>  3 'Brittany Runs a Marat… <NULL>    The Boston Gl… Jillian Bell lac… https://www.bostong…
#>  4 “A broad range of orga… <df[,2] … Datanami, Aug… Is Python Strang… https://www.datanam…
#>  5 28 R (language) — Gary… <df[,2] … Valdosta Dail… Capsule reviews … https://www.valdost…
#>  6 Cameron admits that ea… <df[,2] … Deadline, 15 … 'Terminator: Dar… https://deadline.co…
#>  7 The final image of Dav… <NULL>    Detroit Free … David Crosby doc… https://www.freep.c…
#>  8 THIS WEEK. AFTER THE W… <NULL>    The Florida T… Movie capsules: … https://www.jackson…
#>  9 “Be yourself” is a loa… <NULL>    Detroit Free … Ace cast is mast… https://www.freep.c…
#> 10 95 minutes; R (languag… <df[,2] … Deseret News,… Community calend… https://www.deseret…
```
