context("download of data from natural earth")

library(httr)

#a non exhaustive list of ne download urls
#initially taken from those in data_download_script.r
urls <- c(
ne_file_name(scale=110, type='countries', category='cultural', full_url=TRUE),
ne_file_name(scale=110, type='map_units', category='cultural', full_url=TRUE),

ne_file_name(scale=110, type='sovereignty', category='cultural', full_url=TRUE),

ne_file_name(scale=50, type='countries', category='cultural', full_url=TRUE),
ne_file_name(scale=50, type='map_units', category='cultural', full_url=TRUE),
ne_file_name(scale=50, type='sovereignty', category='cultural', full_url=TRUE),

ne_file_name(scale=10, type='countries', category='cultural', full_url=TRUE),
ne_file_name(scale=10, type='map_units', category='cultural', full_url=TRUE),
ne_file_name(scale=10, type='sovereignty', category='cultural', full_url=TRUE),

ne_file_name(scale=50, type='states', category='cultural', full_url=TRUE),
ne_file_name(scale=10, type='states', category='cultural', full_url=TRUE),

ne_file_name(scale=110, type='tiny_countries', category='cultural', full_url=TRUE),

ne_file_name(scale=110, type='coastline', category='physical', full_url=TRUE),
ne_file_name(scale=50, type='coastline', category='physical', full_url=TRUE),
ne_file_name(scale=10, type='coastline', category='physical', full_url=TRUE)

)

url_expect_fail <- ne_file_name(scale=110, type='expect_fail', category='cultural', full_url=TRUE)

test_that("urls for downloads created by the package exist", {
  
  testthat::skip_on_cran()
  
  #tests all of the urls put into the vector above
  #info=x means that test fail messages include the failed urls
  sapply(urls, function(x) expect_false(httr::http_error(x), info=x))
  
  })

test_that("a bogus url does not exist", {
  
  testthat::skip_on_cran()
  
  expect_true(httr::http_error(url_expect_fail))
  
})
