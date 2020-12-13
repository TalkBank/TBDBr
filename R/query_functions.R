#' @title Get transcript data
#'
#' @description Queries a table where each row represents a transcript matching the query from step 1. Each row has:
#' * Link to view transcript and play any associated media.
#' * Corpus path to transcript.
#' * Media types (audio/video) linked to transcript.
#' * Unique ID for transcript (PID).
#' * Languages spoken. Date recorded.
#' * Design Type.
#' * Activity Type.
#' * Group Type.
#' @param corpusName Name of corpus to query
#' @param corpora Name of corpora(s) to query
#' @param lang Query by Language
#' @param media Query by Media
#' @param age Query by Age
#' @param gender Query by gender
#' @param designType Query by design type
#' @param activityType Query by activity type
#' @param groupType Query by group type
#' @export
#' @examples
#' oneTranscript <- getTranscripts(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney', '010411a')))
getTranscripts <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getTranscriptSummary');

    return( respData );
  }
}


#' @title Get participant data
#'
#' @description Queries a table where each row represents a participant (speaker) listed in a transcript. Each row has:
#' * Link to view transcript and play any associated media.
#' * Corpus path to transcript.
#' * Speaker's ID.
#' * Speaker's name.
#' * Speaker's role.
#' * Speaker's language.
#' * Speaker's age in months.
#' * Speaker's age in Years/Months/Days.
#' * Speaker's gender.
#' * Number of words spoken by speaker.
#' * Number of utterances spoken by speaker.
#' * Average number of words per speaker's utterance.
#' * Median number of words per speaker's utterance.
#' @param corpusName Name of corpus to query
#' @param corpora Name of corpora(s) to query
#' @param lang Query by Language
#' @param media Query by Media
#' @param age Query by Age
#' @param gender Query by gender
#' @param designType Query by design type
#' @param activityType Query by activity type
#' @param groupType Query by group type
#' @export
#' @examples
#' macwParticipants <- getParticipants(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')))
getParticipants <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getParticipantSummary');

    return( respData );
  }
}



#' @title Get token metadata data
#'
#' @description Query a table with all the words from the selected transcripts, one word (token) per row. Each row has:
#' * Link to view transcript and play any associated media.
#' * Corpus path to transcript.
#' * Utterance sequence number (starts at 0).
#' * Word sequence number within utterance (starts at 0).
#' * Speaker's role.
#' * Speaker's ID.
#' * The word (token).
#' * The word's stem.
#' * Part of speech code. (See CHAT manual for descriptions of codes).
#' @param corpusName Name of corpus to query
#' @param corpora Name of corpora(s) to query
#' @param lang Query by Language
#' @param media Query by Media
#' @param age Query by Age
#' @param gender Query by gender
#' @param designType Query by design type
#' @param activityType Query by activity type
#' @param groupType Query by group type
#' @export
#' @examples
#' oneFileTokens <- getTokens(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney', '010411a')))
getTokens <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getTokenSummary');

    return( respData );
  }
}




#' @title Get token type metadata
#'
#' @description Queries a table with all the words from the selected transcripts condensed into "types" based on word form and part of speech. Each row has:
#' * Speaker's role.
#' * The word. Number of occurances of word in selected transcripts.
#' * Part of speech (See CHAT manual for descriptions of codes).
#' * The word's stem.
#' @param corpusName Name of corpus to query
#' @param corpora Name of corpora(s) to query
#' @param lang Query by Language
#' @param media Query by Media
#' @param age Query by Age
#' @param gender Query by gender
#' @param designType Query by design type
#' @param activityType Query by activity type
#' @param groupType Query by group type
#' @export
#' @examples
#' macwTokenTypes <- getTokenTypes(corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')))
getTokenTypes <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getTokenTypes');

    return( respData );
  }
}


#' @title Query CQL
#'
#' @description The "CQL" (Corpus Query Language) tab lets us search for patterns in the selected transcripts. We construct a CQL query by appending words, lemmas, and parts of speech. Under 'Insert' in the CQL tab we assemble a query by specifying and inserting a word, lemma, or part of speech. Inserting a 'Word' matches that exact word. Inserting a part of speech matches a word with that part of speech. Inserting a 'Lemma' matches that word stem. For instance, inserting lemma 'run' matches:
#' * run
#' * running
#' * ran
#' @param corpusName Name of corpus to query
#' @param corpora Name of corpora(s) to query
#' @param lang Query by Language
#' @param media Query by Media
#' @param age Query by Age
#' @param gender Query by gender
#' @param designType Query by design type
#' @param activityType Query by activity type
#' @param groupType Query by group type
#' @export
#' @examples
#' cqlMyBall <- getCQL(cqlArr=list(list(type="lemma", item="my", freq="once"), list(type="lemma", item="ball", freq="once")), corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')))
#' cqlEat <- getCQL(cqlArr=list(list(type="lemma", item="eat", freq="once")), corpusName = list('childes'), corpora = list(list('childes', 'Eng-NA', 'MacWhinney')))
getCQL <- function (cqlArr=NULL, corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(cqlArr=cqlArr, corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'cql');

    return( respData );
  }
}

