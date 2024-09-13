# clockplot (development version)

* User does not have give time in `HH:MM:SS`; `HH:MM` or even `H:M` are also
allowed. 
* Fixed a bug containing `hour`, `minute`, and `second` variable during internal
data conversion. 
* Updated `smsclock` data (Sep 01 to Sep 09 (2024))
* Added gitcommit data up to 12 Sep, 2024

# clockplot 0.6.1.9000

* Started testing using `usethis::use_testthat(3)`
* Added Bangladesh Railway data set (`brintcity`)
* `conv_hms` is being deprecated. Use `hms::parse_hm()` instead.
* Added legend by size of `geom_point()`
* Added and explained `clock_chart()` examples in vignettes.

# clockplot 0.5.1.9000

* Added gray lines along hour hands
* Removed grid lines from the clock skeleton
* Converted length variable to 0.5-1 range

# Older versions

* Not logged


