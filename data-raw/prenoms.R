library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(devtools)

gars <- read_csv("data-raw/gars1980-2017.csv")
filles <- read_csv("data-raw/filles1980-2017.csv")

prenoms_gars <- gather(gars, key = annee, value = n, -Prenom) %>%
  mutate(sexe = "M")
prenoms_filles <- gather(filles, key = annee, value = n, -Prenom) %>%
  mutate(sexe = "F")

prenoms <- bind_rows(prenoms_gars, prenoms_filles) %>%
  filter( !is.na(Prenom), !is.na(annee), !is.na(n), !is.na(sexe)) %>%
  rename(prenom = Prenom) %>%
  mutate(
    prenom = str_to_title(prenom),
    n = as.integer(n),
    annee = as.integer(annee)
  ) %>%
  select(annee, sexe, prenom, n) %>%
  group_by(annee, sexe) %>%
  mutate(prop = n/sum(n)) %>%
  ungroup() %>%
  arrange(annee, sexe, prenom)

use_data(prenoms, overwrite = TRUE)
