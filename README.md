
# ghibli <img alt="ghibli Logo" title="ghibli" align="right" src="man/figures/ghibli-logo.png" width="100" style="float:right;width:100px;"/>

[![lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Build
Status](https://travis-ci.org/ewenme/ghibli.svg)](https://travis-ci.org/ewenme/ghibli)
<http://www.r-pkg.org/badges/version/ghibli>
[![DLs](http://cranlogs.r-pkg.org/badges/ghibli)](http://cran.rstudio.com/web/packages/ghibli/index.html)

> “No matter how many weapons you have, no matter how great your
> technology might be, the world cannot live without love\!” —*Castle in
> the Sky (1986)*

｡◕‿‿◕｡ Sprinkle some Studio Ghibli palette magic over your R plots
｡◕‿‿◕｡

## Installation

Install the latest stable version on CRAN…

``` r
install.packages('ghibli')
```

…or get the development version from GitHub.

``` r
# If you haven't installed remotes yet, do so
install.packages("remotes")

# install package from github
remotes::install_github("ewenme/ghibli")
```

## Palettes

``` r
# load package
library(ghibli)

# see palette names and colours
par(mfrow=c(9,3))
for(i in names(ghibli_palettes)) print(ghibli_palette(i))
```

![](man/figures/README-palettes-1.png)<!-- -->

### Spirited Away

![](https://vice-images.vice.com/images/content-images-crops/2016/07/19/spirited-away-ghibli-miyazaki-15th-15-year-anniversary-best-animation-hannah-ewens-body-image-1468945005-size_1000.jpg?output-quality=75.jpg)

``` r
ghibli_palette("SpiritedMedium")
```

![](man/figures/README-unnamed-chunk-4-1.png)<!-- -->

### My Neighbor Totoro

![](http://78.media.tumblr.com/1d93af19859c5d79bd9ce518eedeeb91/tumblr_mv2zrkquSJ1s6aghro1_1280.jpg)

``` r
ghibli_palette("TotoroMedium")
```

![](man/figures/README-unnamed-chunk-5-1.png)<!-- -->

### Princess Mononoke

![](http://www.animationmagazine.net/wordpress/wp-content/uploads/Princess-Mononoke-post2.jpg)

``` r
ghibli_palette("MononokeMedium")
```

![](man/figures/README-unnamed-chunk-6-1.png)<!-- -->

### When Marnie Was There

![](http://cinema.pfpca.org/sites/cinema/files/films/Marnie_A.jpg)

``` r
ghibli_palette("MarnieMedium1")
```

![](man/figures/README-unnamed-chunk-7-1.png)<!-- -->

### Ponyo

![](https://entropymag.org/wp-content/uploads/2015/10/Ponyo-screencaps-ponyo-on-the-cliff-by-the-sea-30547658-1920-1080.png)

``` r
ghibli_palette("PonyoMedium")
```

![](man/figures/README-unnamed-chunk-8-1.png)<!-- -->

## In the wild

``` r
library(ggplot2)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_jitter(size = 3) +
  scale_color_manual(values = rev(ghibli_palette("MarnieMedium1"))) +
  theme_minimal() +
  labs(title="Marnie Medium (1) Palette Test",
       subtitle="A plot that is only useful for demonstration purposes")
```

![](man/figures/README-ggplot2-eg-1.png)<!-- -->

## Credits

This package was inspired by (and lots of code ported from) [Karthik
Ram’s `wesanderson` package](https://github.com/karthik/wesanderson).

The palettes mostly come from Love magazine’s [STUDIO GHIBLI
FOREVER](http://www.thelovemagazine.co.uk/posts/6584/in-photos-guess-who-s-back-retrospective-of-studio-ghibli-forever-is-here)
retrospective. [Kiki’s Delivery
Service](http://moviesincolor.com/post/64877406577/hayao-miyazaki-week-kikis-delivery-service-1989)
and [My Neighbor
Totoro](http://moviesincolor.com/post/64786383878/hayao-miyazaki-week-my-neighbor-totoro-1988)
palettes come from [Movies in Color](http://moviesincolor.com/). Go
check ’em.
