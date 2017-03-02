library(shiny)
library(plotly)

# Define UI for application that draws a spirograph
shinyUI(fluidPage(

  # Application title
  titlePanel("Spirograph"),

  sidebarLayout(

    sidebarPanel(
      # input sliders
      sliderInput(inputId="n1",label="n1",value=13,min=-10,max=20,step=1),
      sliderInput(inputId="n2",label="n2",value=-7,min=-10,max=20,step=1),
      sliderInput(inputId="n3",label="n3",value=-3,min=-10,max=20,step=1)
    ),

    mainPanel(
      # output plot
      plotlyOutput("spirograph")
    )
  )
))
