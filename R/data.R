#' Prenoms des bebes du Quebec entre 1980 et 2020
#'
#' Une base de donnes contenant les prenoms des enfants du Quebec
#' entre 1980 et 2020.
#'
#' @format Une base de donnees contenant 769 890 lignes et 4 colonnes:
#' \describe{
#'   \item{annee}{Annee}
#'   \item{sexe}{F pour feminin et M pour masculin}
#'   \item{prenom}{Prenom}
#'   \item{n}{Frequence}
#' }
#' @importFrom tibble tibble
#' @source \url{https://www.donneesquebec.ca/recherche/dataset/bec46ea8-7bd1-4d81-b9e0-ea9f3ba0c59d/resource/fe6aea67-c2de-42f9-a21b-2db1b35e2f5f/download/gars1980-2020.csv}
#' @source \url{https://www.donneesquebec.ca/recherche/dataset/13db2583-427a-4e5f-b679-8532d3df571f/resource/e1f20072-935d-4a92-91c4-61a12fbe687b/download/filles1980-2020.csv}
#' @examples
#' \dontrun{
#'   library(dplyr)
#'   library(ggplot2)
#'   library(prenoms)
#'
#'   # Prenoms des membres de ma famille
#'   famille <- prenoms %>%
#'     filter(
#'       prenom == "Marc-Andre" & sexe == "M" |
#'       prenom == "Laurent" & sexe == "M" |
#'       prenom == "Melanie" & sexe == "F" |
#'       prenom == "Anna" & sexe == "F"
#'     ) %>%
#'     group_by(prenom, annee, sexe) %>%
#'     summarise(n = sum(n)) %>%
#'     arrange(annee)
#'
#'   # Representation ggplot
#'   ggplot(data = famille, aes(x = annee, y = n, color = prenom))+
#'     geom_line()+
#'     scale_x_continuous( breaks = seq(1980, 2020, by = 5))
#' }
#'
#' \dontrun{
#'   library(dplyr)
#'
#'   # Les 5 prenoms feminins les plus populaires en 2020
#'   prenoms %>%
#'     filter(annee == 2020 & sexe == "F") %>%
#'     select(annee, sexe, prenom, n) %>%
#'     arrange(desc(n)) %>%
#'     head(5)
#' }
"prenoms"
