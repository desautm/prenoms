library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(devtools)

gars <- read_csv("data-raw/gars1980-2020.csv", na = c("", "NA", 0), skip = 5)
filles <- read_csv("data-raw/filles1980-2020.csv", na = c("", "NA", 0), skip = 5)

prenoms_gars <- gars %>%
  select(-Total) %>%
  rename(prenom = `Prénom/Année`) %>%
  filter(prenom != "Somme:") %>%
  pivot_longer(-prenom, names_to = "annee", values_to = "n") %>%
  mutate(sexe = "M") %>%
  mutate(
    prenom = str_to_title(prenom),
    n = as.integer(n),
    annee = as.integer(annee)
  )

prenoms_filles <- filles %>%
  select(-Total) %>%
  rename(prenom = `Prénom/Année`) %>%
  filter(prenom != "Somme:") %>%
  pivot_longer(-prenom, names_to = "annee", values_to = "n") %>%
  mutate(sexe = "F") %>%
  mutate(
    prenom = str_to_title(prenom),
    n = as.integer(n),
    annee = as.integer(annee)
  )

prenoms <-
  bind_rows(prenoms_gars, prenoms_filles) %>%
  filter( !is.na(prenom), !is.na(annee), !is.na(n), !is.na(sexe)) %>%
  select(annee, sexe, prenom, n) %>%
  # group_by(annee, sexe) %>%
  # mutate(prop = n/sum(n)) %>%
  arrange(annee, sexe, prenom)

use_data(prenoms, overwrite = TRUE)
