# Include library for making GET/POST requests.
library(httr);
# Include library for parsing JSON.
library(rjson);


#' @title Test function for talkbankDB query
#'
#' @description This function contains a random set of example queries.
#' @export
#' @examples
#' randomTests()
randomTests <- function() {
  # Get sets of transcripts.
  oneTranscript <- getTranscripts(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney', '010411a')));
  engNAtranscripts <- getTranscripts(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA')));
  engLangTranscripts <- getTranscripts(corpusName = list('childes'), lang = list('eng'));
  allChildesTranscripts <- getTranscripts(corpusName = list('childes'), corpora = list(list('childes')));
  
  # Get participants in MacWhinney set.
  macwParticipants <- getParticipants(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));
  
  # Get tokens (words) from one transcript.
  oneFileTokens <- getTokens(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney', '010411a')));
  
  # Get token types from MacWhinney set.
  macwTokenTypes <- getTokenTypes(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));
  
  # Query for text pattern "my ball" as lemma in MacWhinney set.
  cqlMyBall <- getCQL(cqlArr=list(list(type="lemma", item="my", freq="once"), list(type="lemma", item="ball", freq="once")), corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));
  # Query for lemma "eat" in MacWhinney set.  Matches all forms of "eat": "eat", "eats", "eating", "ate".. 
  cqlEat <- getCQL(cqlArr=list(list(type="lemma", item="eat", freq="once")), corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));
  
  
  # Get English transcripts form homebank.
  engLangHomebankTranscripts <- getTranscripts(corpusName = list('homebank'), lang = list('eng'));
}
