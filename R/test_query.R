# A set of example queries for API function.
randomTests <- function() {
  # One file.
  zoneFileQuery <- list(queryVals = list(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney', '010411a')), media = list('audio'), lang = list(), gender = list(), age = list(), designType = list(), activityType = list(), groupType = list()));
  # All Macwhinney.
  allMacwQuery <- list(queryVals = list(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')), media = list('audio'), lang = list(), gender = list(), age = list(), designType = list(), activityType = list(), groupType = list()));


  oneTranscript <- getTranscripts(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney', '010411a')));
  engNAtranscripts <- getTranscripts(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA')));
  engLangTranscripts <- getTranscripts(corpusName = list('childes'), lang = list('eng'));
  allChildesTranscripts <- getTranscripts(corpusName = list('childes'), corpora = list(list('childes')));
  aphasiaTranscript <- getTranscripts(corpusName = list('aphasia'), corpora = list(list('aphasia', 'English', 'Aphasia', 'Adler')));


  macwParticipants <- getParticipants(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));

  oneFileTokens <- getTokens(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney', '010411a')));

  macwTokenTypes <- getTokenTypes(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));

  cqlMyBall <- getCQL(cqlArr=list(list(type="lemma", item="my", freq="once"), list(type="lemma", item="ball", freq="once")), corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));
  cqlEat <- getCQL(cqlArr=list(list(type="lemma", item="eat", freq="once")), corpusName = list('childdes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')));

  engLangHomebankTranscripts <- getTranscripts(corpusName = list('homebank'), lang = list('eng'));
}
