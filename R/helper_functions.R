



# Include library for making GET/POST requests.
library(httr);
# Include library for parsing JSON.
library(rjson);

# Takes:
# query: A POST query formatted as list of lists.
# route: The name of the route on server.
# Returns a dataframe with server response.
getData <- function(query, route) {
  print("Fetching data, please wait...");

  query$queryVals$respType <- "JSON";

  reqURL <- paste("https://sla2.talkbank.org:1515/", route, sep="");

  serverResp <- POST(reqURL, body = query, encode = "json");

  # Get the body of POST request.
  txtResp <- content(serverResp, type="text", encoding="UTF-8");

  # Convert txtResp to JSON.
  asJSON <- fromJSON(txtResp);

  # Convert JSON to dataframe.
  dataFrame <- setNames(
    data.frame(do.call(rbind, asJSON$data)),
    asJSON$colHeadings
  );

  print("Success!");

  dataFrame;
}


# Verify type and values of arguments passed as query to getData().
verifyArg <- function (corpusName, corpora, lang, media, age, gender, designType, activityType, groupType) {

  CORPORA_LIST = list('aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', 'tbi');

  # Return TRUE if corpusName valid name, FALSE otherwise.
  validCorpusName <- function(corpusName) {
    for (name in CORPORA_LIST) {
      if(name == corpusName) {
        return(TRUE);
      }
    }

    return(FALSE);
  }


  # Return string listing of corpus names.
  corpusNames <- function() {
    corpusNames = "";

    for (name in CORPORA_LIST) {
      corpusNames <- paste(corpusNames, name);
    }

    corpusNames;
  }


  # Verify corpusName arg.
  if(!is.null(corpusName)) {
    if( typeof(corpusName) != "list") {
      print("ERROR: Argument 'corpusName' must be a list.");
      return(FALSE);
    }

    # Check if corpusName value is valid.
    if(!validCorpusName(corpusName)) {
      #print("ERROR: Argument 'corpusName' is not a valid name.  Must be one of: ");
      #print(corpusNames());


      writeLines(paste("ERROR: Value for 'corpusName' is not a valid name.\nMust be one of:", corpusNames()));

      return(FALSE);
    }
  }
  else {
    print("ERROR: Argument 'corpusName' must exist.");
    return(FALSE);
  }


  # Verify corpora arg.
  if(!is.null(corpora)) {
    if( !((typeof(corpora) == "list") && (typeof(corpora[[1]]) == "list")) ) {
      print("ERROR: Argument 'corpora' must be a list of nested lists.");
      return(FALSE);
    }
  }

  # Verify lang arg.
  if(!is.null(lang)) {
    if( typeof(lang) != "list") {
      print("ERROR: Argument 'lang' must be a list.");
      return(FALSE);
    }
  }

  # Verify media arg.
  if(!is.null(media)) {
    if( typeof(media) != "list") {
      print("ERROR: Argument 'media' must be a list.");
      return(FALSE);
    }
  }

  # Verify age arg.
  if(!is.null(age)) {
    if( typeof(age) != "list") {
      print("ERROR: Argument 'age' must be a list.");
      return(FALSE);
    }
  }

  # Verify gender arg.
  if(!is.null(gender)) {
    if( typeof(gender) != "list") {
      print("ERROR: Argument 'gender' must be a list.");
      return(FALSE);
    }
  }

  # Verify designType arg.
  if(!is.null(designType)) {
    if( typeof(designType) != "list") {
      print("ERROR: Argument 'designType' must be a list.");
      return(FALSE);
    }
  }

  # Verify activityType arg.
  if(!is.null(activityType)) {
    if( typeof(activityType) != "list") {
      print("ERROR: Argument 'activityType' must be a list.");
      return(FALSE);
    }
  }

  # Verify groupType arg.
  if(!is.null(groupType)) {
    if( typeof(groupType) != "list") {
      print("ERROR: Argument 'groupType' must be a list.");
      return(FALSE);
    }
  }

  # Arguments deemed valid.
  return(TRUE);
}
