#' @title Generate Import ID
#'
#' @description Create an import ID list to be used for import into UI's CRM software
#'
#' @param list_name (Character) is an single element or a vector of values to be used for creating the list name
#' @param person_id (Character) is a vector containing all of the primary IDs of people that should be in the list
#' @param organization_id (Character) is a vector containing all of the primary IDs of organizations that should be in the list
#' @param prospect_id (Character) is a vector containing all of the GUIDS of prospects that should be in the list
#' @param contribution_id (Character) is a vector containing all of the GUIDS of contributions that should be in the list
#'
#' @return returns a data frame with the rows of c(person_id, organization_id, prospect_id, and contribution_id)
#' @export
#'
#' @examples
#' list<-rep("My List Name", 1:20)
#' people<-paste0("Person", 1:10)
#' organizations<-paste0("Organization", 1:10)
#' generate_importID(list, people, organizations)


generate_importID<-function(list_name, person_id=NULL,
                            organization_id=NULL, prospect_id=NULL,
                            contribution_id=NULL){

  # Create empty data frame to store values

  df<-data.frame(`(Do Not Modify) Import Id` = "",
                 `(Do Not Modify) Row Checksum` = "",
                 `(Do Not Modify) Modified On` = "",
                 `List Name` = "",
                 `Person Id` = "",
                 `Organization ID` = "",
                 `Prospect ID` = "",
                 `Contribution ID` = "")

  # Create people dataframe subset and add to empty data frame
  if(!is.null(person_id)){
    df.people<-data.frame(`(Do Not Modify) Import Id` = "",
                          `(Do Not Modify) Row Checksum` = "",
                          `(Do Not Modify) Modified On` = "",
                          `List Name` = list_name,
                          `Person Id` = person_id,
                          `Organization ID` = "",
                          `Prospect ID` = "",
                          `Contribution ID` = "")
    df<-rbind(df, df.people)
  }

  # Create organization dataframe subset and add to empty data frame (now filled with people)
  if(!is.null(organization_id)){
    df.org<-data.frame(`(Do Not Modify) Import Id` = "",
                       `(Do Not Modify) Row Checksum` = "",
                       `(Do Not Modify) Modified On` = "",
                       `List Name` = list_name,
                       `Person Id` = "",
                       `Organization ID` = organization_id,
                       `Prospect ID` = "",
                       `Contribution ID` = "")
    df<-rbind(df, df.org)
  }
  # Create prospect dataframe subset and add to empty data frame (now filled with people and organizations)
  if(!is.null(prospect_id)){
    df.prospect<-data.frame(`(Do Not Modify) Import Id` = "",
                            `(Do Not Modify) Row Checksum` = "",
                            `(Do Not Modify) Modified On` = "",
                            `List Name` = list_name,
                            `Person Id` = "",
                            `Organization ID` = "",
                            `Prospect ID` = prospect_id,
                            `Contribution ID` = "")
    df<-rbind(df, df.prospect)
  }

  # Create contribution dataframe subset and add to empty data frame (now filled with people, organizations, and prospects)
  if(!is.null(contribution_id)){
    df.contrib<-data.frame(`(Do Not Modify) Import Id` = "",
                           `(Do Not Modify) Row Checksum` = "",
                           `(Do Not Modify) Modified On` = "",
                           `List Name` = list_name,
                           `Person Id` = "",
                           `Organization ID` = "",
                           `Prospect ID` = "",
                           `Contribution ID` = contribution_id)
    df<-rbind(df, df.contrib)
  }

  # Remove empty first row
  df<-df[-1,]

  # Rename columns for final output
  colnames(df)<-c("(Do Not Modify) Import Id",
                  "(Do Not Modify) Row Checksum",
                  "(Do Not Modify) Modified On",
                  "List Name",
                  "Person Id",
                  "Organization ID",
                  "Prospect ID",
                  "Contribution ID")

  # Return data frame value
  return(df)
}
