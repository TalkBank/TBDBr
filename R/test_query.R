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
#'
#'
randomTests <- function() {
  # Get sets of transcripts.
  oneTranscript <- getTranscripts(corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'));
  engNAtranscripts <- getTranscripts(corpusName = 'childes', corpora = c('childes', 'Eng-NA'));
  engLangTranscripts <- getTranscripts(corpusName = 'childes', lang = 'eng');
  allChildesTranscripts <- getTranscripts(corpusName = 'childes', corpora = 'childes');

  # Get participants in MacWhinney set.
  macwParticipants <- getParticipants(corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney'));

  # Get tokens (words) from one transcript.
  oneFileTokens <- getTokens(corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'));

  # Get utterances from one transcript.
  oneFileUtterances <- getUtterances(corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'));

  oneFileUtterances <- getUtterances(corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'));

  # Get 3-grams of words from one transcript.
  nGrams <- getNgrams(nGram=c("3", "word"), corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'));

  # Get token types from MacWhinney set.
  macwTokenTypes <- getTokenTypes(corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney'));

  # Query for text pattern "my ball" as lemma in MacWhinney set.
  cqlMyBall <- getCQL(cqlArr=list(list(type="lemma", item="my", freq="once"), list(type="lemma", item="ball", freq="once")), corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney'));
  # Query for lemma "eat" in MacWhinney set.  Matches all forms of "eat": "eat", "eats", "eating", "ate"..
  cqlEat <- getCQL(cqlArr=list(list(type="lemma", item="eat", freq="once")), corpusName = 'childes', corpora = c('childes', 'Eng-NA', 'MacWhinney'));

  # Get English transcripts form homebank.
  engLangHomebankTranscripts <- getTranscripts(corpusName = 'homebank', lang = 'eng');


  # Without auth=TRUE, returns nothing.
  protectedTranscripts <- getTranscripts(corpusName = 'aphasia', corpora = list(list('aphasia', 'English', 'Aphasia', 'Adler')));
  # With auth=TRUE, returns transcript list if user auth succeeds.
  protectedTranscripts <- getTranscripts(corpusName = 'aphasia', corpora = list(list('aphasia', 'English', 'Aphasia', 'Adler')), auth=TRUE);

  # Get 3-grams of words from protected corpora.
  protectedNgrams <- getNgrams(nGram=list(size="3", type="word"), corpusName = 'aphasia', corpora = list(list('aphasia', 'English', 'Aphasia', 'Adler')), auth=TRUE );
}
