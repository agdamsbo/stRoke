#' CPR check
#'
#' Checking validity of cpr number. Vectorised.
#' @param cpr cpr-numbers as ddmmyy[-.]xxxx or ddmmyyxxxx. Also mixed formatting. Vector or data frame column.
#' @keywords cpr
#'
#' @return Logical vector
#' @export
#'
#' @examples
#' fsd<-c("2310450637", "010115-4000", "0101896000","010189-3000","300450-1030","010150-4021")
#' cpr_check(fsd)
#' all(cpr_check(fsd))
cpr_check<-function(cpr){
  # Check validity of CPR number, format ddmmyy-xxxx
  # Build upon data from this document: https://cpr.dk/media/167692/personnummeret%20i%20cpr.pdf
  
  v <- c()
  
  for (i in seq_along(cpr)){
    x <- cpr[i]
    
    if (!substr(x,7,7)%in%c("-",".")){ # Added check to take p8 if ddmmyy[-.]xxxx,
      x<-paste(substr(x,1,6),substr(x,7,10),collapse="-")
    }
    
    p1<-as.integer(substr(x,1,1))
    p2<-as.integer(substr(x,2,2))
    p3<-as.integer(substr(x,3,3))
    p4<-as.integer(substr(x,4,4))
    p5<-as.integer(substr(x,5,5))
    p6<-as.integer(substr(x,6,6))
    p7<-as.integer(substr(x,8,8))
    p8<-as.integer(substr(x,9,9))
    p9<-as.integer(substr(x,10,10))
    p10<-as.integer(substr(x,11,11))
    
    v[i] <- if((p1*4+p2*3+p3*2+p4*7+p5*6+p6*5+p7*4+p8*3+p9*2+p10) %% 11 == 0) TRUE else FALSE
    
  }
  
  return(v)
}

#' Extracting date of birth from CPR
#'
#' For easy calculation.
#' @param cpr cpr-numbers as ddmmyy[-.]xxxx or ddmmyyxxxx. Also mixed formatting. Vector or data frame column.
#' @keywords cpr
#'
#' @return vector of Date elements. Format yyyy-mm-dd
#' @export
#'
#' @examples
#' cpr_dob("231045-0637")
#' fsd<-c("010190-2000", "010115-4000", "0101896000","010189-3000","300450-1030","010150-4021")
#' cpr_dob(fsd)
cpr_dob<-function(cpr){
  ## Input as cpr-numbers in format ddmmyy-xxxx
  ## Build upon data from this document: https://cpr.dk/media/167692/personnummeret%20i%20cpr.pdf
  
  dobs<-c()
  
  a00<-as.numeric(c(0:99))
  a36<-as.numeric(c(0:36))
  a57<-as.numeric(c(0:57))
  b00<-as.numeric(c(0,1,2,3))
  b36<-as.numeric(c(4,9))
  b57<-as.numeric(c(5,6,7,8))
  
  for (i in seq_along(cpr)){
    x <- cpr[i]
    
    p56<-as.numeric(substr(x,5,6))
    
    if (substr(x,7,7)%in%c("-",".")){
      p8<-as.numeric(substr(x,8,8))           # Added check to take p8 if ddmmyy[-.]xxxx,
    } else {p8<-as.numeric(substr(x,7,7))}    # or p7 if ddmmyyxxxx
    
    birth<-as.Date(substr(x,1,6),format="%d%m%y")
    
    
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
    else {print("Input contains data in wrong format") # test if position 5,6 or 8 contains letters as is the case for temporary cpr-numbers
    }
    dobs[i]<-dob
    
  }
  
  as.Date(dobs, origin = "1970-01-01")
  
}

#' Determine female sex from CPR
#'
#' Just checking if last number of a string is equal or not.
#' @param cpr cpr-numbers as ddmmyy[-.]xxxx or ddmmyyxxxx. Also mixed formatting. Vector or data frame column.
#' @keywords cpr
#' 
#' @return Logical vector
#' @export
#' @examples
#' cpr_female("231045-0637")
cpr_female<-function(cpr){
  ##Input as vector of DK cpr numbers, format "ddmmyy-xxxx", returns sex according to cpr
  x <- nchar(as.character(cpr)) # Formats as character to avoid confusions
  
  as.logical(as.integer(substr(cpr, start = x, stop = x)) %% 2)
}
