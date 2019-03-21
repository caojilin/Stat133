#' @title Die
#' @description Creates an object of class \code{"die"}
#' @param sides vector of die sides
#' @param prob vector of side probabilities
#' @return an object of class \code{"die"}
#' @export
#' @examples
#' # default
#' die1 <- die()
#'

die = function(sides=c(1,2,3,4,5,6),prob=rep(1/6,6)){
  # sides_default = c(1,2,3,4,5,6)
  # prob_default = rep(1/6,6)
  check_sides(sides)
  check_prob(prob)
  object = data.frame(side = sides,prob = prob,stringsAsFactors = FALSE)
  class(object) = "die"
  object
}

#' @export
print.die = function(x){
  cat("object 'die'\n\n")
  cd = list(side = x$side,prob = x$prob)
  print(cd)
  invisible(x)
}

#' @rdname die
#' @param x an R object
#' @export
is.die <- function(x) {
  is(x, "die")
}

# private function to check vector of sides
check_sides = function(sides){
  if(length(sides) != 6){
    stop("'side' must be a vector of length 6")
  }
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  TRUE
}

# private function to check vector of probabilities
check_prob = function(prob){
  if(length(prob) !=6 | !is.numeric(prob)){
    stop("length is not 6")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}


