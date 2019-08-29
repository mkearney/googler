
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

### Example \#1: Google “\#rstats”

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
```

### Example \#2: Google (up to 100 hits) in past year for “\#rstats”

``` r
## search google for 100 'rstats' hits in past year
search_google("rstats", count = 100, time = "y1")
#> # A tibble: 99 x 4
#>    abstract                      matches    title                 url                     
#>    <chr>                         <list>     <chr>                 <chr>                   
#>  1 Looking for teaching materia… <df[,2] [… #rstats hashtag on T… https://twitter.com/has…
#>  2 Excited to announce that I'v… <NULL>     #Rstats - Twitter Se… https://twitter.com/sea…
#>  3 Hello,. Is there an R packag… <NULL>     rstats - Reddit       https://www.reddit.com/…
#>  4 Welcome to RStats Institute!… <df[,2] [… RStats Institute - M… https://www.missourista…
#>  5 RStats Glossary. Find defini… <df[,2] [… Stats Tools - RStats… https://www.missourista…
#>  6 This past year in R has been… <NULL>     My 2018 #rstats year… https://leonawicz.githu…
#>  7 Rstats. Working with sparse … <df[,2] [… Rstats | GGVY         https://ggvy.cl/tags/rs…
#>  8 A Modern and Flexible Neo4J … <df[,2] [… neo4j-rstats/neo4r: … https://github.com/neo4…
#>  9 List of courses teaching R. … <df[,2] [… rstudio-education/rs… https://github.com/rstu…
#> 10 "The view_df() function from… <NULL>     Quickly create Codep… https://www.r-bloggers.…
#> # … with 89 more rows
```

### Example \#3: Search google NEWS for rstats/R language articles in the past 3 weeks

``` r
## search google news for rstats/R language articles in the past three weeks
search_google_news("rstats OR \"R language\"", time = "w3", exact = TRUE)
#> # A tibble: 10 x 5
#>    abstract                 matches   metadata     title              url                 
#>    <chr>                    <list>    <chr>        <chr>              <chr>               
#>  1 In the case of the wild… <df[,2] … Quartz, Aug… What's next for t… https://qz.com/1661…
#>  2 Reports of the demise o… <df[,2] … Datanami, 1… R Backers Tout Fu… https://www.datanam…
#>  3 But is Python's fame co… <df[,2] … Datanami, A… Is Python Strangl… https://www.datanam…
#>  4 If you are unfamiliar w… <df[,2] … Source, 23 … Get a handle on p… https://source.colo…
#>  5 28, 2019 /PRNewswire/ -… <df[,2] … Yahoo Finan… R Consortium Comm… https://finance.yah…
#>  6 “Joker” is the latest c… <df[,2] … The Daily C… 'Joker' Gets Rate… https://www.dailyca…
#>  7 In the middle of his ti… <df[,2] … Yahoo Lifes… Pete Davidson Cal… https://www.yahoo.c…
#>  8 103 minutes. (Rated R f… <df[,2] … Buffalo New… Movie openings: '… https://buffalonews…
#>  9 own R-rated “It” (the h… <df[,2] … IndieWire, … 'Joker' Director … https://www.indiewi…
#> 10 (R for violence, bloody… <df[,2] … Albany Time… Movies opening Fr… https://www.timesun…
```
