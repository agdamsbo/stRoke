#' Download REDCap data
#' 
#' Wrapper function for using REDCapR::redcap_read and REDCapRITS::REDCap_split including some clean-up.
#' Handles 
#' @param uri REDCap database uri
#' @param token API token
#' @param records records to download
#' @param fields fields to download
#' @param events events to download
#' @param forms forms to download
#' @param generics vector of auto-generated generic variable names to ignore when discarding empty rows
#'
#' @return list of instruments
#' @export 
#'
#' @examples
#' # Examples will be provided later
read_redcap_tables <- function(uri,
                             token,
                             records=NULL,
                             fields=NULL,
                             events=NULL,
                             forms=NULL,
                             generics=c("record_id", "redcap_event_name", "redcap_repeat_instrument", "redcap_repeat_instance")){
  
  if (requireNamespace("REDCapRITS", quietly = FALSE)) {
      cli::cli_abort(
        c("x" = "The package REDCapRITS is not installed.",
          "i" = "Please install REDCapRITS by running \"remotes::install_github('agdamsbo/REDCapRITS/R')\".")
      )

  }

  
  # Notes to self: Based on the metadata, this functionality could be introduced without using the REDCapRITS package.. To be tried..
  
  d <- REDCapR::redcap_read (redcap_uri = uri,
                             token = token,
                             fields=fields,
                             events=events,
                             forms=forms,
                             records=records)
  
  m <- REDCapR::redcap_metadata_read (redcap_uri = uri,token = token)
  
  l <- REDCapRITS::REDCap_split(d$data, m$data[m$data$field_name %in% names(d$data),], forms = "all")
  
  lapply(l, function(i){
    if (ncol(i) > 2){
      s <- data.frame(i[,!colnames(i) %in% generics])
      i[!apply(is.na(s),MARGIN=1, FUN=all), ] 
    } else {i}
  } )

}