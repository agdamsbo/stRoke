utils::globalVariables(c("df","group","score","strata"))

#' Generic stroke study outcome
#' 
#' Includes table 1, grotta bars and ordinal logistic regression plot. 
#' Please just use this function for illustration purposes.
#' To dos: modify grottaBar and include as own function.
#'
#' @param df Data set as data frame
#' @param group Variable to group by
#' @param score Outcome measure variable
#' @param strata Optional variable to stratify by
#' @param variables String of variable names to include in adjusted OLR-analysis
#'
#' @return Returns list with three elements
#' @export
#'
#' @import ggplot2
#' @importFrom gtsummary tbl_summary
#' @importFrom gtsummary add_overall
#' @importFrom MASS polr
#' @importFrom rankinPlot grottaBar
#'
#' @examples
#' generic_stroke(stRoke::talos, "rtreat", "mrs_6", 
#' variables = c("hypertension","diabetes","civil"))
generic_stroke <- function(df, group, score, strata = NULL, variables = NULL)
  {
  # if (!is.factor(df[,group])){
  #   df[,group] <- factor(df[,group])
  # }
  t1<-gtsummary::tbl_summary(data = df[,c(group,variables)], 
                             by = group) |> 
    gtsummary::add_overall()
  
  x <- table(df[,c(group, score, strata)])
  f1 <- rankinPlot::grottaBar(x = x, groupName = group,
                              scoreName = score,
                              strataName = strata,
                              colourScheme ="custom")
  
  df[,score] <- factor(df[,score],ordered = TRUE)
  f2 <- plot_olr(MASS::polr(formula(paste0(score,"~.")), 
                            data=df[,c(group, score, variables)], Hess=TRUE, 
                            method="logistic"), input="model")
  
  list("Table 1" = t1, "Figure 1" = f1, "Figure 2" = f2)
}
