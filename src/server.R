library(shiny)

spiro <- function(n1,n2,n3) {
  t <- seq(0,1,length.out=1000)
  z <- exp(1i*2*pi*n1*t) + exp(1i*2*pi*n2*t) + exp(1i*2*pi*n3*t)
  result <- data.frame(x=Re(z),y=Im(z))
  return (result)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$spirograph <- renderPlot({
    result <- spiro(input$n1,input$n2,input$n3)
    plot(result,type="l")
  })
})
