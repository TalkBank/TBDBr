test_that("basic-query-works", {
    example_utterances <- getUtterances(corpusName = 'childes',
                                      corpora = c('childes', 'Eng-NA', 'MacWhinney', '010411a'))
  expect_equal(nrow(example_utterances), 555)
})
