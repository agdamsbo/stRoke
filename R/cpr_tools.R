#' CPR check
#'
#' Checking validity of cpr number. Vectorised.
#' @param cpr cpr-numbers as ddmmyy"-."xxxx or ddmmyyxxxx. Also mixed formatting. Vector or data frame column.
#' @keywords cpr
#'
#' @return Logical vector of cpr validity
#' @export
#'
#' @examples 
#' fsd<-c("2310450637", "010190-2000", "010115-4000","300450-1030","010150-4021")
#' cpr_check("2310450637")
#' cpr_check(fsd)
#' all(cpr_check(fsd))
cpr_check<-function(cpr){
  # Check validity of CPR number, format ddmmyy-xxxx
  # Build upon data from this document: https://cpr.dk/media/12066/personnummeret-i-cpr.pdf
  ## OBS according to new description, not all valid CPR numbers apply to this modulus 11 rule.
  message(
    "OBS: according to new description, not all valid CPR numbers apply to this modulus 11 rule. 
    Please refer to: https://cpr.dk/media/12066/personnummeret-i-cpr.pdf")
  
  str_length <- nchar(cpr) 
  # Calculating length of each element in vector
  
  cpr_short <- paste0(substr(cpr,1,6),substr(cpr,str_length-3,str_length)) 
  # Subsetting strings to first 6 and last 4 characters to short format cpr.
  
  cpr_matrix <- matrix(as.numeric(unlist(strsplit(cpr_short,""))),nrow=10)
  # Splitting all strings by each character to list, unlisting and creating matrix. Default is by column.
  
  test_vector <- c(4,3,2,7,6,5,4,3,2,1)
  # Multiplication vector from https://cpr.dk/media/12066/personnummeret-i-cpr.pdf
  
  colSums(cpr_matrix*test_vector) %% 11 == 0
  # Testing if modulus 11 == 0 of sums of matrix * multiplication vector.
}

#' Extracting date of birth from CPR
#'
#' For easy calculation. Does not handle cprs with letters (interim cpr)
#' @param cpr cpr-numbers as ddmmyy"-."xxxx or ddmmyyxxxx. Also mixed formatting. Vector or data frame column.
#' @keywords cpr
#'
#' @return vector of Date elements. Format yyyy-mm-dd
#' @export
#'
#' @examples
#' cpr_dob("231045-0637")
#' fsd<-c("2310450637", "010190-2000", "010115-4000","300450-1030","010150-4021")
#' cpr_dob(fsd)
cpr_dob<-function(cpr){
  ## Input as cpr-numbers in format ddmmyy-xxxx
  ## Build upon data from this document: https://cpr.dk/media/12066/personnummeret-i-cpr.pdf
  
  dobs<-c()
  
  a00<-c(0:99)
  a36<-c(0:36)
  a57<-c(0:57)
  
  b00<-c(0:3)
  b36<-c(4,9)
  b57<-c(5:8)
  
  str_length <- nchar(cpr) 
  # Calculating length of each element in vector
  
  cpr_short <- paste0(substr(cpr,1,6),substr(cpr,str_length-3,str_length)) 
  # Subsetting strings to first 6 and last 4 characters to short format cpr.
  
  year <- as.numeric(substr(cpr_short,5,6))
  
  ddmmyy <- as.Date(substr(cpr_short,1,6),format="%d%m%y")
  
  for (i in seq_along(cpr)){
    
    p56 <- year[i]
    
    p8 <- substr(cpr_short[i],7,7) 
    # p8 is position 8 from the traditional cpr ddmmyy-xxxx, pos 7 in short version.
    
    birth <- ddmmyy[i]
    
    if (((p56%in%a00)&&(p8%in%b00)))
    {
      dob<-as.Date(format(birth, format="19%y%m%d"), format="%Y%m%d")
    }
    else if (((p56%in%a36)&&(p8%in%b36)))
    {
      dob<-as.Date(format(birth, format="20%y%m%d"), format="%Y%m%d")
    }
    else if ((!(p56%in%a36)&&(p8%in%b36)))
    {
      dob<-as.Date(format(birth, format="19%y%m%d"), format="%Y%m%d")
    }
    else if (((p56%in%a57)&&(p8%in%b57)))
    {
      dob<-as.Date(format(birth, format="20%y%m%d"), format="%Y%m%d")
    }
    else if ((!(p56%in%a57)&&(p8%in%b57)))
    {
      dob<-as.Date(format(birth, format="18%y%m%d"), format="%Y%m%d")
    }
    else {print("Input contains data in wrong format")
    }
    dobs[i]<-dob
    
  }
  
  as.Date(dobs, origin = "1970-01-01")
  
}

#' Determine female sex from CPR
#'
#' Just checking if last number of a string is equal or not.
#' @param cpr Vector. cpr-numbers as ddmmyy"-."xxxx or ddmmyyxxxx. Also mixed formatting. Vector or data frame column.
#' @keywords cpr
#' 
#' @return Logical vector
#' @export
#' @examples
#' cpr_female(stroke::cprs[,1])
cpr_female<-function(cpr){
  if (!is.vector(cpr)) stop("Input has to be vector") 

  x <- nchar(as.character(cpr)) # Formats as character to avoid confusions
  
  as.integer(substr(cpr, start = x, stop = x)) %% 2 == 0
}
