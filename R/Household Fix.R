#' @title Household Fix
#'
#' @description Combine the values of two columns of ID's into a single new column of ID's
#'
#' @param Missing_IDs (Character): The column containing NA's that need to be removed
#' @param Fill_IDs (Character): The matching column used to substitute the NA vales
#'
#' @return A vector of the IDs with all NA values removed
#' @export
#'
#' @examples
#' household_fix(starwars_donors$Household_Primary, starwars_donors$Primary_ID)

household_fix<-function(Missing_IDs, Fill_IDs){
  ifelse(is.na(Missing_IDs),
         as.character(Fill_IDs),
         as.character(Missing_IDs))
}
