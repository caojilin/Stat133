# The script file
# should have a header with fields like title, and description.
#what's this exactly?


#title: binomial-functions
#description: Implement a lot of functions for binomial distribution
#author: "caojilin"
#date: "3/16/2018"

#' @title is_integer
#' @description tests a single number is integer or not
#' @param num single number
#' @return TRUE integer False not integer
is_integer = function(num){
  if  (num %% 1 == 0){
    TRUE
  }else{
    FALSE
  }
}
# TRUE's
is_integer(-1)
is_integer(0)
is_integer(2L)
is_integer(2)
# FALSE's
is_integer(2.1)
is_integer(pi)
is_integer(0.01)

#' @title is_positive
#' @description tests a single number is positive or not
#' @param num single number
#' @return TRUE positive False not positive
is_positive = function(num){
  if (num ==0 || num <0){
    FALSE
  }else{
    TRUE
  }
}
# TRUE's
is_positive(0.01)
is_positive(2)
# FALSE's
is_positive(-2)
is_positive(0)

#' @title is_nonnegative
#' @description tests a single number is nonnegative or not
#' @param num single number
#' @return TRUE nonnegative False not nonnegative
is_nonnegative = function(num){
  if(num >= 0){
    TRUE
  }else{
    FALSE
  }
}
# TRUE's
is_nonnegative(0)
is_nonnegative(2)
# FALSE's
is_nonnegative(-0.00001)
is_nonnegative(-2)

#' @title is_positive_integer
#' @description tests a single number is positive_integer or not
#' @param num single number
#' @return TRUE is_positive_integer False not positive_integer
is_positive_integer = function(num){
  if (is_integer(num) && is_positive(num)){
    TRUE
  }else{
    FALSE
  }
}
# TRUE
is_positive_integer(2)
is_positive_integer(2L)
# FALSE
is_positive_integer(0)
is_positive_integer(-2)

#' @title is_nonneg_integer
#' @description tests a single number is is_nonneg_integer or not
#' @param num single number
#' @return TRUE is_nonneg_integer False not is_nonneg_integer
is_nonneg_integer = function(num){
  if(is_integer(num) && is_nonnegative(num)){
    TRUE
  }else{
    FALSE
  }
}
# TRUE's
is_nonneg_integer(0)
is_nonneg_integer(1)
# FALSE
is_nonneg_integer(-1)
is_nonneg_integer(-2.5)

#' @title is_probability
#' @description tests a single number is is_probability or not
#' @param num single number
#' @return TRUE is_probability False not is_probability
is_probability = function(num){
  if(num <=1 && num >=0 ){
    TRUE
  }else{
    FALSE
  }
}
# TRUE's
is_probability(0)
is_probability(0.5)
is_probability(1)
# FALSE's
is_probability(-1)
is_probability(1.0000001)

#' @title bin_factorial
#' @description tests a single number is bin_factorial or not
#' @param num single number
#' @return factorial of a number
bin_factorial = function(num){
  if(num == 0 ){
    1
  }else{
    prob = 1
    for( i in 1:num){
      prob = prob*i
    }
    return(prob)
  }
}

# valid
bin_factorial(5)

bin_factorial(0)

#' @title bin_combinations
#' @description calculates the number of combinations 
#' in which k successes can occur in n trials
#' @param n,k two positive integer number
#' @return the number of combinations
bin_combinations = function(n,k){
  bin_factorial(n)/(bin_factorial(k)*bin_factorial(n-k))
}
bin_combinations(n = 5, k = 2)
bin_combinations(10, 3)
bin_combinations(4, 4)

#' @title bin_probability
#' @description calculates bin_probability, probability of getting k success in n trials
#' with individual probability prob
#' @param trials,success,prob trials,sucess,and probability of success
#' @return the probability of k success in n trails
bin_probability = function(trials,success,prob){
  if(is_nonneg_integer(trials) == FALSE || is_nonneg_integer(success)==FALSE){
    stop("Your trials or success should be nonnegative integer")
  }else if(is_probability(prob)==FALSE){
    stop("Your probability should be in 0 to 1")
  }else{
    comba = bin_combinations(trials,success)
    comba*(prob^success)*(1-prob)^(trials-success)
  }
}
# probability of getting 2 successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(trials = 5, success = 2, prob = 0.5)

#' @title bin_distribution
#' @description calculates bin_distribution, distribution of a binomial function
#' @param trials,prob trials and probability of success 
#' @return the distribution of a binomial for n trials
bin_distribution = function(trials,prob){
 success = 0:trials
 probability = rep(0,trials+1)
 for (i in success){
   probability[i+1] = bin_probability(trials,i,prob)
 }
 return(data.frame(success = success,probability=probability))
}
# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)



