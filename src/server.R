library(shiny)
library(ggplot2)
library(plotly)

spiro <- function(n1,n2,n3) {
  t <- seq(0,1,length.out=1000)
  z <- exp(1i*2*pi*n1*t) + exp(1i*2*pi*n2*t) + exp(1i*2*pi*n3*t)
  result <- data.frame(x=Re(z),y=Im(z))
  return (result)
}

# Define server logic required to draw a spirograph
server <- function(input, output) {
  output$spirograph <- renderPlotly({
    result <- spiro(input$n1,input$n2,input$n3)
    ggplot(data=result,aes(x=x,y=y)) +
        geom_path() +
        xlab("Real(z)") +
        ylab("Imag(z)")
  })
}

