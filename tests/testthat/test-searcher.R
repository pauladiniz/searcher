context("searcher")

test_that("Check link generation", {

  ##### Google

  expect_identical(
    search_google("toad"),
    "https://google.com/search?q=toad"
  )

  ##### Bing

  expect_identical(
    search_bing("toad"),
    "https://bing.com/search?q=toad"
  )

  ##### DDG

  expect_identical(
    search_duckduckgo("toad"),
    "https://duckduckgo.com/?q=toad"
  )

  ##### ixquick

  expect_identical(
    search_ixquick("toad"),
    "https://ixquick.com/do/dsearch?query=toad"
  )

  ##### StackOverflow

  expect_identical(
    search_stackoverflow("toad"),
    "https://stackoverflow.com/search?q=toad%20[r]"
  )

  expect_identical(
    search_stackoverflow("toad", rlang = FALSE),
    "https://stackoverflow.com/search?q=toad"
  )

  ##### GitHub

  expect_identical(
    search_github("toad"),
    "https://github.com/search?q=toad%20language:r%20type:issue&type=Issues"
  )

  expect_identical(
    search_github("toad", rlang = FALSE),
    "https://github.com/search?q=toad&type=Issues"
  )

  ##### BitBucket

  expect_identical(
    search_bitbucket("toad"),
    "https://bitbucket.com/search?q=toad%20lang:r"
  )

  expect_identical(
    search_bitbucket("toad", rlang = FALSE),
    "https://bitbucket.com/search?q=toad"
  )

})

test_that("Validate selection", {

  expect_identical(
    search_site("toad", "bb", rlang = FALSE),
    "https://bitbucket.com/search?q=toad"
  )

  expect_identical(
    search_site("", rlang = FALSE),
    "",
    "Verify empty query fall through"
  )

})


test_that("Malformed search query validation", {

  expect_identical(
    search_google(""),
    "",
    "Empty string check if no error messages"
  )


  expect_identical(
    search_bing(""),
    "",
    "Empty string check if no error messages"
  )


  expect_identical(
    search_ddg(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_ixquick(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_so(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_gh(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_bb(""),
    "",
    "Empty string check if no error messages"
  )

  expect_identical(
    search_google(NULL),
    "",
    "NULL value handling"
  )
})
