#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of repetitions:",
                     min = 1,
                     max = 5000,
                     value = 1000)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  draw = function(repetition){
    box1 = c(rep("blue",2),"red")
    box2 = c(rep("blue",2),rep("red",3),"white")

    drawn_balls = matrix("",nrow = repetition,ncol = 4)
    
    set.seed(345)
    for(i in 1:repetition){
      #select a box
      num = runif(1)
      if(num > 0.5){
        drawn_balls[i,] = sample(box1,4,replace = TRUE)
      }else{
        drawn_balls[i,] = sample(box2,4)
      }
    }
    count_freq = function(vec){
      freq=c()
      for(i in 1:repetition){
        num = 0
        for (j in drawn_balls[i,]) {
          if(j == "blue"){
            num = num + 1
          }
        }
        freq = c(freq,num)
      }
      return(freq)
    }
    freq = count_freq(drawn_balls)
    table(freq)
    x = 1:repetition
    prob_0 = data.frame(freqs = cumsum(freq == 0)/1:repetition,number=0,reps=x)
    prob_1 = data.frame(freqs = cumsum(freq == 1)/1:repetition,number=1,reps=x)
    prob_2 = data.frame(freqs = cumsum(freq == 2)/1:repetition,number=2,reps=x)
    prob_3 = data.frame(freqs = cumsum(freq == 3)/1:repetition,number=3,reps=x)
    prob_4 = data.frame(freqs = cumsum(freq == 4)/1:repetition,number=4,reps=x)
    dat = rbind(prob_0,prob_1,prob_2,prob_3,prob_4)
    dat$number = factor(dat$number)
    
    # use factor to use color 
    ggplot(data = dat,aes(reps,freqs)) + geom_path(aes(group=number,color=number)) 
  }
  output$distPlot <- renderPlot({ 
    draw(input$bins)
  })
}


# Run the application 
shinyApp(ui = ui, server = server)

