#' @title notin
#'
#' @description Search a vector for elements that are not in another vector
#'
#' @details Negation of the %in% function
#'
#' @export
#'
#' @examples
#' fruits<-c("apple", "bannas", "cherries", "peaches")
#' favorite_fruits<-c("apple", "cherries")
#' disliked_fruits<-fruits[fruits %notin% favorite_fruits]
#' disliked_fruits

`%notin%`<- Negate(`%in%`)
