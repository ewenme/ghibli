#' Complete list of palettes
#'
#' Use \code{\link{ghibli_palette}} to construct palettes of desired length.
#'
#' @export
ghibli_palettes <- list(
  MarnieLight1 = c("#95918E", "#2B2522", "#7BC7C8", "#8BBBD0", "#E4D0C4", "#B0DDEA", "#F4E8CF"),
  MarnieMedium1 = c("#7BA46C", "#602D31", "#008D91", "#0A789F", "#C6A28A", "#61B8D3", "#EACF9E"),
  MarnieDark1 = c("#15110F", "#301619", "#004849", "#083C50" ,"#645145", "#305E6A", "#72694E"),
  MarnieLight2 = c("#8E938D", "#93A39C", "#95B8AF", "#9FD1BE", "#BFCDBD", "#A9D1A7", "#E6E496"),
  MarnieMedium2 = c("#1C271D", "#254639", "#257161", "#3AA580", "#7F9A7C", "#52A356", "#CEC747"),
  MarnieDark2 = c("#0E130E", "#13231D", "#143830", "#1E513F" ,"#404D3E", "#29522A", "#666421"),
  PonyoLight = c("#A6A0A0", "#ADB7BF", "#91C5CB", "#F7ACB3", "#F0BBB2", "#EDD7A4", "#F6E2D5"),
  PonyoMedium = c("#4D4140", "#596F7E", "#168B98", "#ED5B67", "#E27766", "#DAAD50", "#EAC3A6"),
  PonyoDark = c("#272020", "#2D3840", "#0E464C", "#762D34", "#703C33", "#6D5826", "#766255"),
  LaputaLight = c("#898D90", "#8D939F", "#9F99B2", "#AFACC6", "#D8CADC", "#D9EDF2", "#F8E9C2"),
  LaputaMedium = c("#13191F", "#1F2945", "#413566", "#5D5A8E", "#AF93BA", "#B2DAE4", "#F1D687"),
  LaputaDark = c("#080D0F", "#0D1320", "#201A34", "#302D47", "#584B5D", "#596D72", "#786A43"),
  MononokeLight = c("#838A8F", "#BB958B", "#9EA7BC", "#B2B8B1", "#EAA69D", "#F4C59D", "#F5EDCD"),
  MononokeMedium = c("#05141E", "#762B19", "#3D507A", "#657062", "#D14E3E", "#E78A40", "#EBD799"),
  MononokeDark = c("#020A0F", "#3C150C", "#1F283D", "#333832", "#69261E", "#74461F", "#756D4D"),
  SpiritedLight = c("#8F9296", "#9A9C97", "#C29A9B", "#C7C0C7", "#B1DDF3", "#E1D7CC", "#DAEBF7"),
  SpiritedMedium = c("#1F272E", "#353832", "#853438", "#908091", "#61BAE5", "#C4AE99", "#B5D9F0"),
  SpiritedDark = c("#0F1216", "#1A1C17", "#431A1C", "#484148", "#325D73", "#62574D", "#5A6B77"),
  YesterdayLight = c("#758184", "#7D8C96", "#87988E", "#9CAFC1", "#AFD5BD", "#EDE096", "#C1DAE8"),
  YesterdayMedium = c("#041A21", "#102F40", "#244331", "#4B6E90", "#6AB287", "#DDC850", "#8FBBD6"),
  YesterdayDark = c("#020E11", "#0A1923", "#14251B", "#293D4F", "#3C624B", "#796E2B", "#4F6875"),
  KikiLight = c("#8E8C8F", "#9A9AA1", "#D98594", "#82C3D8", "#D1C1AC", "#BEDDE0", "#EADBD1"),
  KikiMedium = c("#1C1A1F", "#333544", "#B9022C", "#0085B0", "#9F825C", "#7EBAC2", "#D2B7A1"),
  KikiDark = c("#0E0C0F", "#1A1A22", "#5B0315", "#004358", "#51412D", "#3E5D60", "#6A5B51"),
  TotoroLight = c("#85898A", "#959492", "#AC9D96", "#A8A6A9", "#A1B1C8", "#D6C0A9", "#DCD3C4"),
  TotoroMedium = c("#1C1A1F", "#2D2A25", "#593B2D", "#534C53", "#42668D", "#AF8058", "#BCA78F"),
  TotoroDark = c("#05090A", "#151412", "#2C1D16", "#282629", "#213148", "#57402C", "#5C5346")
)

#' A Studio Ghibli palette generator
#'
#' These are some color palettes from Studio Ghibli films.
#'
#' @param n Number of colors desired. All palettes now only have seven colors.
#'   All color schemes are derived from this Studio Ghibli retrospective:
#'   \href{http://www.thelovemagazine.co.uk/posts/6584/in-photos-guess-who-s-back-retrospective-of-studio-ghibli-forever-is-here}{Studio Ghibli retrospective}.
#'   If omitted, uses all colours.
#' @param name Name of desired palette.
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
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
#' pal <- ghibli_palette(21, name = "YesterdayLight", type = "continuous")
ghibli_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- ghibli_palettes[[name]]
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
