# this script requires yaml and usethis packages to run

ghibli_palettes <- yaml::read_yaml(file = system.file("extdata", "palettes.yml", package = "ghibli"))

usethis::use_data(ghibli_palettes, overwrite = TRUE)
