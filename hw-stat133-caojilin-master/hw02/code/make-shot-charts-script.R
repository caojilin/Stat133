# ===================================================================
# Title: Charts and Graph
# Description:
#   This script is to generate each player's shot charts.
# Input(s): nba-court.jpg, make-shots-data-script.R
# Output(s): A set of pdf files.
# Author: Jilin Cao
# Date: 2-28-2018
# ===================================================================
# scatterplot
source(file = '../code/make-shots-data-script.R')
library(ggplot2)
library(jpeg)
library(grid)
klay_scatterplot <- ggplot(data = Klay) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
klay_scatterplot
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(readJPEG(court_file),
                          width = unit(1, "npc"),
                          height = unit(1, "npc"))
# shot chart with court background
klay_shot_chart <- ggplot(data = Klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
klay_shot_chart

file_list = list('andre-iguodala-shot-chart.pdf',
                 'draymond-green-shot-chart.pdf',
                 'kevin-durant-shot-chart.pdf',
                 'klay-thompson-shot-chart.pdf',
                 'stephen-curry-shot-chart.pdf')
name_list = list('Angre Iguodala','Draymond Green','Kevin Durant','Klay Thompson','Stephen Curry')

players = list(Angre,Green,Durant,Klay,Curry)


make_graph = function(dat, f, n){
  pdf(file =paste0('../images/', f),height=5,width=6.5)
  ggplot(data = dat) +
    annotation_custom(court_image, -250, 250, -50, 420) +
    geom_point(aes(x = x, y = y, color = shot_made_flag)) +
    ylim(-50, 420) +
    ggtitle(paste0('Shot Chart: ', n,'(2016 season)')) +
    theme_minimal()
  dev.off()
}

for (i in 1:5) {
  make_graph(players[[i]],file_list[[i]],name_list[[i]])
}

pdf(file =paste0('../images/', 'andre-iguodala-shot-chart.pdf'),height=5,width=6.5)
ggplot(data = Angre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle(paste0('Shot Chart: ','Angre Iguodala','(2016 season)')) +
  theme_minimal()
dev.off()
pdf(file =paste0('../images/', 'draymond-green-shot-chart.pdf'),height=5,width=6.5)
ggplot(data = Green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle(paste0('Shot Chart: ','Draymond Green','(2016 season)')) +
  theme_minimal()
dev.off()
pdf(file =paste0('../images/', 'kevin-durant-shot-chart.pdf'),height=5,width=6.5)
ggplot(data = Durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle(paste0('Shot Chart: ', 'Kevin Durant','(2016 season)')) +
  theme_minimal()
dev.off()
pdf(file =paste0('../images/', 'klay-thompson-shot-chart.pdf'),height=5,width=6.5)
ggplot(data = Klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle(paste0('Shot Chart: ', 'Klay Thompson','(2016 season)')) +
  theme_minimal()
dev.off()
pdf(file =paste0('../images/', 'stephen-curry-shot-chart.pdf'),height=5,width=6.5)
ggplot(data = Curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle(paste0('Shot Chart: ', 'Stephen Curry','(2016 season)')) +
  theme_minimal()
dev.off()


pdf(file =paste0('../images/', 'gsw-shot-chart.pdf'),height=7,width=8)
ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +facet_wrap(~ name)+
  ggtitle(paste0('Shot Chart: ', 'GSW','(2016 season)')) +
  theme_minimal()
dev.off()

