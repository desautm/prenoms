library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(devtools)

boys <- read_csv("data-raw/gars1980-2020.csv", na = c("", "NA", 0), skip = 5)
girls <- read_csv("data-raw/filles1980-2020.csv", na = c("", "NA", 0), skip = 5)

names_boys <- boys %>%
  select(-Total) %>%
  rename(name = `Prénom/Année`) %>%
  filter(name != "Somme:") %>%
  pivot_longer(-name, names_to = "year", values_to = "n") %>%
  mutate(sex = "M") %>%
  mutate(
    name = str_to_title(name),
    n = as.integer(n),
    year = as.integer(year)
  )

names_girls <- girls %>%
  select(-Total) %>%
  rename(name = `Prénom/Année`) %>%
  filter(name != "Somme:") %>%
  pivot_longer(-name, names_to = "year", values_to = "n") %>%
  mutate(sex = "F") %>%
  mutate(
    name = str_to_title(name),
    n = as.integer(n),
    year = as.integer(year)
  )

prenoms <-
  bind_rows(names_boys, names_girls) %>%
  filter( !is.na(name), !is.na(year), !is.na(n), !is.na(sex)) %>%
  select(year, sex, name, n) %>%
  # group_by(year, sex) %>%
  # mutate(prop = n/sum(n)) %>%
  arrange(year, sex, name)

use_data(prenoms, overwrite = TRUE)
