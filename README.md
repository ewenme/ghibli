
ghibli
======

[![Build Status](https://travis-ci.org/ewenme/ghibli.png)](https://travis-ci.org/ewenme/ghibli)
[![Made with](https://img.shields.io/badge/made%20with-love-ff69b4.svg)]()

![](ghibli.jpg)

> ｡◕‿‿◕｡ Sprinkle some Studio Ghibli palette magic over your R plots ｡◕‿‿◕｡

Installation
------------

Get the development version from GitHub right now.

``` r
# If you haven't installed remotes yet, do so
install.packages("remotes")

# install package from github
remotes::install_github("ewenme/ghibli")
```

Palettes
--------

``` r
# load package
library(ghibli)

# see palette names and colours
par(mfrow=c(7,3))
for(i in names(ghibli_palettes)) print(ghibli_palette(i))
```

![](figure/palettes-1.png)

### Spirited Away

![](https://vice-images.vice.com/images/content-images-crops/2016/07/19/spirited-away-ghibli-miyazaki-15th-15-year-anniversary-best-animation-hannah-ewens-body-image-1468945005-size_1000.jpg?output-quality=75.jpg)

``` r
ghibli_palette("SpiritedMedium")
```

![](figure/unnamed-chunk-3-1.png)

### Princess Mononoke

![](http://www.animationmagazine.net/wordpress/wp-content/uploads/Princess-Mononoke-post2.jpg)

``` r
ghibli_palette("MononokeMedium")
```

![](figure/unnamed-chunk-4-1.png)

### When Marnie Was There

![](http://cinema.pfpca.org/sites/cinema/files/films/Marnie_A.jpg)

``` r
ghibli_palette("MarnieMedium1")
```

![](figure/unnamed-chunk-5-1.png)

### Ponyo

![](https://entropymag.org/wp-content/uploads/2015/10/Ponyo-screencaps-ponyo-on-the-cliff-by-the-sea-30547658-1920-1080.png)

``` r
ghibli_palette("PonyoMedium")
```

![](figure/unnamed-chunk-6-1.png)

Usage
-----

``` r
library("ggplot2")

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  scale_color_manual(values = rev(ghibli_palette("MarnieMedium1"))) +
  theme_grey()
```

![](figure/ggplot-1.png)

``` r

ggplot(airquality, aes(x=Day, y=Month)) +
  geom_tile(aes(fill=Temp)) +
  scale_fill_gradientn(colours = ghibli_palette("MononokeMedium", 21, type = "continuous")) +
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) +
  coord_equal() +
  theme(legend.position = "top")
```

![](figure/ggplot2-1.png)

Credits
-------

This package was inspired by (and lots of code ported from) [Karthik Ram's `wesanderson` package](https://github.com/karthik/wesanderson).

The palettes come from Love magazine's [STUDIO GHIBLI FOREVER](http://www.thelovemagazine.co.uk/posts/6584/in-photos-guess-who-s-back-retrospective-of-studio-ghibli-forever-is-here) retrospective. Go check it.
