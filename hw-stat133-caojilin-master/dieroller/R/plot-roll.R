#' @title Plot of object roll
#' @description Plots the relative frequencies of a series of rolls
#' @param object an object of class \code{"roll"}
#' @export
#' @examples
#'  \dontrun{
#'  # create a die and roll it 50 times
#'  die1 <- die()
#'  roll50 <- roll(die1, times = 50)
#'
#'  plot(roll50)
#'  }
#need names and dump grids
plot.roll = function(object){
  a = summary(object)
  a=a$freqs
  # attributes(a) = NULL
  # a=as.data.frame(a)
  # ggplot(data = a,aes(x=a$side,y=a$prop)) +geom_bar(stat = "identity")
  barplot(a$prop,names.arg = object$sides,xlab = "side of a die",ylab = "relative frequencies",
          main = paste("Frequency in a series of",object$total ,"die rolls" ))
}

#
# # plot method
# plot(fair_50rolls)
