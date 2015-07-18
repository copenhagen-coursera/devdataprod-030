library(shiny)

selectableFeatures <- names(mtcars)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Exploratory Data Util for MTCars"),
  
  # Sidebar with a slider input for the number of bins

  navbarPage("Choose Deck:", id="nav",
  tabPanel("Explore Data",  
  sidebarLayout(
    sidebarPanel(
      column(3,
      radioButtons('xvariable', 'X',
                   selectableFeatures  , selected = "wt")),
      column(3,radioButtons('yvariable', 'Y',
                   selectableFeatures  , selected = "mpg")),
      column(3,radioButtons('mtcar_variable', 'Color:',
                   selectableFeatures  , selected = "am"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
  ),
  tabPanel("Documentation",
         includeMarkdown("readme.html"))


  
)


))
