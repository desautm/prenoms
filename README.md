
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis-CI Build
Status](https://travis-ci.org/desautm/prenoms.svg?branch=master)](https://travis-ci.org/desautm/prenoms)

# prenoms

Le but de prenoms est de donner les prénoms des enfants du Québec de
1980 à 2019.

## Installation

Vous pouvez installer prenoms à partir de github avec:

``` r
# install.packages("devtools")
devtools::install_github("desautm/prenoms")
```

## Exemple

Voici la répartition des quatre prénoms des membres de ma famille de
1980 à 2019.

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(ggplot2)
library(prenoms)
```

``` r
famille <- prenoms %>%
  filter(
    prenom == "Marc-Andre" & sexe == "M" |
    prenom == "Laurent" & sexe == "M" |
    prenom == "Melanie" & sexe == "F" |
    prenom == "Anna" & sexe == "F"
  ) %>%
  group_by(prenom, annee, sexe) %>%
  summarise(n = sum(n)) %>%
  arrange(annee)
#> `summarise()` regrouping output by 'prenom', 'annee' (override with `.groups` argument)

ggplot(data = famille, aes(x = annee, y = n, color = prenom))+
  geom_line()+
  scale_x_continuous( breaks = seq(1980, 2025, by = 5))
```

<img src="README-example-1.png" width="100%" />
