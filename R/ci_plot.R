utils::globalVariables(c("vname"))
#' Confidence interval plot with point estimate
#' 
#' Horizontal forest plot of point estimate with confidence intervals. 
#' Includes dichotomous or olr, depending on number of levels in "x".
#' Title and axis labels can be added to the ggplot afterwards.
#'
#' @param ds data set
#' @param x text string of main exposure variable
#' @param y text string of outcome variable
#' @param vars variables for multivariate analysis.
#' @param dec Decimals in labels
#' @param lbls Labels for variable names
#' @param title Plot title. Can be specified later.
#'
#' @return ggplot element
#' @export
#'
#' @import ggplot2
#' @importFrom MASS polr
#' @importFrom stats as.formula coef confint lm quantile reorder binomial glm
#'
#' @examples
#' data(talos)
#' talos[,"mrs_1"]<-factor(talos[,"mrs_1"],ordered=TRUE)
#' ci_plot(ds = talos, x = "rtreat", y = "mrs_1", vars = c("hypertension","diabetes"))
ci_plot<- function(ds, x, y, vars=NULL, dec=3, lbls=NULL, title=NULL){
  
  if (!is.factor(ds[,y])) stop("Outcome has to be factor")
  
  # Formula
  ci_form <- as.formula(paste0(y,"~",x,"+."))
  
  # Ordinal logistic regression for non-dichotomous factors
  if (length(levels(ds[,y])) > 2){
    m <- MASS::polr(formula = ci_form, data=ds[,unique(c(x, y, vars))], 
                    Hess=TRUE, method="logistic")
    if (is.null(title)) title <- "Ordinal logistic regression"
  }
  
  # Binary logistic regression for dichotomous factors
  if (length(levels(ds[,y])) == 2){
    m <- glm(formula = ci_form, data=ds[unique(c(x, y, vars))],
             family=binomial())
    if (is.null(title)) title <- "Binary logistic regression"
  }
  
  odds <- data.frame(cbind(exp(coef(m)), exp(confint(m))))
 
  names(odds)<-c("or", "lo", "up")
  rodds<-round(odds, digits = dec)
  
  if (is.null(lbls)){
    odds$vname<-paste0(row.names(odds)," \n",
                       paste0(rodds$or," 
                              [",rodds$lo,":",rodds$up,"]"))
  } else {
    odds$vname<-paste0(lbls," \n",paste0(rodds$or,
                                         " [",rodds$lo,":",rodds$up,"]"))
    
  }
  
  odds$ord<-rev(seq_len(nrow(odds)))
  
  ggplot2::ggplot(data = odds, 
                  mapping = ggplot2::aes(y = or, x = reorder(vname,ord))) +
    ggplot2::geom_point() +
    ggplot2::geom_errorbar(mapping = ggplot2::aes(ymin=lo, ymax=up), 
                           width = 0.2) +
    ggplot2::scale_y_log10() +
    ggplot2::geom_hline(yintercept = 1, linetype=2) +
    ggplot2::labs(title=title) +
    ggplot2::coord_flip()
}


