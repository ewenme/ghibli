#' Discrete scales to use for ggplot2
#'
#' These functions provide the option to use \code{ghibli} colours inside discrete
#' palettes with the `ggplot2` package.
#'
#' Available palettes are found in \code{\link[ghibli]{ghibli_palettes}}.
#'
#' @rdname ggplot2-scales-discrete
#' @param ... additional arguments to pass to discrete_scale
#' @inheritParams ghibli_palette
#'
#' @examples
#'
#' if (require('ggplot2')) {
#'
#'   ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#'     geom_point() +
#'     scale_colour_ghibli_d("PonyoMedium")
#' }
#'
#' @export
scale_colour_ghibli_d <- function(name, direction = 1, ...) {

  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop('ggplot2 is required for this functionality', call. = FALSE)
  }

  ggplot2::discrete_scale("colour", scale_name = name,
                          pal_pal(name = name, direction = direction), ...)

}

#' @rdname ggplot2-scales-discrete
#' @export
scale_color_ghibli_d <- scale_colour_ghibli_d


#' @rdname ggplot2-scales-discrete
#' @export
#'
scale_fill_ghibli_d <- function(name, direction = 1, ...) {

  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop('ggplot2 is required for this functionality', call. = FALSE)
  }

  ggplot2::discrete_scale("fill", scale_name = name,
                          pal_pal(name = name, direction = direction), ...)

}


#' Continuous scales to use for ggplot2
#'
#' These functions provide the option to use ghibli colours inside continuous
#' palettes with the `ggplot2` package.
#'
#' Available palettes are found in \code{\link[ghibli]{ghibli_palettes}}.
#'
#' @param ... Arguments to pass on to `ggplot2::scale_colour_gradientn()` or
#' `ggplot2::scale_fill_gradientn()`
#' @inheritParams ghibli_palette
#'
#' @return A `ScaleContinuous` object that can be added to a `ggplot` object
#'
#' @name ggplot2-scales-continuous
#' @rdname ggplot2-scales-continuous
#'
#' @examples
#'
#' if (require('ggplot2')) {
#'
#'   ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
#'     geom_point() +
#'     scale_colour_ghibli_c("PonyoMedium")
#' }
#'
#' @export
scale_colour_ghibli_c <- function(name, direction = 1, ...) {

  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop('ggplot2 is required for this functionality', call. = FALSE)
  }

  ggplot2::scale_colour_gradientn(
    colours = ghibli_palette(name = name, direction = direction,
                             n = 256, type = "continuous"), ...)
}

#' @rdname ggplot2-scales-continuous
#' @export
#'
scale_color_ghibli_c <- scale_colour_ghibli_c
#' @rdname ggplot2-scales-continuous
#' @export
#'
scale_fill_ghibli_c <- function(name, direction = 1, ...) {

  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop('ggplot2 is required for this functionality', call. = FALSE)
  }

  ggplot2::scale_fill_gradientn(
    colours = ghibli_palette(name = name, direction = direction,
                             n = 256, type = "continuous"), ...)
}
