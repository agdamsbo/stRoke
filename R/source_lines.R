#' Source only specific lines from an R file
#' 
#' Copied from a gist by christophergandrud (https://gist.github.com/christophergandrud/1eb4e095974204b12af9)
#' This function is really helpfull when working on eg sst.dk-servers. You can not load packages, so you have to re-write this function. It is short, and you will manage!
#' @param file character string with path to the source file
#' @param lines numeric vector of the lines to source from 'file'
#' @param ... further arguments to be passed to source
#'
#' @return list
#' @export
#' 
source_lines <- function(file, lines, ...){
  source(textConnection(readLines(file)[lines]), ...)
}
