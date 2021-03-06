#' A Studio Ghibli palette generator
#'
#' These are some color palettes from Studio Ghibli films.
#' All color schemes are derived from
#' \href{https://moviesincolor.com/post/145269683743/i-got-to-make-some-color-palettes-for-the-best}{Movies In Color}.
#'
#' @param n Number of colors desired. All palettes now only have seven colors.
#' If omitted, uses all colours.
#'
#' @param name Name of desired palette.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' ghibli_palette("PonyoLight")
#' ghibli_palette("LaputaMedium")
#' ghibli_palette("SpiritedDark")
#' ghibli_palette("MarnieMedium2", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- ghibli_palette(name = "YesterdayLight", n = 21, type = "continuous")
ghibli_palette <- function(name, n, direction = 1, type = c("discrete", "continuous")) {

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }

  pal <- ghibli_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  type <- match.arg(type)

  if (type == "discrete" && n > length(pal)) {
    stop(paste0("Number of requested colors greater than what palette can offer, which is ",
                length(pal), "."))
  }

  out <- switch(type,
                continuous = colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )

  if (direction == -1) {
    out <- rev(out)
  }

  structure(out, class = "palette", name = name)
}


pal_pal <- function(name, direction) {

  function(n) {
    ghibli_palette(name = name, direction = direction)
  }

}

#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
