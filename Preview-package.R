# Steps to preview package:

#1. Download/clone/pull etc from github.
#2. open the 'rproject file' in the talkbank folder
#3. install some necessary packages:
   install.packages(c('devtools', 'roxygen2', 'usethis', 'json',
                      'httr', 'stats', 'prettydoc'))

#4. Load devtools
   library(devtools)

#5. load development version of the package
   load_all()

#6. test package function with your randomTests function:
   randomTests()

#7. you can look at documentation for randomTests like this:
    # - obviously, there's not much to it...
   ?randomTests()

#8. More importantly, you should be able to use any of the package functions:
   macwParticipants <- getParticipants(corpusName = list('childes'),
                                       corpora = list(list('childes', 'Eng-NA', 'MacWhinney')))

#9. And you can check the documentation for each of these functions
   # I've pulled this from your talkbankDB manual and organized it a bit
   ?getParticipants()

#10. Next steps:
   # (1) clarify how to input information for each argument for each function
    # this could be done globally since it's generally the same for each package
    # this should also include a list and description of all options so that it's clear
    # how to access each corpora/lang/media etc. within each function.
        # I'll definitely need some help here
   # (2) tweak the functions so that the inputs can just be the character inputs
    # e.g. 'childes' so they don't require inputting nested lists in lists which
    # I suspect is likely to confuse people and could be handled in the function
        # I can do this
   # (3) Write the overall package description and some other formalities.
    # a lot of this can probably come from the poster you cite on the talkbankDB page
        # I can do most of this with some feedback/input
   # (4) I'm not sure how to access the clinical banks - how to set up the username and password
      # to use the API for Aphasiabank for example. I keep getting an error with the function
      # and I assume that it's likely an authentication issue
   # (5) Include a CLAN tab/function in someway
   # (6) Is the utternaces tab in talkbankDB part of the API? I don't see a function for it
      # but I'm not sure if I'm just missing something
