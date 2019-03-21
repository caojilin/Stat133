# ===================================================================
# Title: Data Preparation
# Description: This file is to create a new data frame using existed five csv files.The output file will
# be used further by another scripts.
# Input(s): data file 'nba2017-players.csv'
# Output(s): data file 'shots-data.csv'
# Author: Jilin Cao
# Date: 2-28-2018
# ===================================================================

Curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
name = c('Stephen Curry')
Curry = cbind(Curry,name)

Angre <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
Angre[,'name']=c('Andre Iguodala')

Green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
Green[,'name']=c('Graymond Green')

Durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
Durant[,'name']=c('Kevin Durant')

Klay <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
Klay[,'name']=c('Klay Thompson')

Curry[Curry$shot_made_flag=='y',"shot_made_flag"] =c('made shot')
Curry[Curry$shot_made_flag=='n',"shot_made_flag"] =c('missed shot')

func = function(a) {
  a[a$shot_made_flag=='y',"shot_made_flag"] =c('made shot')
  a[a$shot_made_flag=='n',"shot_made_flag"] =c('missed shot')
  return(a)
}
Green = func(Green)
Klay = func(Klay)
Durant = func(Durant)
Angre = func(Angre)

players = list(Curry, Angre,Durant ,Klay,Green)
add_column = function(dat){
  dat$minute = dat$period*12-dat$minutes_remaining  
  return(dat)
}
# for(dat in players){
#   dat = add_column(dat)
# }
Curry = add_column(Curry)
Green = add_column(Green)
Klay = add_column(Klay)
Durant = add_column(Durant)
Angre = add_column(Angre)

sink_file = function(dat){
  sink(file = '../output/andre-iguodala-summary.txt')
  summary(dat)
  sink()
}
name_list = list('andre-iguodala','stephen-curry','kevin-durant','klay-thompson','draymond-green')
sink(file = '../output/andre-iguodala-summary.txt')
summary(Angre)
sink()
sink(file = '../output/stephen-curry-summary.txt')
summary(Curry)
sink()
sink(file = '../output/kevin-durant-summary.txt')
summary(Durant)
sink()
sink(file = '../output/klay-thompson-summary.txt')
summary(Klay)
sink()
sink(file = '../output/draymond-green-summary.txt')
summary(Green)
sink()

shots_data = rbind(Curry,Angre,Durant,Klay,Green)
write.csv(shots_data,file='../data/shots-data.csv',row.names = FALSE)

sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()
