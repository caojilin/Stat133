# ===================================================================
# Title: NBA Player Data
# Description:
#   This script performs data analysis on 
#   various columns of the raw data file.
# Input(s): data file 'nba2017-players.csv'
# Output(s): data file 'nba2017-players.csv'
# Author: Jilin Cao
# Date: 2-28-2018
# ===================================================================
# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

column_type = c(
  player = col_character(),
  team = col_character(),
  position = col_character(),
  height = col_integer(),
  weight = col_integer(),
  age = col_integer(),
  experience = col_integer(),
  college = col_character(),
  salary = col_double(),
  games = col_integer(),
  minutes = col_integer(),
  points = col_integer(),
  points3 = col_integer(),
  points2 = col_integer(),
  points1 = col_integer()
)
dat = read_csv('../data/nba2017-players.csv',col_types = column_type,na='NA')
head(dat)
warriors = arrange(filter(dat,team=='GSW'),salary)
write.csv(warriors,file='../data/warriors.csv',row.names = FALSE)
lakers = arrange(filter(dat,team=="LAL"),desc(experience))
write.csv(lakers,file='../data/lakers.csv',row.names = FALSE)

sink(file = '../output/data-structure.txt')
str(dat)
sink()

sink(file = '../output/summary-warriors.txt')
summary(warriors)
sink()

sink(file = '../output/summary-lakers.txt')
summary(lakers)
sink()

?png
png(filename = '../images/scatterplot-height-weight.png',pointsize=20)
plot(dat$height,dat$weight,xlab='Height',ylab='Weight')
dev.off()

jpeg(filename ='../images/histogram-age.jpeg',height=400,width=600)
hist(dat$age,main='Age')
dev.off()

pdf(file ='../images/histogram-age.pdf',height=5,width=7)
hist(dat$age,xlab = 'age',ylab = 'frequency',main='Player Age',col='gray80',las=1)
dev.off()

gg_pts_salary = ggplot(data=select(dat,points,salary))+geom_point(aes(x=points,y=salary))
ggsave('../images/points_salary.pdf',width=7,height=5,units='in')

gg_ht_wt_positions = ggplot(data=dat,aes(x=height,y=weight))+geom_point()+facet_wrap(~ position)
ggsave('../images/height_weight_by_position.pdf',width=6,height=4,units='in')

dat %>%
  group_by(team) %>%
  select(team,player) %>%
  filter(team=='LAL')
  
dat %>%
  select(player,team,salary,position) %>%
  filter(team=='GSW',position=='PG') %>%
  select(player,salary)

dat %>%
  filter(salary <= 10000000 & experience >10) %>%
  select(player,age,team)

dat %>%
  filter(experience==0 & age==20) %>%
  select(player,team,height,weight) %>%
  slice(1:5)

gsw_mpg = dat %>%
            filter(team=='GSW') %>%
            mutate(min_per_game=minutes/games) %>%
            arrange(desc(min_per_game)) %>%
            select(player,experience,min_per_game)

dat %>%
  group_by(team) %>%
  summarise(ave3=mean(points3)) %>%
  arrange(desc(ave3)) %>%
  tail(5)  

dat %>%
  filter(experience <=10 & experience >=5) %>%
  filter(position=='PF') %>%
  summarise(ave_age=mean(age),sd_age=sd(age))
