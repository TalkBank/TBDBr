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





#' @title Determine if user's attempted targetPath exists in pathTree.
#' @description This helper function can be used by other functions to validate user 'corpora' parameter values passed to the query functions.
#' @param targetPath Vector of strings representing path to validate in pathTree.
#' @param pathTree The tree of folder and file paths (value from getPathTrees()).
#' @export
#' @examples
#' validPath(c('respMsg', 'childes', 'childes', 'Clinical'));
#'
#' validPath(c('respMsg', 'childes', 'childes', 'somethingThatDoesNotExist'));
validPath <- function(targetPath, pathTree=getPathTrees()) {
  # Successfully walked down targetPath in pathTree.
  if(length(targetPath) == 0) {
    return(TRUE);
  }

  # If targetPath so far is valid, continue down path.
  if(exists(targetPath[1], where=pathTree)) {
    validPath(targetPath[-1], pathTree[[targetPath[1]]]);
  }
  else {
    print(paste('Invalid path at: ', targetPath[1]));
    return(FALSE);
  }
}


