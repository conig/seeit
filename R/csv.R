#' csv
#'
#' Open a data.frame in excel
#' @param x a data.frame (list columns not supported)
#' @export

csv <- function(x){
  path <- tempfile(fileext = ".csv")
  if("list" %in% sapply(x, class)) stop("data.frames with list columns cannot be viewed in csv")
  write.csv(x, path, row.names = TRUE)
  system2("open", shQuote(path))
}

#' d
#'
#' Opens a specified directory in explorer
#' @param path path to dir. Defaults to the current working directory
#' @export

 d <- function(path = getwd()){
  system2("open", shQuote(path), invisible = FALSE)
 }

 #' fn
 #'
 #' Opens a function as an R script
 #' @param x a function object (not the name)
 #' @examples seeit::fn(stats::sd)
 #' @export

 fn <- function(x){
   path <- tempfile(fileext = ".R")
   if(!is(x, "function")) stop("Use the function object, not its name as the input")
  lines <- paste(capture.output(x), collapse = "\n")
  write(lines, path)
   system2("open", shQuote(path))
 }
