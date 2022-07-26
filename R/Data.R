#' @title Fake Star Wars Data
#'
#' @description A data set of fictional Star Wars characters and their associated giving to the University of Idaho.
#'
#' @format A data frame with 6 variables and 98 rows:
#' \desribe{
#'     \item{Primary_ID}{A unique identifier to mark the individual record}
#'     \item{Spouse_ID}{A unique identifier to mark the spouse of the primary individual}
#'     \item{Name}{The name of the individual associated with primary ID}
#'     \item{Martial_Status}{Binary indicator of 2 values: Married or Single}
#'     \item{Address}{Fake address describing where the individual lives}
#'     \item{Giving}{Number describing the imperial credit amounts donated}
#'     \item{Household_Primary}{Individual who is considered the primary contact in a household}
#' }
#' @source <https://www.github.com/jwisaacson41/UIWrangleR>
"starwars_donors"
