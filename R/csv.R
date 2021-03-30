#' csv
#'
#' Open a data.frame in excel
#' @param x a data.frame (list columns not supported)
#' @export

csv <- function(x){
  path <- tempfile(fileext = ".csv")
  if("list" %in% sapply(x, class)) stop("data.frames with list columns cannot be viewed in csv")
  write.csv(x, path, row.names = TRUE)
  system2("open", path)
}
