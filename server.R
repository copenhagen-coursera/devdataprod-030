library(shiny)
library(ggplot2)

mtcars$cyl<-as.factor(mtcars$cyl)

mtcars$am<-as.factor(mtcars$am)
mtcars$gear<-as.factor(mtcars$gear)
mtcars$carb<-as.factor(mtcars$carb)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
  
    colorBy <- input$mtcar_variable
    
    # draw the histogram with the specified number of bins
    ggplot( data = mtcars,  aes_string(input$xvariable, input$yvariable,colour=colorBy)) + geom_point()
  })
})