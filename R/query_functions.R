# Get a table of transcript metadata.
getTranscripts <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getTranscriptSummary');

    return( respData );
  }
}


# Get a table of participant metadata.
getParticipants <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getParticipantSummary');

    return( respData );
  }
}



# Get a table of token metadata.
getTokens <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getTokenSummary');

    return( respData );
  }
}




# Get a table of token type metadata.
getTokenTypes <- function (corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'getTokenTypes');

    return( respData );
  }
}



# Get a table of results from CQL query.
getCQL <- function (cqlArr=NULL, corpusName=NULL, corpora=NULL, lang=NULL, media=NULL, age=NULL, gender=NULL, designType=NULL, activityType=NULL, groupType=NULL) {
  argsOK <- verifyArg(corpusName, corpora, lang, media, age, gender, designType, activityType, groupType);

  if(argsOK) {
    query <- list(queryVals = list(cqlArr=cqlArr, corpusName=corpusName, corpora=corpora, lang=lang, media=media, age=age, gender=gender, designType=designType, activityType=activityType, groupType=groupType));

    respData <- getData(query, 'cql');

    return( respData );
  }
}

