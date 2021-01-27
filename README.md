
<!-- README.md is generated from README.Rmd. Please edit that file -->

# TBDBr

<!-- badges: start -->

[![R-CMD-check](https://github.com/TalkBank/TBDBr/workflows/R-CMD-check/badge.svg)](https://github.com/TalkBank/TBDBr/actions)

<!-- badges: end -->

The goal of the TBDBr package is to provide easy access to TalkBankDB
through an R API.

TalkBank (www.talkbank.org) is a vast collection of audio and video
recordings across more than 50 languages linked to richly annotated
transcriptions. The goal of TalkBank is to foster fundamental research
in the study of human communication with an emphasis on spoken
communication. The collection includes repositories in 14 research
areas, including language development, adult conversation,
multilingualism, and disorders which affect communication. These
collections are freely available to support the research of human
language and communication. TalkBank has been funded by the National
Science Foundation and National Institute of Health since 1999.

TalkBankDB (www.talkbank.org/DB) is a database and set of tools for
exploring TalkBank’s media and transcripts, specify data to be
extracted, and pass these data on to statistical programs for further
analysis. The TBDBr package (TalkBankDataBase - r) provides easy access
to all information within TalkBankDB, including clinical collections.
Clinical Banks are password protected. Visit www.talkbank.org to learn
about gaining access to these collections.

## Installation

You can install the released version of talkbank from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
<<<<<<< HEAD
#devtools::install_github("Talkbank/TBDBr")
=======
# devtools::install_github("Talkbank/TBDBr")
>>>>>>> 92ea190121d59c3246c062a8b730ba7155756497
library(TBDBr)
```

## Functionality

TBDBr allows access to data from TalkBankDB through several functions.
For example, to get a table of utterances from a particular transcript
in the childes/Eng-NA/MacWhinney collection:

``` r
example_utterances <- getUtterances(corpusName = 'childes',
                                    corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'));
#> [1] "Fetching data, please wait..."
#> [1] "Success!"
example_utterances[10:14,]
#>    filename                              path uid who         role postcodes
#> 10  010411a childes/Eng-NA/MacWhinney/010411a   9 CHI Target_Child      NULL
#> 11  010411a childes/Eng-NA/MacWhinney/010411a  10 FAT       Father      NULL
#> 12  010411a childes/Eng-NA/MacWhinney/010411a  11 CHI Target_Child      NULL
#> 13  010411a childes/Eng-NA/MacWhinney/010411a  12 FAT       Father      NULL
#> 14  010411a childes/Eng-NA/MacWhinney/010411a  13 CHI Target_Child      NULL
#>    gems                                         utterance startTime endTime
#> 10 NULL                                      what's that     33.398  33.714
#> 11 NULL                          taperecorder over there     33.714  34.884
#> 12 NULL                                               hm     34.884  35.999
#> 13 NULL do you have some nice little things to say to it     35.999  37.818
#> 14 NULL                                               hi     37.818  38.394
```

The available functions for accessing different data sets are below. The
arguments for each function are documented, which can be accessed by
typing ?functionName (e.g. ?getTranscriots()).

``` r
getTranscripts()
getParticipants()
getTokens()
getTokenTypes()
getUtterances()
getNgrams()
getCQL()
```

Because the options for each talkbank collection and function vary, the
getLegalValues() function can help determine the possible options.
getLegalValues() will interactively return options available at each
level of the database.

``` r
getLegalValues()
```

For troubleshooting, an additional function, validPath(), will return
whether a given path is valid.

``` r
validPath(c('childes', 'childes', 'Clinical'));
#> [1] "Invalid path at:  childes"
#> [1] FALSE
```

If the path is not valid, it will return which level of the query is
incorrect

``` r
validPath(c('childes', 'childes', 'somethingThatDoesNotExist'))
#> [1] "Invalid path at:  childes"
#> [1] FALSE
```

To access clinical collections, use the argument *auth = TRUE*. A pop-up
will ask you to select the clinical bank you are trying to access and to
enter the correct username and password for that database

``` r
aphasia_transcrips <- getTranscripts(corpusName = 'aphasia',
                                     corpora = c('aphasia', 'English', 'Aphasia', 'Adler'),
                                     auth = TRUE);
```

More examples are located
[here](https://talkbank.github.io/TBDBr/articles/example-queries.html)
