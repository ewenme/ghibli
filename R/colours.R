#' Complete list of palettes
#'
#' Use \code{\link{wes_palette}} to construct palettes of desired length.
#'
#' @export
ghibli_palettes <- list(
  MarnieLight1 = c("#A42820", "#5F5647", "#9B110E", "#3F5151", "#4E2A1E", "#550307", "#0C1707"),
  MarnieMedium1 = c("#FAD510", "#CB2314", "#273046", "#354823", "#1E1E1E"),
  MarnieDark1 = c("#E1BD6D", "#EABE94", "#0B775E", "#35274A" ,"#F2300F"),
  MarnieLight2 = c("#A42820", "#5F5647", "#9B110E", "#3F5151", "#4E2A1E", "#550307", "#0C1707"),
  MarnieMedium2 = c("#FAD510", "#CB2314", "#273046", "#354823", "#1E1E1E"),
  MarnieDark2 = c("#E1BD6D", "#EABE94", "#0B775E", "#35274A" ,"#F2300F"),
  PonyoLight = c("#899DA4", "#C93312", "#FAEFD1", "#DC863B"),
  PonyoMedium = c("#9A8822", "#F5CDB4", "#F8AFA8", "#FDDDA0", "#74A089"),
  PonyoDark = c("#3B9AB2", "#78B7C5", "#EBCC2A", "#E1AF00", "#F21A00"),
  LaputaLight = c("#FF0000", "#00A08A", "#F2AD00", "#F98400", "#5BBCD6"),
  LaputaMedium = c("#ECCBAE", "#046C9A", "#D69C4E", "#ABDDDE", "#000000"),
  LaputaDark = c("#446455", "#FDD262", "#D3DDDC", "#C7B19C"),
  MononokeLight = c("#DD8D29", "#E2D200", "#46ACC8", "#E58601", "#B40F20"),
  MononokeMedium = c("#F3DF6C", "#CEAB07", "#D5D5D3", "#24281A"),
  MononokeDark = c("#798E87", "#C27D38", "#CCC591", "#29211F"),
  SpiritedLight = c("#85D4E3", "#F4B5BD", "#9C964A", "#CDC08C", "#FAD77B"),
  SpiritedMedium = c("#D8B70A", "#02401B", "#A2A475", "#81A88D", "#972D15"),
  SpiritedDark = c("#F1BB7B", "#FD6467", "#5B1A18", "#D67236"),
  YesterdayLight = c("#E6A0C4", "#C6CDF7", "#D8A499", "#7294D4"),
  YesterdayMedium = c("#E6A0C4", "#C6CDF7", "#D8A499", "#7294D4"),
  YesterdayDark = c("#E6A0C4", "#C6CDF7", "#D8A499", "#7294D4")

)

#' A Wes Anderson palette generator
#'
#' These are a handful of color palettes from Wes Anderson movies.
#'
#' @param n Number of colors desired. Unfortunately most palettes now only
#'   have 4 or 5 colors. But hopefully we'll add more palettes soon. All color
#'   schemes are derived from the most excellent Tumblr blog:
#'   \href{http://wesandersonpalettes.tumblr.com/}{Wes Anderson Palettes}.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{BottleRocket1}, \code{BottleRocket2},  \code{Rushmore1},
#'   \code{Royal1}, \code{Royal2},  \code{Zissou1}, \code{Darjeeling1},
#'   \code{Darjeeling2},  \code{Chevalier1} , \code{FantasticFox1} ,
#'   \code{Moonrise1}, \code{Moonrise2}, \code{Moonrise3}, \code{Cavalcanti1},
#'   \code{GrandBudapest1}, \code{GrandBudapest2}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' wes_palette("Royal1")
#' wes_palette("GrandBudapest1")
#' wes_palette("Cavalcanti1")
#' wes_palette("Cavalcanti1", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- wes_palette(21, name = "Zissou1", type = "continuous")
#' image(volcano, col = pal)
wes_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- wes_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
