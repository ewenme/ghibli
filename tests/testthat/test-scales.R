# Initial setup -----------------------------------------------------------

base_color_plot <- mtcars %>%
  dplyr::mutate(cyl = factor(cyl)) %>%
  ggplot2::ggplot(ggplot2::aes(x=wt, y=mpg)) +
  ggplot2::geom_point(ggplot2::aes(color=cyl), size=10)

base_fill_plot <- mtcars %>%
  dplyr::mutate(cyl = factor(cyl)) %>%
  ggplot2::ggplot(ggplot2::aes(x=mpg)) +
  ggplot2::geom_density(ggplot2::aes(fill=cyl))



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
  expect_error(base_color_plot + scale_colour_ghibli_d())

  expect_error(base_color_plot + scale_colour_ghibli_d(name = 'PonyoMedium', direction = 2))
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
  expect_error(base_fill_plot + scale_fill_ghibli_d())

  expect_error(base_fill_plot + scale_fill_ghibli_d(name = 'PonyoMedium', direction = 2))
})
