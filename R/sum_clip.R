#' sum_clip
#'
#' Sum values in a clipboard taken from excel'
#' @param big.mark bool. If TRUE commas are inserted to differentiate long digits
#' @param return_x bool. If you want to see the input vector
#' @export

sum_clip <- function(big.mark = TRUE, return_x = FALSE){

  x <- unname(unlist(clipr::read_clip_tbl(header = FALSE)))
  if(return_x) return(x)
  x <- as.numeric(gsub("\\,", "", x))
  x <- sum(x)

  if(!big.mark) return(x)
  format(x, big.mark = ",")
}
