context("test-scales")

# Initial setup -----------------------------------------------------------

library(dplyr)
library(ggplot2)

base_color_plot <- mtcars %>%
  mutate(cyl = factor(cyl)) %>%
  ggplot(aes(x=wt, y=mpg)) +
  geom_point(aes(color=cyl), size=10)

base_fill_plot <- mtcars %>%
  mutate(cyl = factor(cyl)) %>%
  ggplot(aes(x=mpg)) +
  geom_density(aes(fill=cyl))



# test scale_colour_ghibli_d ------------------------------------------------

test_that('scale_fill_ghibli_d is ScaleDiscrete',{
  expect_s3_class(scale_fill_ghibli_d(name = 'PonyoMedium'), 'ScaleDiscrete')
})

test_that('scale_colour_ghibli_d returns a ggplot',{
  expect_s3_class(base_color_plot + scale_colour_ghibli_d(name = 'PonyoMedium'), 'gg')
})

test_that('scale_colour_ghibli_d takes name args',{
  expect_s3_class(base_color_plot +
                    scale_colour_ghibli_d(name = 'PonyoMedium'),
                  'gg')
  expect_s3_class(base_color_plot +
                    scale_colour_ghibli_d(name = 'PonyoMedium', direction = -1),
                  'gg')
})

test_that('scale_colour_ghibli_d fails as expected',{
  throws_error(base_color_plot + scale_colour_ghibli_d(name = 'PonyoMedium', direction = 2))
})



# test scale_fill_ghibli_d ------------------------------------------------

test_that('scale_fill_ghibli_d is ScaleDiscrete',{
  expect_s3_class(scale_fill_ghibli_d(name = 'PonyoMedium'), 'ScaleDiscrete')
})

test_that('scale_fill_ghibli_d returns a ggplot',{
  expect_s3_class(base_fill_plot + scale_fill_ghibli_d(name = 'PonyoMedium'), 'gg')
})

test_that('scale_fill_ghibli_d takes palette args',{
  expect_s3_class(base_fill_plot +
                    scale_fill_ghibli_d(name = 'PonyoMedium'),
                  'gg')
  expect_s3_class(base_fill_plot +
                    scale_fill_ghibli_d(name = 'PonyoMedium', direction = -1),
                  'gg')
})

test_that('scale_fill_ghibli_d fails as expected',{
  throws_error(base_fill_plot + scale_fill_ghibli_d(name = 'PonyoMedium', direction = 2))
})
