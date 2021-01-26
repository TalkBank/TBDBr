
#' @importFrom stats setNames
#' @import rjson
#' @import httr
#' @import kableExtra
#' @import shiny


# Include library for making GET/POST requests.
library(httr);
# Include library for parsing JSON.
library(rjson);
library(kableExtra)
library(shiny) # for password no echo

# Takes:
# query: A POST query formatted as list of lists
# route: The name of the route on server.
# Returns a dataframe with server response.
getData <- function(query, route) {
  print("Fetching data, please wait...");

  query$queryVals$respType <- "JSON";

  reqURL <- paste("https://sla2.talkbank.org:1515/", route, sep="");

  serverResp <- POST(reqURL, body = query, encode = "json");

  # Get the body of POST request.
  txtResp <- content(serverResp, type="text", encoding="UTF-8");

  # Convert txtResp from JSON.
  R_obj <- fromJSON(txtResp);

  # If received requested data (and not error object), create and return data frame.
  if("colHeadings" %in% names(R_obj) ){
    if(length(R_obj$data) == 0) {
      print('No data returned.  Note: To access protected data, you need to authenticate.');
    }
    else {
      # Convert R_obj to dataframe.
      dataFrame <- setNames(
        data.frame(do.call(rbind, R_obj$data)),
        R_obj$colHeadings
      );

      print("Success!");

      dataFrame;
    }
  }
  # Process and return non-data (error) object.
  else {
    if(R_obj$respMsg == 'pathError'){
      cat('AUTHENTICATION ERROR: Path name \"', R_obj$at, '\" incorrect (or path may not require authentication).');
    }
    else if(R_obj$respMsg == 'authError'){
      cat('AUTHENTICATION ERROR: ID or password incorrect for path \"', R_obj$at, '\".');
    }

    R_obj;
  }
}


# Takes:
# query: A POST query formatted as list of lists.
# route: The name of the route on server.
# Returns an R object containing the server JSON response.
fetchJSON <- function(query, route) {
  print("Fetching data, please wait...");

  query$queryVals$respType <- "JSON";

  reqURL <- paste("https://sla2.talkbank.org:1515/", route, sep="");

  serverResp <- POST(reqURL, body = query, encode = "json");

  # Get the body of POST request.
  txtResp <- content(serverResp, type="text", encoding="UTF-8");

  # Convert txtResp from JSON.
  R_obj <- fromJSON(txtResp);

  print("Success!");

  R_obj;
}

# This is for queries that don't need a 'success' feedback
# need to find a way to send an error message if there is no response from the server...
# Takes:
# query: A POST query formatted as list of lists.
# route: The name of the route on server.
# Returns an R object containing the server JSON response.
fetchJSON.silent <- function(query, route) {
  query$queryVals$respType <- "JSON";

  reqURL <- paste("https://sla2.talkbank.org:1515/", route, sep="");

  serverResp <- POST(reqURL, body = query, encode = "json");

  # Get the body of POST request.
  txtResp <- content(serverResp, type="text", encoding="UTF-8");

  # Convert txtResp from JSON.
  R_obj <- fromJSON(txtResp);

  R_obj;
}


# Prompts user to enter set of paths and userIDs/passwords requiring authentication for a query.
authenticate <- function() {
  authReqs <- list();

  another = 'y';
  while(another == 'y') {
    # path = readline("Path to authenticate: ");
    #userID = readline("User ID: "); # note - now done with the shiny app.
    #password = getPass::getPass("Password: ");
    login = runGadget(loginApp, viewer = dialogViewer("Enter talkbank.org username and password for this Corpus", width = 400, height = 400))
    path = login$corpusname
    userID = login$username
    password = login$password

    authReqs[[length(authReqs)+1]] <- list(path=path, userID=userID, pswd=password)
    another = tolower(readline("Press any key to continue...")) #ifelse(login$auth_another == 'Yes', 'y', 'n'); # I have no idea why this doesn't work....
  }
  return(authReqs);

}

# very basic app to interactively retrieve password without echo-ing result
loginApp <- shinyApp(
  basicPage(
    selectInput("corpusName", "Corpus Name", choices= c('aphasia', 'asd', 'biling', 'dementia', 'fluency', 'rhd', 'tbi')),
    textInput("username", "Username"),
    passwordInput("password", "Password"),
    #radioButtons("auth_another", "Authenticate another?", choices = c("Yes", "No"), selected = "No"),
    shiny::actionButton("submit", "Submit")
  ),
  function(input, output) {
    observe({
      if (input$submit != 0)
        stopApp(list(
          corpusname = isolate(input$corpusName),
          username = isolate(input$username),
          password = isolate(input$password)#,
          # auth_another = isolate(input$auth_another)
        ))
    })
  }
)


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
    if( typeof(corpusName) != "character") {
      print("ERROR: Argument 'corpusName' must be a character string.");
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




#' @title Get Path Trees
#' @description Get path tree to every doc in TalkBankDB This can be useful for verifying "corpora" param passed to query functions by walking down and verifying path in object returned here.  Can give user feedback on what part of path is incorrect. Future use for GUIs to select paths or auto-complete
getPathTrees <- function () {
  query <- list(queryVals = list());

  respData <- fetchJSON.silent(query, 'getPathTrees');

  return( respData );
}


#' @title Check for valid path
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

#' @title Get legal values
#' @description Prints available options (values) for each level of talkbankDB
#' * After running getLegalValues(), select the corpus you would like to query.
#' * The function will return the next level of options
#' * Choose from those options to progres to the next level of available options
#' * All names are case-sensitive
#' @export
getLegalValues <- function(){
  trees = getPathTrees()
  print('Use this function to get arguments for talkbank functions')
  print('Enter them just as they appear')
  print('Corpus Names: aphasia, asd, biling, ca, childes, class, dementia, fluency,  homebank, phon, rhd, samtale, slabank, tbi')

  var1 = readline("Enter Corpus Name: ")
  languages = names(trees[['respMsg']][[var1]][[var1]])
  print(languages)

  var2 = readline("Enter Level 2: ")
  group = names(trees[['respMsg']][[var1]][[var1]][[var2]])
  print(group)

  var3 = readline("Enter Level 3: ")
  corpus = names(trees[['respMsg']][[var1]][[var1]][[var2]][[var3]])
  print(corpus)

  var4 = readline("Enter Level 4: ")
  sites = names(trees[['respMsg']][[var1]][[var1]][[var2]][[var3]][[var4]])
  print(sites)
}




