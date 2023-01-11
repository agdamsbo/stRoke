utils::globalVariables(c("or","ord","lo","up"))

#' Forest plot from ordinal logistic regression.
#'
#' Heavily inspired by https://www.r-bloggers.com/plotting-odds-ratios-aka-a-forrestplot-with-ggplot2/
#'
#' @param x input data.
#' @param title plot title
#' @param dec decimals for labels
#' @param lbls labels for variable names. Careful, as the right order is not checked automatically!
#' @param hori labels the horizontal axis (this i the y axis as the plot is rotated)
#' @param vert labels the horizontal axis (this i the x axis as the plot is rotated)
#' @param short flag to half number of ticks on horizontal axis.
#' @param input can be either "model", which is a olr model (polr()), or "df", which is a data frame with three columns for OR, lower CI and upper CI.
#'
#' @return gg object
#' @keywords forest plot
#' 
#' @import ggplot2
#' 
#' @importFrom MASS polr
#' @importFrom stats as.formula
#' @importFrom stats coef
#' @importFrom stats confint
#' @importFrom stats formula
#' @importFrom stats lm
#' @importFrom stats quantile
#' @importFrom stats reorder
#' 
#' @export
#' 
#' @examples
#' iris$ord<-factor(sample(1:3,size=nrow(iris),replace=TRUE),ordered=TRUE)
#' lm <- MASS::polr(ord~., data=iris, Hess=TRUE, method="logistic")
#' plot_olr(lm, input="model")

plot_olr<-function(x, title = NULL, dec=3, lbls=NULL, hori="OR (95 % CI)", 
                   vert="Variables", short=FALSE, input=c("model","df")){
  
  if (input=="model"){
    odds <- data.frame(cbind(exp(coef(x)), exp(confint(x))))
  }
  
  if (input=="df"){
    odds <- x
  }
  names(odds)<-c("or", "lo", "up")
  rodds<-round(odds, digits = dec)
  
  if (!is.null(lbls)){
    odds$vars<-paste0(lbls," \n",
                      paste0(rodds$or," [",rodds$lo,":",rodds$up,"]"))
  } else {
    odds$vars<-paste0(row.names(odds)," \n",
                      paste0(rodds$or," [",rodds$lo,":",rodds$up,"]"))
  }
  
  ticks<-c(seq(0, 1, by =.1), seq(1, 10, by =1), seq(10, 100, by =10))
  
  if (short==TRUE){
    ticks<-ticks[seq(1, length(ticks), 2)]
  }
  
  odds$ord<-c(nrow(odds):1)
  
  odds|>
    ggplot2::ggplot(mapping = ggplot2::aes(y = or, x = reorder(vars,ord))) +
    ggplot2::geom_point() +
    ggplot2::geom_errorbar(mapping = ggplot2::aes(ymin=lo, ymax=up), width=.2) +
    ggplot2::scale_y_log10(breaks=ticks, labels = ticks) +
    ggplot2::geom_hline(yintercept = 1, linetype=2) +
    ggplot2::coord_flip() +
    ggplot2::labs(title = title, x = vert, y = hori) +
    ggplot2::theme_bw(14)
}
