library(shiny)
library(dplyr)
library(plotly)



shinyUI(fluidPage(
  titlePanel("Plot about Irises (Flowers not Eyes)"),
  sidebarPanel(
    radioButtons("radio", label = h3("Select Species"),
               choices = list("setosa" = 'setosa', "versicolor" = 'versicolor', "virginica" = 'virginica'), 
               selected = "setosa"),

    selectInput("select", label = h3("Select Petal or Sepal"), 
                choices = list("Sepal" = 1, "Petal" = 2), 
                selected = 1),

  mainPanel(
    
    plotlyOutput("plot")
 )
  )  
))