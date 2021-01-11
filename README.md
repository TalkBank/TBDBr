
<!-- README.md is generated from README.Rmd. Please edit that file -->

# talkbank

<!-- badges: start -->

[![R-CMD-check](https://github.com/rbcavanaugh/talkbank/workflows/R-CMD-check/badge.svg)](https://github.com/rbcavanaugh/talkbank/actions)
<!-- badges: end -->

The goal of talkbank is to provide easy access to talkbankDB through an
R api.

## Installation

You can install the released version of talkbank from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
# devtools::install_github("rbcavanaugh/talkbank")
library(talkbank)
```

## Functionality

talkbank allows you to access data from talkbank.org through several
functions. For example, you can access the utterances for a participant
in the child language component of talkbank.org:

``` r
example_utterances <- getUtterances(corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'));
#> [1] "Fetching data, please wait..."
#> [1] "Success!"
example_utterances[1:5,]
#>   filename                              path uid who   role postcodes gems
#> 1  010411a childes/Eng-NA/MacWhinney/010411a   0 FAT Father      NULL NULL
#> 2  010411a childes/Eng-NA/MacWhinney/010411a   1 FAT Father      NULL NULL
#> 3  010411a childes/Eng-NA/MacWhinney/010411a   2 FAT Father      NULL NULL
#> 4  010411a childes/Eng-NA/MacWhinney/010411a   3 FAT Father      NULL NULL
#> 5  010411a childes/Eng-NA/MacWhinney/010411a   4 FAT Father      NULL NULL
#>                 utterance startTime endTime
#> 1   wanna give me a kiss       20.6  22.419
#> 2 come on give me a kiss     22.419  23.367
#> 3 come on give me a kiss     23.367  24.481
#> 4 give your daddy a kiss     24.481  25.596
#> 5            mm nice fiu     25.596  29.933
```

The available functions for accessing different datatypes are:

``` r
getTranscripts()
getParticipants()
getTokens()
getUtterances()
getNgrams()
getTokenTypes()
getCQL()
```

These arguments for each function are documented, which can be accessed
by typing ?functionName (e.g. ?getTranscriots()). Two helper functions
are available to describe the arguments available for each function.
getLegalValues() describes options available at each level of the
database. validPath() will return whether or not a given path is valid,
and where it is incorrect if applicable.

``` r
getLegalValues()
```

Currently, talkpath only works for non-clinical banks at talkbank.org.
For access to the clinical banks (e.g. aphaisaBank, dementiaBank), use
talkbankDB.org.
