library(shiny)
library(plotly)
library(dplyr)

shinyServer(function(input, output) {
  #data <- iris

  output$plot <- renderPlotly({
    x <- list(
      title = "Sepal length"
    )
    y <- list(
      title = "Petal Length"
    )
    
    if (input$radio == 'versicolor') {
      data <- filter(iris, Species == 'versicolor')
    } else if (input$radio == 'setosa') {
      data <- filter(iris, Species == 'setosa')
    } else if (input$radio == 'virginica'){
      data <- filter(iris, Species == 'virginica')
    }
    
    if (input$select == 1) {
      length <- select(data, contains(Sepal.Length))
      width <- select(data, contains(Sepal.Width))
    } else {
      length <- select(data, contains(Petal.Length))
      width <- select(data, contains(Petal.Width))
    }
    plot_ly(data = data, x = width[,1], y = length[,1], mode = "markers",
                 color = Species) %>% 
        layout(xaxis=x, yaxis=y)
    output$value <- renderPrint({ input$slider1 })
  })
})