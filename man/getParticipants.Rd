% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/query_functions.R
\name{getParticipants}
\alias{getParticipants}
\title{Get participant data}
\usage{
getParticipants(
  corpusName = NULL,
  corpora = NULL,
  lang = NULL,
  media = NULL,
  age = NULL,
  gender = NULL,
  designType = NULL,
  activityType = NULL,
  groupType = NULL,
  auth = FALSE
)
}
\arguments{
\item{corpusName}{Name of corpus to query.  For example, to search within the childes corpus, corpus="childes".}

\item{corpora}{Name of corpus/corporas to query.  This is a path starting with the corpus name followed by subfolder names leading to a folder for which all transcripts beneath it will be queried.  For example, to query all transcripts in the MacWhinney childes corpus: corpora = c('childes', 'Eng-NA', 'MacWhinney').}

\item{lang}{Query by language For example, to get transcripts that contain both English and Spanish: lang=c("eng", "spa"). Legal values: 3-letter language codes based on the ISO 639-3 standard.}

\item{media}{Query by media type.  For example, to get transcripts with an associated video recording: media=c("video").  Legal values: "audio" or "video".}

\item{age}{Query by participant month age range.  For example, to get transcripts with target participants who are 14-18 months old: age=c(from="3", to="12").}

\item{gender}{Query by participant gender. For example, to get transcripts with female target participants: gender=c("female").  Legal values: "female" or "male".}

\item{designType}{Query by design type.  For example, to get transcripts from a longitudinal study: designType=c("long")  Legal values are "long" for longitudinal studies, "cross" for cross-sectional studies.}

\item{activityType}{Query by activity type.  For example, to get transcripts where the target participant is engaged in toy play: activityType=c("toyplay").  See the CHAT manual for legal values.}

\item{groupType}{Query by group type.   For example, to get transcripts where the target participant is hearing limited: groupType=c("HL").  See the CHAT manual for legal values.}

\item{auth}{Determine if user should be prompted to authenticate in order to access protected collections. Defaults to False.}
}
\description{
Queries a table where each row represents a participant (speaker) listed in a transcript. Each row has:
\itemize{
\item Link to view transcript and play any associated media.
\item Corpus path to transcript.
\item Speaker's ID.
\item Speaker's name.
\item Speaker's role.
\item Speaker's language.
\item Speaker's age in months.
\item Speaker's age in Years/Months/Days.
\item Speaker's gender.
\item Number of words spoken by speaker.
\item Number of utterances spoken by speaker.
\item Average number of words per speaker's utterance.
\item Median number of words per speaker's utterance.
}
}
\examples{
getParticipants(corpusName = 'childes',
                corpora = c('childes',
                                    'Eng-NA',
                                    'MacWhinney'))
}
