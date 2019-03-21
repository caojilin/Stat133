library(testthat)
stat_range = function(x){
  max(x) - min(x)
}
stat_centers = function(x){
  return(c(mean(x),median(x)))
}
stat_spreads = function(x){
  return(c(stat_range(x),IQR(x),sd(x)))
}


