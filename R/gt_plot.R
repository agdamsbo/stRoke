
#' Plot a gt or gtsummary table as ggplot object
#'
#' Relying on `library(magick)` and `library(webshot2)`
#' @param x A 'gt' or 'gtsummary' table
#' @param ... Additional arguments to be passed to gt::gtsave
#'
#' @return gg/ggplot element
#' @export
#' 
#' @references 
#' Please refer 
#' to [MSKCC-Epi-Bio/bstfun](https://github.com/MSKCC-Epi-Bio/bstfun)
#'
#' @importFrom magick image_read image_ggplot
#' @importFrom gtsummary as_gt tbl_summary
#' @importFrom gt gtsave
#' 
#' @examples
#' #gt_plot(mtcars |> gtsummary::tbl_summary())
gt_plot <- function (x, ...)
{
  if (!inherits(x, c("gt_tbl", "gtsummary")))
    stop("`x=` must be a 'gt' or 'gtsummary' table", call. = FALSE)
  
  if (inherits(x, "gtsummary"))
    x <- gtsummary::as_gt(x)
  path_gt_table_image <- tempfile(fileext = ".png")
  gt_table_image <-
    gt::gtsave(x, filename = path_gt_table_image, ...)
  
  magick::image_read(path_gt_table_image) |>
    magick::image_ggplot(interpolate = TRUE)
}
#'