#' sum_clip
#'
#' Sum values in a clipboard taken from excel'
#' @param big.mark bool. If TRUE commas are inserted to differentiate long digits
#' @export

sum_clip <- function(big.mark = TRUE){

  x <- unlist(clipr::read_clip_tbl(header = FALSE))
  x <- as.numeric(gsub("\\,", "", x))
  x <- sum(x)

  if(!big.mark) return(x)
  format(x, big.mark = ",")
}
