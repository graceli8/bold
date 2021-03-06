# tests for bold_specimens fxn in bold
context("bold_specimens")

test_that("bold_specimens returns the correct dimensions or values", {
  skip_on_cran()

  a <- bold_specimens(taxon='Osmia')
  b <- bold_specimens(taxon='Osmia', format='xml', response=TRUE)

  expect_equal(b$status_code, 200)
  expect_equal(b$response_headers$`content-type`, "application/x-download")

  expect_is(a, "data.frame")
  expect_is(b, "HttpResponse")

  expect_is(a$recordID, "integer")
  expect_is(a$processid, "character")

  expect_is(b$response_headers, "list")
})

test_that("Throws warning on call that takes forever including timeout in callopts", {
  skip_on_cran()

  expect_error(bold_specimens(geo='Costa Rica', timeout_ms = 2), "Timeout was reached")
})

test_that("bold_seq returns correct thing when parameters empty or not given", {
  skip_on_cran()

  expect_error(bold_specimens(taxon=''), "must provide a non-empty value")
  expect_error(bold_specimens(), "must provide a non-empty value")
})
