# Include library for making GET/POST requests.
library(httr);
# Include library for parsing JSON.
library(rjson);


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
#' @param corpusName Name of corpus to query.  For example, to search within the childes corpus, corpus="childes".  Note this is a character string value (not a list).  Legal values are 'aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', and 'tbi'.
#' @param corpora Name of corpus/corporas to query.  This is a path starting with the corpus name followed by subfolder names leading to a folder for which all transcripts beneath it will be queried.  For example, to query all transripts in the MacWhinney and Brown corpus: corpora = list(list('childes', 'Eng-NA', 'MacWhinney'), list('childes', 'Eng-NA', 'Brown')).  Legal values can be found by searching the TalkBank browser: https://sla.talkbank.org/TBB.
#' @param lang Query by language.  For example, to get transcripts that contain both English and Spanish: lang=list("eng", "spa"). Legal values: 3-letter language codes based on the ISO 639-3 standard.
#' @param media Query by media type.  For example, to get transcripts with an associated video recording: media=list("video").  Legal values: "audio" or "video".
#' @param age Query by participant month age range.  For example, to get transcripts with target participants who are either 3-12 or 14-18 months old: age=list(list(from="3", to="12"), list(from="14", to="18")).  Legal values: integer month ages.
#' @param gender Query by participant gender. For example, to get transcripts with female target participants: gender=list("female").  Legal values: "female" or "male".
#' @param designType Query by design type.  For example, to get transcripts from a longitudinal study: designType=list("long")  Legal values are "long" for longitudinal studies, "cross" for cross-sectional studies. 
#' @param activityType Query by activity type.  For example, to get transcripts where the target particpant is engaged in toy play: activityType=list("toyplay").  See the CHAT manual for legal values.
#' @param groupType Query by group type.   For example, to get transcripts where the target particpant is hearing limited: groupType=list("HL").  See the CHAT manual for legal values.
#' @export
#' @examples
#' getTranscripts(corpusName = 'childes',
#'                corpora = list(list('childes',
#'                                    'Eng-NA',
#'                                    'MacWhinney')))
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
#' @param corpusName Name of corpus to query.  For example, to search within the childes corpus, corpus="childes".  Note this is a character string value (not a list).  Legal values are 'aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', and 'tbi'.
#' @param corpora Name of corpus/corporas to query.  This is a path starting with the corpus name followed by subfolder names leading to a folder for which all transcripts beneath it will be queried.  For example, to query all transripts in the MacWhinney and Brown corpus: corpora = list(list('childes', 'Eng-NA', 'MacWhinney'), list('childes', 'Eng-NA', 'Brown')).  Legal values can be found by searching the TalkBank browser: https://sla.talkbank.org/TBB.
#' @param lang Query by language.  For example, to get transcripts that contain both English and Spanish: lang=list("eng", "spa"). Legal values: 3-letter language codes based on the ISO 639-3 standard.
#' @param media Query by media type.  For example, to get transcripts with an associated video recording: media=list("video").  Legal values: "audio" or "video".
#' @param age Query by participant month age range.  For example, to get transcripts with target participants who are either 3-12 or 14-18 months old: age=list(list(from="3", to="12"), list(from="14", to="18")).  Legal values: integer month ages.
#' @param gender Query by participant gender. For example, to get transcripts with female target participants: gender=list("female").  Legal values: "female" or "male".
#' @param designType Query by design type.  For example, to get transcripts from a longitudinal study: designType=list("long")  Legal values are "long" for longitudinal studies, "cross" for cross-sectional studies. 
#' @param activityType Query by activity type.  For example, to get transcripts where the target particpant is engaged in toy play: activityType=list("toyplay").  See the CHAT manual for legal values.
#' @param groupType Query by group type.   For example, to get transcripts where the target particpant is hearing limited: groupType=list("HL").  See the CHAT manual for legal values.
#' @export
#' @examples
#' getParticipants(corpusName = 'childes',
#'                 corpora = list(list('childes',
#'                                     'Eng-NA',
#'                                     'MacWhinney')))
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
#' @param corpusName Name of corpus to query.  For example, to search within the childes corpus, corpus="childes".  Note this is a character string value (not a list).  Legal values are 'aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', and 'tbi'.
#' @param corpora Name of corpus/corporas to query.  This is a path starting with the corpus name followed by subfolder names leading to a folder for which all transcripts beneath it will be queried.  For example, to query all transripts in the MacWhinney and Brown corpus: corpora = list(list('childes', 'Eng-NA', 'MacWhinney'), list('childes', 'Eng-NA', 'Brown')).  Legal values can be found by searching the TalkBank browser: https://sla.talkbank.org/TBB.
#' @param lang Query by language.  For example, to get transcripts that contain both English and Spanish: lang=list("eng", "spa"). Legal values: 3-letter language codes based on the ISO 639-3 standard.
#' @param media Query by media type.  For example, to get transcripts with an associated video recording: media=list("video").  Legal values: "audio" or "video".
#' @param age Query by participant month age range.  For example, to get transcripts with target participants who are either 3-12 or 14-18 months old: age=list(list(from="3", to="12"), list(from="14", to="18")).  Legal values: integer month ages.
#' @param gender Query by participant gender. For example, to get transcripts with female target participants: gender=list("female").  Legal values: "female" or "male".
#' @param designType Query by design type.  For example, to get transcripts from a longitudinal study: designType=list("long")  Legal values are "long" for longitudinal studies, "cross" for cross-sectional studies. 
#' @param activityType Query by activity type.  For example, to get transcripts where the target particpant is engaged in toy play: activityType=list("toyplay").  See the CHAT manual for legal values.
#' @param groupType Query by group type.   For example, to get transcripts where the target particpant is hearing limited: groupType=list("HL").  See the CHAT manual for legal values.
#' @export
#' @examples
#' getTokens(corpusName = 'childes',
#'           corpora = list(list('childes',
#'                               'Eng-NA',
#'                               'MacWhinney',
#'                               '010411a')))
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
#' @param corpusName Name of corpus to query.  For example, to search within the childes corpus, corpus="childes".  Note this is a character string value (not a list).  Legal values are 'aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', and 'tbi'.
#' @param corpora Name of corpus/corporas to query.  This is a path starting with the corpus name followed by subfolder names leading to a folder for which all transcripts beneath it will be queried.  For example, to query all transripts in the MacWhinney and Brown corpus: corpora = list(list('childes', 'Eng-NA', 'MacWhinney'), list('childes', 'Eng-NA', 'Brown')).  Legal values can be found by searching the TalkBank browser: https://sla.talkbank.org/TBB.
#' @param lang Query by language.  For example, to get transcripts that contain both English and Spanish: lang=list("eng", "spa"). Legal values: 3-letter language codes based on the ISO 639-3 standard.
#' @param media Query by media type.  For example, to get transcripts with an associated video recording: media=list("video").  Legal values: "audio" or "video".
#' @param age Query by participant month age range.  For example, to get transcripts with target participants who are either 3-12 or 14-18 months old: age=list(list(from="3", to="12"), list(from="14", to="18")).  Legal values: integer month ages.
#' @param gender Query by participant gender. For example, to get transcripts with female target participants: gender=list("female").  Legal values: "female" or "male".
#' @param designType Query by design type.  For example, to get transcripts from a longitudinal study: designType=list("long")  Legal values are "long" for longitudinal studies, "cross" for cross-sectional studies. 
#' @param activityType Query by activity type.  For example, to get transcripts where the target particpant is engaged in toy play: activityType=list("toyplay").  See the CHAT manual for legal values.
#' @param groupType Query by group type.   For example, to get transcripts where the target particpant is hearing limited: groupType=list("HL").  See the CHAT manual for legal values.
#' @export
#' @examples
#' getTokenTypes(corpusName = 'childes',
#'               corpora = list(list('childes',
#'                                   'Eng-NA',
#'                                   'MacWhinney')))
getTokenTypes <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getTokenTypes');

    return( respData );
  }
}




#' @title Get utterances.
#'
#' @description Query a table with all the words from the selected transcripts, one word (token) per row. Each row has:
#' * Link to view transcript and play any associated media.
#' * Corpus path to transcript.
#' * Utterance sequence number (starts at 0).
#' * Word sequence number within utterance (starts at 0).
#' * Speaker's ID.
#' * Speaker's role.
#' * Utterance postcodes.
#' * Utterance GEMS.
#' * Utterance.
#' * Start time of utterance in associated media.
#' * End time of utterance in associated media.
#' @param corpusName Name of corpus to query.  For example, to search within the childes corpus, corpus="childes".  Note this is a character string value (not a list).  Legal values are 'aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', and 'tbi'.
#' @param corpora Name of corpus/corporas to query.  This is a path starting with the corpus name followed by subfolder names leading to a folder for which all transcripts beneath it will be queried.  For example, to query all transripts in the MacWhinney and Brown corpus: corpora = list(list('childes', 'Eng-NA', 'MacWhinney'), list('childes', 'Eng-NA', 'Brown')).  Legal values can be found by searching the TalkBank browser: https://sla.talkbank.org/TBB.
#' @param lang Query by language.  For example, to get transcripts that contain both English and Spanish: lang=list("eng", "spa"). Legal values: 3-letter language codes based on the ISO 639-3 standard.
#' @param media Query by media type.  For example, to get transcripts with an associated video recording: media=list("video").  Legal values: "audio" or "video".
#' @param age Query by participant month age range.  For example, to get transcripts with target participants who are either 3-12 or 14-18 months old: age=list(list(from="3", to="12"), list(from="14", to="18")).  Legal values: integer month ages.
#' @param gender Query by participant gender. For example, to get transcripts with female target participants: gender=list("female").  Legal values: "female" or "male".
#' @param designType Query by design type.  For example, to get transcripts from a longitudinal study: designType=list("long")  Legal values are "long" for longitudinal studies, "cross" for cross-sectional studies. 
#' @param activityType Query by activity type.  For example, to get transcripts where the target particpant is engaged in toy play: activityType=list("toyplay").  See the CHAT manual for legal values.
#' @param groupType Query by group type.   For example, to get transcripts where the target particpant is hearing limited: groupType=list("HL").  See the CHAT manual for legal values.
#' @export
#' @examples
#' getUtterances(corpusName = 'childes',
#'               corpora = list(list('childes', 
#'                                    'Eng-NA', 
#'                                    'MacWhinney', 
#'                                    '010411a')) )
getUtterances <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);
  
  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));
    
    respData <- getData(query, 'getUtteranceSummary');
    
    return( respData );
  }
}





#' @title Query CQL
#'
#' @description Queryting by "CQL" (Corpus Query Language) lets us search for patterns in the selected transcripts. We construct a CQL query by appending words, lemmas, and parts of speech.
#'  Adding a type="word" matches that exact word.
#'  Adding a type="pos" matches a word with that part of speech.
#'  Adding a type="lemma" matches that word stem. For instance, inserting type="lemma" 'run' matches:
#' * run
#' * running
#' * ran 
#' 
#' @param cqlArr Query by grammatical pattern.  
#' For example, to search for all utterances where a speaker says "go" once followed by adverb occuring one or more times: cqlArr=list(list(type="word", item="go", freq="once"), list(type="pos", item="adv", freq="onePlus")).
#' Legal values for type are: "word" to match exact word, "stem" to match all forms of a word stem, "pos" to match parts of speech.
#' Legal values for item are any word, word stem, or part of speech code (see CHAT manual or the CQL tab on TalkBankDB (https://talkbank.org/DB) for legal part-of-speech codes).
#' Legal values for freq are "once", "onePlus", and "zeroPlus".
#' @param corpusName Name of corpus to query.  For example, to search within the childes corpus, corpus="childes".  Note this is a character string value (not a list).  Legal values are 'aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', and 'tbi'.
#' @param corpora Name of corpus/corporas to query.  This is a path starting with the corpus name followed by subfolder names leading to a folder for which all transcripts beneath it will be queried.  For example, to query all transripts in the MacWhinney and Brown corpus: corpora = list(list('childes', 'Eng-NA', 'MacWhinney'), list('childes', 'Eng-NA', 'Brown')).  Legal values can be found by searching the TalkBank browser: https://sla.talkbank.org/TBB.
#' @param lang Query by language.  For example, to get transcripts that contain both English and Spanish: lang=list("eng", "spa"). Legal values: 3-letter language codes based on the ISO 639-3 standard.
#' @param media Query by media type.  For example, to get transcripts with an associated video recording: media=list("video").  Legal values: "audio" or "video".
#' @param age Query by participant month age range.  For example, to get transcripts with target participants who are either 3-12 or 14-18 months old: age=list(list(from="3", to="12"), list(from="14", to="18")).  Legal values: integer month ages.
#' @param gender Query by participant gender. For example, to get transcripts with female target participants: gender=list("female").  Legal values: "female" or "male".
#' @param designType Query by design type.  For example, to get transcripts from a longitudinal study: designType=list("long")  Legal values are "long" for longitudinal studies, "cross" for cross-sectional studies. 
#' @param activityType Query by activity type.  For example, to get transcripts where the target particpant is engaged in toy play: activityType=list("toyplay").  See the CHAT manual for legal values.
#' @param groupType Query by group type.   For example, to get transcripts where the target particpant is hearing limited: groupType=list("HL").  See the CHAT manual for legal values.
#' @export
#' @examples
#' getCQL(cqlArr=list(list(type="lemma", item="my", freq="once"),
#'                    list(type="lemma", item="ball", freq="once")),
#'        corpusName = 'childes',
#'        corpora = list(list('childes', 'Eng-NA', 'MacWhinney')))
getCQL <- function (cqlArr=NULL, corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(cqlArr=cqlArr, corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'cql');

    return( respData );
  }
}

