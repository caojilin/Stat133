#' @title Roll
#' @description Creates an object of class \code{"roll"}
#' @param die object of a die
#' @param times the number of times rolling a die
#' @return an object of class \code{"roll"}
#' @export
#' @examples
#' # default
#' fair_die = die()
#' roll1 <- roll(fair_die,50)
#'
roll = function(die, times=1){
  check_times(times)

  rolls = sample(die$side,replace = TRUE,times)
  make_roll(die$side,die$prob,rolls,times)
}

#' @title Make Roll Object
#' @description Constructor function for object "roll"
#' @param side the side of a die
#' @param prob prob of a die
#' @param rolls the rolls
#' @param times number of rolls
#' @keywords internal
make_roll <- function(side, prob,rolls,times=1) {
  res <- list(
    rolls = rolls,
    sides = side,
    prob = prob,
    total = times
  )
  class(res) <- "roll"
  res
}

#' @export
is.roll = function(x){
  #inherits(x,"roll")
  is(x,"roll")
}

#' @export
print.roll = function(x){
  cat('object "roll"\n\n')
  cd = x$rolls
  print(cd)
  invisible(x)
}

# private function to check vector of 'times'
check_times = function(times){
  # integer, greater than 0
  if(times <=0){
    stop("times must be greater than 0")
  }
  if((times %% 1) != 0){
    stop("times must be an integer number")
  }
  TRUE
}

# #test
# fair_die = die()
# set.seed(123)
# fair_50rolls = roll(fair_die,times=50)
# fair_50rolls
#
# #test
# str_die = die(sides = c('a', 'b', 'c', 'd', 'e', 'f'),
#               prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
# set.seed(123)
# str_rolls = roll(str_die,times=20)
# names(str_rolls)
# str_rolls

#' @title Summary.roll
#' @description Creates an object of class \code{"summary.roll"}
#' @param x an object of class 'roll'
#' @return an object of class \code{"summary.roll"}
#' @export
#' @examples
#' # default
#' fair_die = die()
#' roll1 <- roll(fair_die,50)
#' roll_sum = summary(roll1)
#'
summary.roll = function(x){
  # structure(object,class=c("summary.roll", class(object)))
  if(!is.roll(x)){
    stop("not a roll object")
  }
  # if(x$total <6){
  #   freqs_side = x$sides
  #   count=c(data.frame(table(x$rolls))$Freq,rep(0,6-x$total+1))
  #   prop = count/(sum(count))
  #   freqs = data.frame(side=freqs_side,count,prop,stringsAsFactors = FALSE)
  # }else{
  freqs_side = names(table(x$rolls))
  count = data.frame(table(x$rolls))$Freq
  prop = count/(sum(count))
  freqs = data.frame(side=freqs_side,count,prop,stringsAsFactors = FALSE)

  object = list(freqs = freqs)
  class(object) = "summary.roll"
  return(object)
}

#' @export
print.summary.roll = function(x){
  cat('summary "roll"\n\n')
  cd = data.frame(x$freqs)
  print(cd)
  invisible(x)
}

# set.seed(123)
# fair_50rolls <- roll(fair_die, times = 50)
# fair50_sum <- summary(fair_50rolls)
# fair50_sum

# class(fair50_sum)
# names(fair50_sum)

# 5) Additional Methods
#replacement

#' @export
"[<-.roll" <- function(x, i, value) {
  logi = any(value == x$sides)
  if (!logi) {
    stop("replace value must be an element of sides")
  }
  if (i > x$total) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] = value
  make_roll(x$sides,x$prob,x$rolls,x$total)
}
# b[51]=1
# # expected error
# b[1]="a"
# #expected error

#extraction
#' @export
"[.roll" <- function(x, i) {
  x$rolls[i]
}
#Addition method
#' @export
"+.roll" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament (must be positive)")
  }

  more_rolls = sample(obj$sides,replace = TRUE,incr)
  make_roll(obj$sides, obj$prob,c(obj$rolls,more_rolls),times=obj$total+incr)
}
