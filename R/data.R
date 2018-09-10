#' Prenoms des bebes du Quebec entre 1980 et 2017
#'
#' Une base de donnes contenant les prenoms des enfants du Quebec
#' entre 1980 et 2017.
#'
#' @format Une base de donnees contenant 13 511 308 lignes et 5 colonnes:
#' \describe{
#'   \item{annee}{Annee}
#'   \item{sexe}{F pour feminin et M pour masculin}
#'   \item{prenom}{Prenom}
#'   \item{n}{Frequence}
#'   \item{prop}{Proportion}
#' }
#' @importFrom tibble tibble
#' @source \url{https://www.donneesquebec.ca/recherche/fr/dataset/banque-de-prenoms-garcons}
#' @source \url{https://www.donneesquebec.ca/recherche/fr/dataset/banque-de-prenoms-filles}
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
"prenoms"
