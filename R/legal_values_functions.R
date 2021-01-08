#' @title Get legal values
#' @description Prints legal values for each level of talkbankDB
#' @export
#' @examples
#' getLegalValues()
getLegalValues <- function(){
  trees = getPathTrees()
  print('Use this function to get arguments for talkbank functions')
  print('Enter them just as they appear')
  print('Corpus Names: aphasia, asd, biling, ca, childes, class, dementia, fluency,  homebank, phon, rhd, samtale, slabank, tbi')

  var1 = readline("Enter Corpus Name: ")
  languages = names(trees[['respMsg']][[var1]][[var1]])
  print(languages)

  var2 = readline("Enter Language: ")
  group = names(trees[['respMsg']][[var1]][[var1]][[var2]])
  print(group)

  var3 = readline("Enter Corpus: ")
  corpus = names(trees[['respMsg']][[var1]][[var1]][[var2]][[var3]])
  print(corpus)

  var4 = readline("Enter Site: ")
  sites = names(trees[['respMsg']][[var1]][[var1]][[var2]][[var3]][[var4]])
  print(sites)
}





