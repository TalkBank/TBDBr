

list_corpus_names <- function(){

  corpus_names <- c('aphasia', 'asd', 'biling', 'ca', 'childes', 'class', 'dementia', 'fluency', 'homebank', 'phon', 'rhd', 'samtale', 'slabank', 'tbi')

  print(corpus_names)
  print('Note: Access to clinical banks is currenlt restricted; use talkbankTB.org online')

}


# list_corpora_options <- function(corpus, level_1, level_2, level_3){
#
#   print(options at this level...)
# }



list_languages <- function(lang=NULL){
  mat = matrix(ncol = 2, byrow = T,
         c('Afrikaans', 'afr',
         'Arabic', 'ara',
         'Basque', 'eus',
         'Catalan', 'cat',
         'Chinese, Mandarin', 'zho',
         'Chinese, MinNanChinese', 'nan',
         'Chinese, YueCantonese', 'yue',
         'Croatian', 'hrv',
         'Czech', 'ces',
         'Danish', 'dan',
         'Dutch', 'nld',
         'English', 'eng',
         'Estonian', 'est',
         'French', 'fra',
         'German', 'deu',
         'Greek', 'ell',
         'Hebrew', 'heb',
         'Hawaiian', 'haw',
         'Hungarian', 'hun',
         'Icelandic', 'isl',
         'Indonesian', 'ind',
         'Irish', 'gle',
         'Italian', 'ita',
         'Jamaican', 'jam',
         'Japanese', 'jpn',
         'Javanese', 'jav',
         'Kikuyu', 'kik',
         'Korean', 'kor',
         'Manado Malay', 'xmm',
         'Marathi', 'mar',
         'Northwest Alaska Inupiatun', 'esk',
         'Norwegian', 'nor',
         'Persian', 'fas',
         'Polish', 'pol',
         'Portuguese', 'por',
         'Romanian', 'ron',
         'Russian', 'rus',
         'Scottish Gaelic', 'gla',
         'Serbian', 'srp',
         'Slovenian', 'slv',
         'Southern Sotho', 'sot',
         'Spanish', 'spa',
         'Swedish', 'swe',
         'Tagalog', 'tgl',
         'Tamil', 'tml',
         'Thai', 'tha',
         'Turkish', 'tur',
         'Welsh','cym',
         'Yau', 'yuw',
         'Yiddish', 'yid',
         'Undetermined', 'und'
  ))

  mat = as.data.frame(mat)
  colnames(mat) = c('Language', 'Abbreviation')

  if(is.null(lang)) {print(mat)} else{
    lang = tolower(as.character(lang))
    lang = paste0(toupper(substr((lang), 1, 1)), substr((lang), 2, nchar((lang))))
    mat = mat[grepl(lang, mat$Language),]
    print(mat)
  }
}

